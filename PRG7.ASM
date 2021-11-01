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
;               Initialize system.                                             ;
;------------------------------------------------------------------------------;
Reset:
        sei                     ; Ignore IRQs.
        cld                     ; Disable decimal mode.
        ldx     #$40
        stx     $4017           ; Disable APU frame IRQ.
        ldx     #$ff            
        txs                     ; Initialize stack.
        inx                     ; X is now 0.
        stx     $2000           ; Disable NMI.
        stx     $2001           ; Disable rendering.
        stx     $4010           ; Disable DMC IRQs.
        bit     $2002           ; Clear vblank flags.
;        
;       First wait to make sure PPU is stable.        
@WaitBlank1:
        bit     $2002
        bpl     @WaitBlank1     ; Jump back to wait.
;        
;       Fill memory with 0s.
        txa                     ; X is still 0.
@ClearMem:
        sta     $000, x
        sta     $100, x
        sta     $200, x
        sta     $300, x
        sta     $400, x
        sta     $500, x
        sta     $600, x 
        sta     $700, x
        inx
        bne     @ClearMem       ; Jump back if not finished.
;        
;       Second wait for vblank. 
@WaitBlank2:
        bit     $2002
        bpl     @WaitBlank2     ; Jump back to wait.
;        
;       PPU is stable at this point.
;       Load initial palette.
@LoadPalette:
        lda     $2002           ; Reset PPU high/low latch,
        lda     #$3f
        sta     $2006           ; Write high byte.
        lda     #$00
        sta     $2006           ; Write low byte.
        ldx     #0              ; X starts at 0.
@LoadPaletteLoop:
        lda     PaletteData, x  ; Load data from address of PaletteData + x
        sta     $2007           ; Write data to PPU.
        inx
        cpx     #16
        bne     @LoadPaletteLoop; Jump back if not finished.
;
;       Load CHR
@LoadCHR:
        lda     #1              ; Bank 1.
        sta     $8001           ; Change bank.
;
        lda     $2002           ; Reset PPU high/low latch.
        lda     #0
        sta     $2006           ; Write high byte.
        sta     $2006           ; Write low byte.
        ldx     #0              ; X starts at 0.
@LoadCHRLoop0:
        lda     CHRData, x
        sta     $2007
        inx
        bne     @LoadCHRLoop0
        ldx     #0              ; X starts at 0.
@LoadCHRLoop1:
        lda     (CHRData+256), x
        sta     $2007
        inx
        bne     @LoadCHRLoop1
        ldx     #0              ; X starts at 0.
@LoadCHRLoop2:
        lda     (CHRData+512), x
        sta     $2007
        inx
        bne     @LoadCHRLoop2       
;
;       Main menu background.
@LoadMainMenuBg:
        lda     $2002           ; Reset PPU high/low latch.
        lda     #$22
        sta     $2006           ; Write high byte.
        lda     #$8C
        sta     $2006           ; Write low byte.
        ldx     #0
@TxtLoop:
        lda     Txt_NewGame, x
        beq     @TxtEnd
        inx
        sta     $2007
        jmp     @TxtLoop
@TxtEnd:
        lda     $2002           ; Reset PPU high/low latch.
        lda     #$22
        sta     $2006           ; Write high byte.
        lda     #$EC
        sta     $2006           ; Write low byte.
        ldx     #0
@TxtLoop1:
        lda     Txt_Continue, x
        beq     @TxtEnd1
        inx
        sta     $2007
        jmp     @TxtLoop1
@TxtEnd1:
;
;       Enable rendering.
@EnableRendering:
        lda     #%00011110
        sta     $2001
;       
;       Disable scrolling.
        lda     #$00
        sta     $2005
        sta     $2005
;
;       Enable Sprites.
@EnableSprites:
        lda     #0
        sta     $2003
        lda     #$20
        sta     $4014
;
        jmp     Forever         ; Start looping forever.
;
;------------------------------------------------------------------------------;
;               Wait for Vblank                                                ;
;------------------------------------------------------------------------------;
WaitBlank:
        bit     $2002
        bpl     WaitBlank
        rts
;
;------------------------------------------------------------------------------;
;               Read Controller States                                         ;
;------------------------------------------------------------------------------;
ReadController:
@LatchButtons:
        lda     #1
        sta     $4016
        lda     #0
        sta     $4016
;
        ldx     #8
@Loop:
        lda     $4016
        lsr     a
        rol     Controller
        dex     
        bne     @Loop
        rts
;
;------------------------------------------------------------------------------;
;               Handle NMI.                                                    ;
;------------------------------------------------------------------------------;
NMI:
        rti
;
;------------------------------------------------------------------------------;
;               Loop forever.                                                  ;
;------------------------------------------------------------------------------;        
Forever:
        jsr     ReadController
;
@MainMenu:
        ldx     Controller
;
;       Check if Ui is not freezed.
@IfUiNotFreezed:
        lda     #0
        cmp     UiFreeze
        bne     @EndIfNotFreezed
;
@IfBtnAny:
        cmp     Controller
        beq     @EndIfBtnAny
;
        lda     #20
        sta     UiFreeze
@EndIfBtnAny:
;     
;       Check if DOWN is pressed.
@IfBtnDown:
        txa
;
        and     BtnDown     
        beq     @EndIfBtnDown
;
        inc     UiSelectCurrent
@ShouldMoveTop:
        lda     #2
        cmp     UiSelectCurrent
        bne     @EndIfBtnDown
;
        lda     #0
        sta     UiSelectCurrent
@EndIfBtnDown        
;
;       Check if UP is pressed.
@IfBtnUp:
        txa
;
        and     BtnUp     
        beq     @EndIfBtnUp
;
        dec     UiSelectCurrent
@ShouldMoveBottom:
        lda     #255
        cmp     UiSelectCurrent
        bne     @EndIfBtnUp
;
        lda     #1
        sta     UiSelectCurrent
@EndIfBtnUp:
@EndIfNotFreezed:
;
@IfFreezed:
        lda     #0
        cmp     UiFreeze
        beq     @EndIfFreezed
;               
        dec     UiFreeze
;
@EndIfFreezed:
;
        jsr     WaitBlank
;
        jmp     Forever
;
;------------------------------------------------------------------------------;
;               Palette.                                                       ;
;------------------------------------------------------------------------------;        
PaletteData:
;       Background.
        hex     3f2d3d30
        hex     3f16173d
        hex     3f20213d
        hex     3f24253d
;       Sprite.
        hex     3f121314
        hex     3f161718
        hex     3f202122
        hex     3f242526
;
;------------------------------------------------------------------------------;
;               Text.                                                          ;
;------------------------------------------------------------------------------;  
        .include        TXT.ASM         ; Text.
;