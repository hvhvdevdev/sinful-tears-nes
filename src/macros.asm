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
;    Macro: M_DrawText
;    
;===============================================================================
;
.macro  M_DrawText      TextSrc, PosHigh, PosLow
        lda     #PosHigh
        sta     TempA
        lda     #PosLow
        sta     TempB
        lda     #<TextSrc
        sta     SrcLo
        lda     #>TextSrc
        sta     SrcHi
        jsr     DrawText
.endm
;
;===============================================================================
;    Macro: M_DrawBox
;    
;===============================================================================
;
        i       =       0
        p       =       0
.macro  M_DrawBox       Pos, Width, BodyHeight 
        ldy     #>Pos
        ldx     #<Pos
        lda     #Width
        jsr     DrawBoxUpper
        i       =       1
        .rept   BodyHeight
        p       =       (i * $20) + Pos
        ldy     #>p
        ldx     #<p
        lda     #Width
        jsr     DrawBoxBody
        i       =       i + 1
        .endr
        p       =       (i * $20) + Pos
        ldy     #>p
        ldx     #<p
        lda     #Width
        jsr     DrawBoxLower
.endm
;
;===============================================================================
;    Macro: M_WriteToPPU
;    
;===============================================================================
;
.macro  M_WriteToPPU    Pos, Value
        lda     #>Pos
        sta     ADDR_PPUADDR
        lda     #<Pos
        sta     ADDR_PPUADDR
        lda     #Value
        sta     ADDR_PPUDATA
.endm
;
;===============================================================================
;    Macro: M_WriteToPPUMore
;    
;===============================================================================
;
.macro  M_WriteToPPUMore        Value
        lda     #Value
        sta     ADDR_PPUDATA
.endm
;