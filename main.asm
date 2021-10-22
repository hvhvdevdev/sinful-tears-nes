; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at https://mozilla.org/MPL/2.0/.

;;===================================================================
;;
;; INES header setup.
;;
;;===================================================================
    .inesprg 1              ; Bank of program code.
    .ineschr 1              ; Bank of picture data.
    .inesmap 0              ; Mapper.
    .inesmir 1              ; Mirror setting.

;;===================================================================
;;
;; Bank 0.
;;
;;===================================================================
    .bank 0
    
    .org $8000

;;===================================================================
;;
;; Initialize NES
;;
;;===================================================================
RESET:
    SEI
    CLD
    LDX  #$40    
    STX  $4017    
    LDX  #$FF    
    TXS          
    INX
    STX  $2000    
    STX  $2001    
    STX  $4010
    JMP  FOREVER

;;===================================================================
;;
;; Loop forever.
;;
;;===================================================================
FOREVER:
    JMP FOREVER