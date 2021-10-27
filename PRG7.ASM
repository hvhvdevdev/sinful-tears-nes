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
        bpl     @WaitBlank1
;        
;       Fill memory with 0s.
        txa                     ; X is still 0.
@ClearMem:
        sta     $000,x
        sta     $100,x
        sta     $200,x
        sta     $300,x
        sta     $400,x
        sta     $500,x
        sta     $600,x
        sta     $700,x
        inx
        bne     @ClearMem       ; Jump back if not finished.
;        
;       Second wait for vblank.
@WaitBlank2:
        bit     $2002
        bpl     @WaitBlank2
        jmp     Forever         ; Start looping forever.
;        
NMI:
        rti
;        
Forever:
        jmp     Forever