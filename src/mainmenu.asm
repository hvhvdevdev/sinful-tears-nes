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
        and     #%00010000
        beq     +
        jmp     Reset
        +
        ;       Wait for Vblank.
        -                       ; Start blocking.
        bit     ADDR_PPUSTATUS
        bpl     -               ; Continue blocking until Vblank.
        jmp     MmenLoop
;