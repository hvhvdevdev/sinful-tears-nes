;*******************************************************************************
;*                                                                             *
;*                      P R O J E C T:  T E A R                                *
;*                                                                             *
;*                      Copyright (C) 2021      hvhvdevdev                     *
;*                                                                             *
;*      This Source Code Form is subject to the terms of the Mozilla Public    *
;*      License, v. 2.0. If a copy of the MPL was not distributed with this    *
;*      file, You can obtain one at https://mozilla.org/MPL/2.0/.              *
;*                                                                             * 
;*******************************************************************************
;
;------------------------------------------------------------------------------;
;               Start Dungeon Mode                                             ;
;------------------------------------------------------------------------------;
DgnMain:
;       Initialize.
@Init:
        lda     $2002           ; Reset PPU high/low latch.
        lda     #$20
        sta     $2006           ; Write high byte.
        lda     #$00
        sta     $2006           ; Write low byte.
@FirstFourRows:
        jsr     DrawEmptyRow
        jsr     DrawEmptyRow
;
;       Second two rows.
        lda     #$0
        sta     $2007
        lda     #$26
        sta     $2007
;
        lda     #$27
        ldx     #20
@SecondTwoRowsLoop:
        sta     $2007
        dex
        bne     @SecondTwoRowsLoop
;
        lda     #$28
        sta     $2007
        lda     #$0
        sta     $2007
        lda     #$0
        sta     $2007
        lda     #$26
        sta     $2007
        lda     #$27
        sta     $2007
        lda     #$27
        sta     $2007
        lda     #$27
        sta     $2007
        lda     #$27
        sta     $2007
        lda     #$28
        sta     $2007
        lda     #0
        sta     $2007
;
;       Five rows
@FiveRows:
        jsr     DrawIoIoIoIRow
        jsr     DrawIoIoIoIRow
        jsr     WaitBlank
        jsr     DrawIoIoIoIRow
        lda     $2002
        lda     #$20
        sta     $2006
        lda     #$a0
        sta     $2006
        jsr     DrawIoIoIoIRow
        jsr     DrawIoIoIoIRow
        jsr     WaitBlank
        lda     $2002
        lda     #$20
        sta     $2006
        lda     #$e0
        sta     $2006
        jsr     DrawIoIoCoCRow
        lda     $2002
        lda     #$21
        sta     $2006
        lda     #$00
        sta     $2006
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     WaitBlank
        lda     $2002
        lda     #$21
        sta     $2006
        lda     #$60
        sta     $2006
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     WaitBlank
        lda     $2002
        lda     #$21
        sta     $2006
        lda     #$a0
        sta     $2006
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     WaitBlank
        lda     $2002
        lda     #$22
        sta     $2006
        lda     #$00
        sta     $2006
        jsr     DrawIoIoRow
        jsr     DrawYoYoRow
        jsr     DrawEmptyRow
        jsr     WaitBlank
        lda     $2002
        lda     #$22
        sta     $2006
        lda     #$60
        sta     $2006                
        jsr     DrawWoWoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawIoIoRow
        jsr     DrawYoYoRow        
;
;       Reset Scrolling.
@ResetScrolling:
        lda     #0
        sta     $2005
        sta     $2005
@Loop
        jsr     WaitBlank
        jmp     @Loop
;
        brk
;
;------------------------------------------------------------------------------;
;               I...I..I..I                                                    ;
;------------------------------------------------------------------------------;
DrawIoIoIoIRow:
        lda     #0
        sta     $2007
        lda     #$29
        sta     $2007
        lda     #0
        ldx     #20
@FRInner:
        sta     $2007
        dex
        bne     @FRInner
;
        lda     #$29
        sta     $2007
        lda     #$0
        sta     $2007
        sta     $2007
        lda     #$29
        sta     $2007
        lda     #$0
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        lda     #$29
        sta     $2007
        lda     #0
        sta     $2007
        rts
;------------------------------------------------------------------------------;
;               I...I..C..C                                                    ;
;------------------------------------------------------------------------------;
DrawIoIoCoCRow:
        lda     #0
        sta     $2007
        lda     #$29
        sta     $2007
        lda     #0
        ldx     #20
@FRInner:
        sta     $2007
        dex
        bne     @FRInner
;
        lda     #$29
        sta     $2007
        lda     #$0
        sta     $2007
        sta     $2007
        lda     #$2c
        sta     $2007
        lda     #$2d
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        lda     #$2e
        sta     $2007
        lda     #0
        sta     $2007
        rts
;
;------------------------------------------------------------------------------;
;               I...I..                                                  ;
;------------------------------------------------------------------------------;
DrawIoIoRow:
        lda     #0
        sta     $2007
        lda     #$29
        sta     $2007
        lda     #0
        ldx     #20
@FRInner:
        sta     $2007
        dex
        bne     @FRInner
;
        lda     #$29
        sta     $2007
        lda     #$0
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        rts
;
;------------------------------------------------------------------------------;
;               C...C..                                                        ;
;------------------------------------------------------------------------------;
DrawYoYoRow:
        lda     #0
        sta     $2007
        lda     #$2c
        sta     $2007
        lda     #$2d
        ldx     #20
@FRInner:
        sta     $2007
        dex
        bne     @FRInner
;
        lda     #$2e
        sta     $2007
        lda     #$0
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        rts
;
;------------------------------------------------------------------------------;
;               W...W..                                                        ;
;------------------------------------------------------------------------------;
DrawWoWoRow:
        lda     #0
        sta     $2007
        lda     #$26
        sta     $2007
        lda     #$2d
        ldx     #20
@FRInner:
        sta     $2007
        dex
        bne     @FRInner
;
        lda     #$28
        sta     $2007
        lda     #$0
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        sta     $2007
        rts
;
;------------------------------------------------------------------------------;
;               Empty                                                          ;
;------------------------------------------------------------------------------;
DrawEmptyRow:
        lda     #0
        ldx     #32
@FRInner:
        sta     $2007
        dex
        bne     @FRInner
;
        rts