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
;    Subroutine: UiStart
;    
;===============================================================================
;
UiStart:
        stx     UiCursorX
        sty     UiCursorStartY
;       Enable NMI.
        lda     #%10000000
        sta     ADDR_PPUCONTROLLER
        jmp     UiLoop
;
;===============================================================================
;    Subroutine: UiLoop
;    
;===============================================================================
;
UiLoop:
        jsr     ReadController
;       Is freezed?
        lda     #$00
        cmp     UiCooldown
        beq     @NotFreezed
;       Else...
        dec     UiCooldown
        jmp     @Freezed
@NotFreezed:
;       Test buttons.
        lda     #%00000100      ; Down DPAD.
        and     Controller
        beq     @NotDown
        inc     UiCurrent
@NotDown:
        lda     #%00001000      ; Up DPAD.
        and     Controller
        beq     @NotUp
        dec     UiCurrent
@NotUp:
        lda     #%00010000
        and     Controller
        beq     @NotStart
        lda     #$00
        sta     UiCursorY
        sta     UiCursorX
        rts
@NotStart
        lda     #$00
        cmp     Controller
        beq     @Freezed
        lda     #UI_COLDDOWN
        sta     UiCooldown
;       Out of range check.
        lda     UiCurrent
        cmp     UiMax
        bmi     @NotBelow     
        lda     #$00
        sta     UiCurrent
@NotBelow
        lda     #$80
        cmp     UiCurrent
        bcs     @Freezed
        lda     UiMax
        sta     UiCurrent
        dec     UiCurrent
@Freezed:
;       CursorY
        lda     UiCursorStartY
        ldx     UiCurrent
        -
        clc
        adc     #$10
        dex
        bne     -
        sta     UiCursorY
;       Wait Vblank.
        -
        bit     ADDR_PPUSTATUS
        bpl     -
        jmp     UiLoop
;
;===============================================================================
;    Subroutine: DrawBoxUpper
;       
;===============================================================================
;
DrawBoxUpper:
        pha
        -
        bit     ADDR_PPUSTATUS
        ; bpl     -
        lda     #$00
        sta     ADDR_PPUCONTROLLER
        sta     ADDR_PPUMASK
;       Reset latch.
        bit     ADDR_PPUSTATUS
;       Set PPUADDR
        sty     ADDR_PPUADDR
        stx     ADDR_PPUADDR
        pla
        tax
;       Top left.
        lda     #$01
        sta     ADDR_PPUDATA
        dex
        dex
;       Line.
        -
        lda     #$02
        sta     ADDR_PPUDATA
        dex
        bne     -
;       Top right.
        ldx     #$03
        stx     ADDR_PPUDATA
;       Enable rendering.
        -
        bit     ADDR_PPUSTATUS
        ; bpl     -
        lda     #%10000000
        sta     ADDR_PPUCONTROLLER
        lda     #%00011000
        sta     ADDR_PPUMASK
        rts         
;
;===============================================================================
;    Subroutine: DrawBoxLower
;       
;===============================================================================
;
DrawBoxLower:
        pha
        -
        bit     ADDR_PPUSTATUS
        ; bpl     -
        lda     #$00
        sta     ADDR_PPUCONTROLLER
        sta     ADDR_PPUMASK
;       Reset latch.
        bit     ADDR_PPUSTATUS
;       Set PPUADDR
        sty     ADDR_PPUADDR
        stx     ADDR_PPUADDR
        pla
        tax
;       Bottom left.
        lda     #$07
        sta     ADDR_PPUDATA
        dex
        dex
;       Line.
        -
        lda     #$08
        sta     ADDR_PPUDATA
        dex
        bne     -
;       Bottom right.
        ldx     #$09
        stx     ADDR_PPUDATA
;       Enable rendering.
        -
        bit     ADDR_PPUSTATUS
        ; bpl     -
        lda     #%10000000
        sta     ADDR_PPUCONTROLLER
        lda     #%00011000
        sta     ADDR_PPUMASK
        rts         
;
;===============================================================================
;    Subroutine: DrawBoxBody
;       
;===============================================================================
;
DrawBoxBody:
        pha
        -
        bit     ADDR_PPUSTATUS
        ; bpl     -
        lda     #$00
        sta     ADDR_PPUCONTROLLER
        sta     ADDR_PPUMASK
;       Reset latch.
        bit     ADDR_PPUSTATUS
;       Set PPUADDR
        sty     ADDR_PPUADDR
        stx     ADDR_PPUADDR
        pla
        tax
;       Top left.
        lda     #$04
        sta     ADDR_PPUDATA
        dex
        dex
;       Line.
        -
        lda     #$00
        sta     ADDR_PPUDATA
        dex
        bne     -
;       Top right.
        ldx     #$06
        stx     ADDR_PPUDATA
;       Enable rendering.
        -
        bit     ADDR_PPUSTATUS
        ; bpl     -
        lda     #%10000000
        sta     ADDR_PPUCONTROLLER
        lda     #%00011000
        sta     ADDR_PPUMASK
        rts         
;