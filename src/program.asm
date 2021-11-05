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
        lda     ADDR_PPUSTATUS
        lda     #0
        sta     ADDR_PPUSCROLL
        sta     ADDR_PPUSCROLL
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
;    PalettesData
;       Palettes data.
;===============================================================================
;
PalettesData:
;       Background.
        .hex     3f2d3d3c
        .hex     3f16173d
        .hex     3f20213d
        .hex     3f24253d
;       Sprite.
        .hex     3f2d3d30
        .hex     3f16173d
        .hex     3f20213d
        .hex     3f24253d
;