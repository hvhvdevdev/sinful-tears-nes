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
        lda     $2002           ; Reset PPU high/low latch,
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
        jmp     Forever         ; Start looping forever.
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
        .include        txt.asm         ; Text.
;