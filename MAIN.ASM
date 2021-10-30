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
;               Constants                                                      ;
;------------------------------------------------------------------------------;
Setting_Mirror          equ     %0001   ; Vertical mirroring.
Spr_Anim_Wait           equ     3       ; How many Vblank until next frame.
;  
;------------------------------------------------------------------------------;
;               Variables                                                      ;
;------------------------------------------------------------------------------;
        .enum $0000
;
Pcc_posX                .dsb    1       ; Single byte at 0x00.
Pcc_posY                .dsb    1       ; Single byte at 0x01.
;
SrcHi                   .dsb    2       ; Two bytes at 0x02.
        .ende
;
;------------------------------------------------------------------------------;
;               iNES header                                                    ;
;------------------------------------------------------------------------------;
        .db     "NES", $1a              ; Required identification.
        .db     $08                     ; How many 16KB PRG-ROM pages.
        .db     $00                     ; How many 8KB CHR-ROM pages.
        .db     $20|Setting_Mirror      ; Mapper 2 | Mirroring.
        .dsb    9, $00                  ; Zeroes remaining bytes.     
;
;------------------------------------------------------------------------------;
;               Program banks                                                  ;
;------------------------------------------------------------------------------;
;       Bank 0.
        .base           $8000
        .hex            00010203040506  ; Bank lookup table.
        .include        PRG0.ASM
        .org            $c000
;        
;       Bank 1.
        .base           $8000
        .hex            00010203040506  ; Bank lookup table.
        .include        PRG1.ASM
        .org            $c000        
;
;       Bank 2.        
        .base           $8000
        .hex            00010203040506  ; Bank lookup table.
        .include        PRG2.ASM
        .org            $c000
;       
;       Bank 3.
        .base           $8000
        .hex            00010203040506  ; Bank lookup table.
        .include        PRG3.ASM
        .org            $c000
;
;       Bank 4.
        .base           $8000
        .hex            00010203040506  ; Bank lookup table.
        .include        PRG4.ASM
        .org            $c000
;        
;       Bank 5.
        .base           $8000
        .hex            00010203040506  ; Bank lookup table.
        .include        PRG5.ASM
        .org            $c000
;        
;       Bank 6.        
        .base           $8000
        .hex            00010203040506  ; Bank lookup table.
        .include        PRG6.ASM
        .org            $c000
;
;       Bank 7 is fixed.      
        .base           $c000
        .include        PRG7.ASM
;        
;------------------------------------------------------------------------------;
;               Interrupt vectors                                              ;
;------------------------------------------------------------------------------;        
        .org            $fffa
;        
        .dw             NMI             ; Called when NMI happens.
        .dw             Reset           ; Called when CPU starts or resets.
        .dw             0               ; IRQ is not used.
;        