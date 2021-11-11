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
;    Subroutine: DgnStart
;       
;===============================================================================
;
DgnStart:
;       Disable rendering.
        bit     ADDR_PPUSTATUS
        lda     #$00
        sta     ADDR_PPUCONTROLLER
;       Load palettes.
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
;       Draw boxes.
        jsr     ClearScreen
        M_DrawBox       $2041, 22, 8
        M_DrawBox       $2058, 07, 5
        M_DrawBox       $21a1, 22, 13
        M_DrawText      TxtTopLine, $21, $c3
        M_DrawText      TxtNameGunar, $22, $03
        M_DrawText      TxtNameAmalia, $22, $43
        M_DrawText      TxtNameOlivia, $22, $83
        M_DrawText      TxtNameJoshep, $22, $c3
        M_DrawText      TxtNameRaito, $23, $03
        M_DrawText      TxtNameAlexei, $23, $43
        M_DrawText      TxtGold, $22, $78
        M_DrawText      TxtHerbs, $22, $d8
        M_DrawText      TxtDrink, $23, $38
;       Loop.
        jmp     DgnLoop
;
;===============================================================================
;    Subroutine: DgnLoop
;    
;===============================================================================
;
DgnLoop:
        jsr     ReadController
;       Disable rendering.
        lda     #$00
        sta     ADDR_PPUCONTROLLER
        bit     ADDR_PPUSTATUS
        lda     #$20
        sta     ADDR_PPUADDR
        lda     #$62
        sta     ADDR_PPUADDR
        ldx     #$80
        stx     ADDR_PPUDATA
        inx
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
;       Next row.
        bit     ADDR_PPUSTATUS
        lda     #$20
        sta     ADDR_PPUADDR
        lda     #$86
        sta     ADDR_PPUADDR
        ldx     #$80
        stx     ADDR_PPUDATA
        inx
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
;       Bottom row.
        bit     ADDR_PPUSTATUS
        lda     #$21
        sta     ADDR_PPUADDR
        lda     #$42
        sta     ADDR_PPUADDR
        ldx     #$8c
        stx     ADDR_PPUDATA
        inx
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
;       Previous row.
        bit     ADDR_PPUSTATUS
        lda     #$21
        sta     ADDR_PPUADDR
        lda     #$26
        sta     ADDR_PPUADDR
        ldx     #$8c
        stx     ADDR_PPUDATA
        inx
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
;       Right side.
        lda     #$20
        sta     ADDR_PPUADDR
        lda     #$72
        sta     ADDR_PPUADDR
        ldx     #$8c
        stx     ADDR_PPUDATA
        inx
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
;       Next row.
        lda     #$20
        sta     ADDR_PPUADDR
        lda     #$8e
        sta     ADDR_PPUADDR
        ldx     #$8c
        stx     ADDR_PPUDATA
        inx
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
;       Near bottom row.
        lda     #$21
        sta     ADDR_PPUADDR
        lda     #$2e
        sta     ADDR_PPUADDR
        ldx     #$80
        stx     ADDR_PPUDATA
        inx
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
;       Bottom row.
        lda     #$21
        sta     ADDR_PPUADDR
        lda     #$52
        sta     ADDR_PPUADDR
        ldx     #$80
        stx     ADDR_PPUDATA
        inx
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
        inx     
        stx     ADDR_PPUDATA
;       Horizontal line.
;
        lda     #$00
        sta     ADDR_PPUSCROLL
        sta     ADDR_PPUSCROLL
        lda     #%10000000
        sta     ADDR_PPUCONTROLLER
        -
        bit     ADDR_PPUSTATUS
        bpl     -
;
        jmp     DgnLoop
;
;===============================================================================
;    Text.
;===============================================================================
;
TxtTopLine              .db     " NAME  LIFE   MANA"
                        .db     0
TxtNameGunar            .db     "GUNNAR"
                        .db     0
TxtNameAmalia           .db     "AMALIA"
                        .db     0
TxtNameOlivia           .db     "OLIVIA"
                        .db     0
TxtNameJoshep           .db     "JOSHEP"
                        .db     0
TxtNameRaito            .db     "RAITO"
                        .db     0
TxtNameAlexei           .db     "ALEXEI"
                        .db     0
TxtGold                 .db     "CREDIT"
                        .db     0
TxtHerbs                 .db     "HERBS"
                        .db     0
TxtDrink                 .db     "E.DRINK"
                        .db     0
;