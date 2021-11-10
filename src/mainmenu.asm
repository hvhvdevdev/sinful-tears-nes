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
;    Subroutine: MmenMain
;    
;===============================================================================
;
MmenMain:
        jsr     ClearScreen
        M_DrawText      TxtNewGame, $22, $6c
        M_DrawText      TxtContinue, $22, $ac
        lda     #$02
        sta     UiMax
        ldx     #$4a
        ldy     #$97
        jsr     UiStart
        lda     #$00
        cmp     UiCurrent
        bne     +
        jmp     PrologStart
        +
        jmp     Reset
        jmp     MmenLoop
;
;===============================================================================
;    Subroutine: MmenLoop
;    
;===============================================================================
;
MmenLoop:
        jsr     ReadController
        lda     #$00
        sta     ADDR_PPUSCROLL
        sta     ADDR_PPUSCROLL
        lda     Controller
;       Start is pressed?
        and     #%00010000
        beq     +
;       True.
        jmp     PrologStart
;       End if.
        +
;       Wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
        jmp     MmenLoop
;
;===============================================================================
;    Text.
;===============================================================================
;
TxtNewGame              .db     "NEW GAME"
                        .db     0
TxtContinue             .db     "CONTINUE"
                        .db     0
;