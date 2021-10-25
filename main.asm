; Project: Sinful Tears
; Copyright (C) 2021 hvhvdevdev
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at https://mozilla.org/MPL/2.0/.

;;==============================================================================
;;
;; INES header setup.
;;
;;==============================================================================
    .INESPRG  1              ; Bank of program code.
    .INESCHR  1              ; Bank of picture data.
    .INESMAP  0              ; Mapper.
    .INESMIR  3              ; Mirror setting.

;;==============================================================================
;;
;; Bank 1.
;;
;;==============================================================================
    .BANK 1
    .ORG  $FFFA
    
    .WORD  0
    .WORD  RESET
    .WORD  0

;;==============================================================================
;;
;; Bank 0: Program.
;;
;;==============================================================================
    .BANK 0
    .ORG  $0000
    
PCC_XPOS:  .RS  1
PCC_YPOS:  .RS  1
    
    .ORG  $8000

;;==============================================================================
;;
;; Initialize NES
;;
;;==============================================================================
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
    
  ; Setup PPU.
    LDA  #%00001000
    STA  $2000
    LDA  #%00011110
    STA  $2001
    LDX  #$00
    LDA  #$3F
    STA  $2006
    LDA  #$00
    STA  $2006
    
  .LOAD_PALLETE:
    LDA  TILE_PALLETE, X
    STA  $2007
    INX  
    CPX  #32
    BNE  .LOAD_PALLETE
  
  ; Setup positions.  
    LDA  #20
    STA  PCC_XPOS
    STA  PCC_YPOS
    
  ; Start looping forever.  
    JMP FOREVER
    
;;==============================================================================
;;
;; Loop forever.
;;
;;==============================================================================
FOREVER:
    LDX  <PCC_YPOS
    INX
    STX  <PCC_YPOS
    LDX  <PCC_XPOS
    INX
    INX 
    STX  <PCC_XPOS
    JSR  WAIT_VBLANK 
    JMP  FOREVER

;;==============================================================================
;;
;; Wait for Vblank.
;;
;;==============================================================================
WAIT_VBLANK:
    LDA  $2002
    BPL  WAIT_VBLANK
  ; Tell $2003 to tell $2004 to start at $0000
    LDA  #$00
    STA  $2003
    LDA  #$00
    STA  $2003
  ; Load and store PCC_YPOS
    LDA  <PCC_YPOS
    STA  $2004
    LDA  #$00
    STA  $2004
    LDA  #$00
    STA  $2004
    LDA  <PCC_XPOS
    STA  $2004
    RTS


;;==============================================================================
;;
;; TILE PALLETE
;;
;;==============================================================================
TILE_PALLETE:
;   Backgrounds.
    .BYTE $05                   ; Universal Background.
    .BYTE $1a, $1b, $07, $00    ; Background Palette 0
    .BYTE $1a, $1b, $07, $00    ; Background Palette 1
    .BYTE $1a, $1b, $07, $00    ; Background Palette 2
    .BYTE $1a, $1b, $07, $00    ; Background Palette 3
;   Sprites.
    .BYTE $1a, $28, $04, $00    ; Sprite Palette 0
    .BYTE $1a, $1b, $07, $00    ; Sprite Palette 1
    .BYTE $1a, $1b, $07, $00    ; Sprite Palette 2
    .BYTE $1a, $1b, $06         ; Sprite Palette 3

    
;;==============================================================================
;;
;; Bank 2.
;;
;;==============================================================================
    .BANK 2
    .ORG  $0000
    
    .INCBIN "our.bkg"
    ;.INCBIN "our.spr"
    .BYTE %10000001, %00000001, %00000001, %00000001
    .BYTE %00000001, %00000000, %00000000, %00000001
    .BYTE %10000000, %00000000, %00000000, %00000001
    .BYTE %00000000, %00000000, %00000000, %00000001