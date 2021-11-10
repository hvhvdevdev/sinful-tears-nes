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
;    Subroutine: PrologStart
;    
;===============================================================================
;
PrologStart:
        jsr     ClearScreen
        lda     #$00
        sta     ADDR_PPUSCROLL
        sta     ADDR_PPUSCROLL
;-------------------------------------------------------------------------------
;    Display disclaimer.
;-------------------------------------------------------------------------------
;
        M_DrawText      TxtFictionDisclaimer, $21, $01
        M_DrawText      TxtFictionDisclaimer1, $21, $41
        M_DrawText      TxtFictionDisclaimer2, $21, $81
        M_DrawText      TxtFictionDisclaimer3, $21, $c1
        M_DrawText      TxtFictionDisclaimer4, $22, $01
;       Wait for so many frames.       
        ldx     #$60
        -
        bit     ADDR_PPUSTATUS
        bpl     -
        dex
        bne     -
;       Swap palettes.
        lda     ADDR_PPUSTATUS
        lda     #$3f 
        sta     ADDR_PPUADDR
        lda     #$01
        sta     ADDR_PPUADDR
        lda     #$22
        sta     ADDR_PPUDATA
;       Enable NMI.
        lda     #%10000000
        sta     ADDR_PPUCONTROLLER
;       Wait for so many frames.       
        ldx     #$30
        -
        bit     ADDR_PPUSTATUS
        bpl     -
        dex
        bne     -
;       Swap palettes.
        lda     ADDR_PPUSTATUS
        lda     #$3f 
        sta     ADDR_PPUADDR
        lda     #$01
        sta     ADDR_PPUADDR
        lda     #$02
        sta     ADDR_PPUDATA
;       Enable NMI.
        lda     #%10000000
        sta     ADDR_PPUCONTROLLER
;       Wait for so many frames.       
        ldx     #$30
        -
        bit     ADDR_PPUSTATUS
        bpl     -
        dex
        bne     -
;       Swap palettes.
        lda     ADDR_PPUSTATUS
        lda     #$3f 
        sta     ADDR_PPUADDR
        lda     #$01
        sta     ADDR_PPUADDR
        lda     #$01
        sta     ADDR_PPUDATA
;       Enable NMI.
        lda     #%10000000
        sta     ADDR_PPUCONTROLLER
;       Wait for so many frames.       
        ldx     #$30
        -
        bit     ADDR_PPUSTATUS
        bpl     -
        dex
        bne     -
;       Clear screen.
        jsr     ClearScreen
;-------------------------------------------------------------------------------
;    Display quote.
;-------------------------------------------------------------------------------
;
        M_DrawText      TxtNietzsche, $21, $01
        M_DrawText      TxtNietzsche1, $21, $41
        M_DrawText      TxtNietzsche2, $21, $8f

;
;       Loop.
        jmp     PrologLoop
;
;===============================================================================
;    Subroutine: PrologLoop
;    
;===============================================================================
;
PrologLoop:
        jsr     ReadController
;       Wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
;       Jump back.
        jmp     PrologLoop
;
;===============================================================================
;    Text.
;===============================================================================
;
TxtFictionDisclaimer    .db     "THIS IS A WORK OF FICTION."
                        .db     0
TxtFictionDisclaimer1   .db     "ANY RESEMBLANCE TO ACTUAL"
                        .db     0
TxtFictionDisclaimer2   .db     "PERSON, LIVING OR DEAD, OR"
                        .db     0
TxtFictionDisclaimer3   .db     "ACTUAL EVENT IS PURELY"
                        .db     0
TxtFictionDisclaimer4   .db     "CONCIDENTAL."
                        .db     0
TxtNietzsche            .db     "GOD IS DEAD. GOD REMAINS DEAD."
                        .db     0
TxtNietzsche1           .db     "AND WE HAVE KILLED HIM."
                        .db     0
TxtNietzsche2           .db     "NIETZSCHE, 1882"
                        .db     0
;