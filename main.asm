; Project: Sinful Tears
; Copyright (C) 2021 hvhvdevdev
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at https://mozilla.org/MPL/2.0/.
;
;;==============================================================================
;;
;; INES header setup.
;;
;;==============================================================================
    .INESPRG    1              ; Bank of program code.
    .INESCHR    1              ; Bank of picture data.
    .INESMAP    0              ; Mapper.
    .INESMIR    0              ; Mirror setting.
;
;;==============================================================================
;;
;; Bank 1.
;;
;;==============================================================================
    .BANK   1
    .ORG    $FFFA
;    
    .WORD   0
    .WORD   RESET
    .WORD   0
;
;;==============================================================================
;;
;; Bank 0: Program.
;;
;;==============================================================================
    .BANK   0
    .ORG    $0000
;    
PCC_XPOS:   .RS     1
PCC_YPOS:   .RS     1
;    
    .ORG    $8000
;
;;==============================================================================
;;
;; Initialize NES
;;
;;==============================================================================
RESET:
    SEI
    CLD
    LDX     #$40    
    STX     $4017    
    LDX     #$FF    
    TXS          
    INX
    STX     $2000    
    STX     $2001    
    STX     $4010
;    
;   Setup PPU.
    LDA     #%00001000
    STA     $2000
    LDA     #%00011110
    STA     $2001
    LDX     #$00
    LDA     #$3F
    STA     $2006
    LDA     #$00
    STA     $2006
    LDX     #$00
;
;   Palette loading.    
  .LOAD_PALLETE:
    LDA     TILE_PALLETE, X
    STA     $2007
    INX  
    CPX     #32
    BNE     .LOAD_PALLETE
;  
;   Setup positions.  
    LDA     #20
    STA     PCC_XPOS
    STA     PCC_YPOS
;    
;   Start looping forever.  
    JMP     FOREVER
;   
;;==============================================================================
;;
;; Loop forever.
;;
;;==============================================================================
FOREVER:
    LDX     <PCC_YPOS
    INX
    STX     <PCC_YPOS
    LDX     <PCC_XPOS
    INX
    INX 
    STX     <PCC_XPOS
    JSR     WAIT_VBLANK 
    JMP     FOREVER
;
;;==============================================================================
;;
;; Wait for Vblank.
;;
;;==============================================================================
WAIT_VBLANK:
    LDA     $2002
    BPL     WAIT_VBLANK
;   Tell $2003 to tell $2004 to start at $0000
    LDA     #$00
    STA     $2003
;   Load and store PCC_YPOS
    LDA     <PCC_YPOS
    STA     $2004
    LDA     #$00
    STA     $2004
    LDA     #$00
    STA     $2004
    LDA     <PCC_XPOS
    STA     $2004
    RTS
;
;;==============================================================================
;;
;; TILE PALLETES
;;
;;==============================================================================
TILE_PALLETE:
;   Backgrounds.    
    .BYTE   $0F                   ; Universal Background.
    .BYTE   $1b, $1a, $03, $0F    ; Background Palette 0
    .BYTE   $1c, $1b, $07, $0F    ; Background Palette 1
    .BYTE   $1d, $1b, $07, $0F    ; Background Palette 2
    .BYTE   $1b, $1b, $07, $3D    ; Background Palette 3
;   Sprites.
    .BYTE   $06, $03, $07, $0F    ; Sprite Palette 0
    .BYTE   $1b, $1b, $07, $0F    ; Sprite Palette 1
    .BYTE   $1b, $1b, $07, $0F    ; Sprite Palette 2
    .BYTE   $1b, $1b, $06         ; Sprite Palette 3
;   
;;==============================================================================
;;
;; Bank 2.
;;
;;==============================================================================
    .BANK   2
    .ORG    $0000
;
;   Backgrounds.    
BACKGROUND_DATA:
;   Background 0.
    .BYTE   %00001111   ; 1st plane.
    .BYTE   %00001111 
    .BYTE   %00001111 
    .BYTE   %00001111
    .BYTE   %11110000 
    .BYTE   %11110000 
    .BYTE   %11110000 
    .BYTE   %11110000
    .BYTE   %11110000   ; 2nd plane.
    .BYTE   %11110000 
    .BYTE   %11110000 
    .BYTE   %11110000
    .BYTE   %00001111 
    .BYTE   %00001111 
    .BYTE   %00001111 
    .BYTE   %00001111
;
BACKGROUND_DATA_END:
    .DS     4096 - (BACKGROUND_DATA_END - BACKGROUND_DATA)
;    
;   Sprites.
;   Sprite 0.
    .BYTE   %11111111   ; 1st plane.
    .BYTE   %10000001   
    .BYTE   %10000001   
    .BYTE   %10000001
    .BYTE   %10000001
    .BYTE   %10000001
    .BYTE   %10000001
    .BYTE   %10000001   
    .BYTE   %00000000   ; 2nd plane.
    .BYTE   %00000000
    .BYTE   %00000000
    .BYTE   %00000000
    .BYTE   %00000000
    .BYTE   %11111111 
    .BYTE   %00000000   
    .BYTE   %00000001
;