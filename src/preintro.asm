;*******************************************************************************
;*         _____ _       ____      __   ______                                 *
;*        / ___/(_)___  / __/_  __/ /  /_  __/__  ____ ___________             *
;*        \__ \/ / __ \/ /_/ / / / /    / / / _ \/ __ `/ ___/ ___/             *
;*       ___/ / / / / / __/ /_/ / /    / / /  __/ /_/ / /  (__  )              *
;*      /____/_/_/ /_/_/  \__,_/_/    /_/  \___/\__,_/_/  /____/               *                                                                                                      
;*                                                                             *
;*                                                                             *
;*                                                                             *
;*               Copyright (C) 2021 Aurora Realms Entertainment                *
;*                                                                             *
;*                                                                             *
;*                                                                             *
;*      This Source Code Form is subject to the terms of the Mozilla Public    *
;*      License, v. 2.0. If a copy of the MPL was not distributed with this    *
;*      file, You can obtain one at https://mozilla.org/MPL/2.0/.              *
;*                                                                             * 
;*******************************************************************************
;
;===============================================================================
;    Subroutine: Reset
;       Initialize system.    
;===============================================================================
;
Reset:
        sei                     ; Ignore IRQs.
        cld                     ; Disable decimal mode.
;       Initialize stack.
        ldx     #$ff
        txs                     ; FF to stack pointer.
        inx                     ; X is now 0.
;       Disable NMI and rendering.
        stx     ADDR_PPUCONTROLLER
        stx     ADDR_PPUMASK
;       Prepare to wait for Vblank.
        bit     ADDR_PPUSTATUS  ; Clear Vblank flags.
;       1st wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
;       Clear memory.
        txa                     ; X is still 0.
        -                       ; Loop starts here.
        sta     $000, x
        sta     $100, x
        sta     $200, x
        sta     $300, x
        sta     $400, x
        sta     $500, x
        sta     $600, x
        sta     $700, x        
        inx
        bne     -               ; Continue looping if not done.
;       2nd wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
;       PPU should be stable now.
;       Let's load palettes data.
        lda     ADDR_PPUSTATUS  ; Reset high/low latch.
        lda     #$3f            ;
        sta     ADDR_PPUADDR    ; Write high byte of address.
        lda     #$00            
        sta     ADDR_PPUADDR    ; Write low byte of address.
        ldx     #$00            ; Counter X starts at 0.
        -                       ; Loop starts here.
        lda     PalettesData, x ; Fetch palette to A.
        sta     ADDR_PPUDATA    ; Write value to PPU.
        inx
        cpx     #$20            ; Done yet?
        bne     -               ; Continue looping if not done.
;       Enable rendering.
        lda     #%00011110
        sta     ADDR_PPUMASK
;       Clear screen.
        jsr     ClearScreen
;       Draw intro text.
        M_DrawText      TxtSinfulTears, $20, $8a
        M_DrawText      TxtByAurora, $20, $c1
        M_DrawText      TxtPressStart, $22, $ea
        lda     #$00
        ldx     #$00
        .rept   26
        adc     #$02
        -
        bit     ADDR_PPUSTATUS
        bpl     -
        -
        bit     ADDR_PPUSTATUS
        bpl     -
        stx     ADDR_PPUSCROLL
        sta     ADDR_PPUSCROLL
        .endr
;       Start looping forever.
        jmp     Forerver
;
;===============================================================================
;    Subroutine: Forerver
;       Loop forever.
;===============================================================================
;
Forerver:
        jsr     ReadController
        lda     Controller
        and     #%00010000
        beq     +
        jmp     MmenMain
        +
;       Wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
        jmp     Forerver
;
;===============================================================================
;    Subroutine: NMI
;       Handle NMI interrupt.    
;===============================================================================
;
NMI:    
        pha
        lda     ADDR_PPUSTATUS
        lda     #0
        sta     ADDR_PPUSCROLL
        sta     ADDR_PPUSCROLL
;       Ui-related.
        lda     UiCursorY
        sta     $200
        lda     #$fe
        sta     $201
        lda     #00000010
        sta     $202
        lda     UiCursorX
        sta     $203
        lda     #$00
        sta     ADDR_OAMADDR
        lda     #$02
        sta     ADDR_OAMDMA
        inc     FrameMod255
        pla
        rti
;
;===============================================================================
;    Subroutine: ReadController
;       Update controller buttons.
;===============================================================================
;
ReadController:
;       Latch buttons.
        lda     #$01
        sta     ADDR_CONTROLLERPORT
        lda     #$00
        sta     ADDR_CONTROLLERPORT
        ldx     #$08
        -
        lda     ADDR_CONTROLLERPORT
        lsr     a
        rol     Controller
        dex     
        bne     -
        rts
;
;===============================================================================
;    Subroutine: DrawText
;       Draw text to PPUDATA.
;===============================================================================
;
DrawText:
        ldy     #$00
;       Start looping.
        -
        lda     ADDR_PPUSTATUS
        lda     TempA
        sta     ADDR_PPUADDR
        lda     TempB
        sta     ADDR_PPUADDR
        lda     (SrcLo), y
        sta     ADDR_PPUDATA
        pha
        iny
;       Delay.
        ldx     TXT_DRAW_DELAY
        --
        dex
        ---
        lda     #0
        sta     ADDR_PPUSCROLL
        sta     ADDR_PPUSCROLL
        bit     ADDR_PPUSTATUS
        bpl     ---
        cpx     #$00
        bne     --
        inc     TempB
;       Check if character is NULL.
        pla
        cmp     #$00
        bne     -
        rts
;
;===============================================================================
;    Subroutine: ClearScreen
;    
;===============================================================================
;
ClearScreen:
;       Disable NMI and rendering.
        ldx     #$00
        stx     ADDR_PPUCONTROLLER
        stx     ADDR_PPUMASK
;       First 6 rows.
        lda     ADDR_PPUSTATUS
        lda     #$20
        sta     ADDR_PPUADDR
        lda     #$00
        sta     ADDR_PPUADDR
        lda     #$00
        ldx     #$40
;       Start looping.
        -
        sta     ADDR_PPUDATA
        inx
        bne     -
;       Wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
;       Next 6 rows.
        lda     ADDR_PPUSTATUS
        lda     #$20
        sta     ADDR_PPUADDR
        lda     #$c0
        sta     ADDR_PPUADDR
        lda     #$00
        ldx     #$40
;       Start looping.
        -
        sta     ADDR_PPUDATA
        inx
        bne     -
;       Wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
;       Next 6 rows.
        lda     ADDR_PPUSTATUS
        lda     #$21
        sta     ADDR_PPUADDR
        lda     #$80
        sta     ADDR_PPUADDR
        lda     #$00
        ldx     #$40
;       Start looping.
        -
        sta     ADDR_PPUDATA
        inx
        bne     -
;       Wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
;       Next 6 rows.
        lda     ADDR_PPUSTATUS
        lda     #$22
        sta     ADDR_PPUADDR
        lda     #$40
        sta     ADDR_PPUADDR
        lda     #$00
        ldx     #$40
;       Start looping.
        -
        sta     ADDR_PPUDATA
        inx
        bne     -
;       Wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
;       Next 6 rows.
        lda     ADDR_PPUSTATUS
        lda     #$23
        sta     ADDR_PPUADDR
        lda     #$00
        sta     ADDR_PPUADDR
        lda     #$00
        ldx     #$40
;       Start looping.
        -
        sta     ADDR_PPUDATA
        inx
        bne     -
;       Wait for Vblank.
        -
        bit     ADDR_PPUSTATUS
        bpl     -
;       Enable rendering.
        lda     #%00011000
        sta     ADDR_PPUMASK

;       Return to caller.
        rts
;
;===============================================================================
;    PalettesData
;       Palettes data.
;===============================================================================
;
PalettesData:
;       Background.
        .hex     3f323d2a
        .hex     3f16173d
        .hex     3f20213d
        .hex     3f24253d
;       Sprite.
        .hex     3f2d3d30
        .hex     3f16173d
        .hex     3f20213d
        .hex     3f24253d
;
;===============================================================================
;    Text.
;===============================================================================
;
TxtPressStart           .db     "PRESS START";
                        .db     0
TxtSinfulTears          .db     "SINFUL TEARS";
                        .db     0
TxtByAurora             .db     "BY AURORA REALMS ENTERTAINMENT"
                        .db     0
;