;******************************************************************************;
;                                                                              ;
;           P R O J E C T:  Sinful Tears                                       ;
;                                                                              ;
;           Copyright (C)   2021    hvhvdevdev                                 ;
;                                                                              ;
;                                                                              ;
;   This Source Code Form is subject to the terms of the Mozilla Public        ;
;   License, v. 2.0. If a copy of the MPL was not distributed with this        ;
;   file, You can obtain one at https://mozilla.org/MPL/2.0/.                  ;
;                                                                              ;
;******************************************************************************;
;                                                                              ;
;   INES header setup.                                                         ;
;                                                                              ;
;******************************************************************************;
    .INESPRG    1               ; Bank of program code.
    .INESCHR    1               ; Bank of picture data.
    .INESMAP    0               ; Mapper: 0 = NROM.
    .INESMIR    0               ; Mirror setting.
;
;******************************************************************************;
;                                                                              ;
;   Bank 1: Interrupt                                                          ;
;                                                                              ;
;******************************************************************************;
    .BANK   1
    .ORG    $FFFA               ; Interrupt vectors.
;    
    .WORD   NMI                 ; Entry point when NMI happens.
    .WORD   RESET               ; Entry point when CPU turns on or resets.
    .WORD   0                   ; IRQ. Not used.
;
;******************************************************************************;
;                                                                              ;
;   Bank 0: Program.                                                           ;
;                                                                              ;
;******************************************************************************;
    .BANK   0
    .RSSET    $0000
;
;******************************************************************************;
;                                                                              ;
;   Variables & Constants                                                      ;
;                                                                              ;
;******************************************************************************;
FRAME_DELAY_AMOUNT  EQU     2         
FRAME_MOD_255:      .RS     1
FRAME_DELAY:        .RS     1
SPRITE_FRAME        .RS     1
SPRITE_FRAME_DELAY  .RS     1
;
PCC_XPOS:           .RS     1
PCC_YPOS:           .RS     1
;
CONTROLLER          .RS     1
;    
    .ORG    $8000
;
;******************************************************************************;
;                                                                              ;
;   RESET: Initialize NES.                                                     ;
;                                                                              ;
;******************************************************************************;
RESET:
    SEI
    CLD
;   APU initialization.
    LDX     #$40    
    STX     $4017
;   Stack initialization.    
    LDX     #$FF    
    TXS           
;   Setup PPU.
    INX
    STX     $4010   
    LDA     #%10001000
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
    JSR     CLEAR_MEM
;
;   Palette loading.    
    .LOAD_PALLETE:
    LDA     TILE_PALLETE, X
    STA     $2007
    INX  
    CPX     #32
    BNE     .LOAD_PALLETE
;  
;   Setup variables.  
    LDA     #0
    STA     PCC_XPOS
    STA     PCC_YPOS
    STA     FRAME_MOD_255
;    
;   Start looping forever.  
    JMP     FOREVER
;   
;******************************************************************************;
;                                                                              ;
;   NMI                                                                        ;
;                                                                              ;
;******************************************************************************;
NMI:
    LDX     <FRAME_MOD_255
    INX     
    STX     <FRAME_MOD_255
    LDX     <FRAME_DELAY
    INX
    STX     <FRAME_DELAY
    RTI     
;
;******************************************************************************;
;                                                                              ;
;   CLEAR_MEM                                                                  ;
;                                                                              ;
;******************************************************************************;
CLEAR_MEM:
    LDX     #$00
    .START:
    STA     $000,X
    INX     
    BNE     .START
    RTS
;
;******************************************************************************;
;                                                                              ;
;   RENDER                                                                     ;
;                                                                              ;
;******************************************************************************;
RENDER:
;   Tell $2003 to tell $2004 to start at $0000
    LDA     #$00
    STA     $2003
;   Y position.
    LDA     <PCC_YPOS
    STA     $2004
;   Tile index.
    LDA     <SPRITE_FRAME
    STA     $2004
;   Attributes.
    LDA     #$00
    STA     $2004
;   X position.
    LDA     <PCC_XPOS
    STA     $2004
;   Update.
    LDX     <SPRITE_FRAME
    LDY     <SPRITE_FRAME_DELAY
    INY
    CPY     #4
    BNE     .END_IF1
    LDY     #0
    .END_IF1:
    STY     SPRITE_FRAME_DELAY
;    CMP     #$0
;    BNE     .END_IF
;    CMP     #$40
;    BNE     .END_IF
;    CMP     #$20
;    BNE     .END_IF
    CPY     #0
    BNE     .END_IF2
    INX
    CPX     #2
    BNE     .END_IF2
    LDX     #0
    .END_IF2:
    STX     <SPRITE_FRAME
    RTS
;
;******************************************************************************;
;                                                                              ;
;   FOREVER: Loop forever                                                      ;
;                                                                              ;
;******************************************************************************;
FOREVER:
;    LDX     <FRAME_MOD_255
;    INX
;    STX     <FRAME_MOD_255
;   Check if enough frame skipped.
    .CHECK:
    LDX     #FRAME_DELAY_AMOUNT
    CPX     <FRAME_DELAY
    BCS     .CHECK
;   Otherwise, reset to 0.
    LDX     #0
    STX     <FRAME_DELAY
;
    LDX     <PCC_YPOS
    INX
    STX     <PCC_YPOS
    LDX     <PCC_XPOS
    INX
    INX 
    STX     <PCC_XPOS
    JSR     RENDER
    JSR     WAIT_VBLANK 
    JMP     FOREVER
;
;******************************************************************************;
;                                                                              ;
;   WAIT_VBLANK: Wait for Vblank                                               ;
;                                                                              ;
;******************************************************************************;
WAIT_VBLANK:
    LDA     $2002
    BPL     WAIT_VBLANK
    RTS
;
;******************************************************************************;
;                                                                              ;
;   Palette data.                                                              ;
;                                                                              ;
;******************************************************************************;
TILE_PALLETE:
;   Backgrounds.    
    .BYTE   $0F                   ; Universal Background.
    .BYTE   $1b, $2b, $13, $0F    ; Background Palette 0
    .BYTE   $1c, $1b, $07, $0F    ; Background Palette 1
    .BYTE   $1d, $1b, $07, $0F    ; Background Palette 2
    .BYTE   $1b, $1b, $07, $3D    ; Background Palette 3
;   Sprites.
    .BYTE   $27, $07, $30, $0F    ; Sprite Palette 0
    .BYTE   $1b, $1b, $07, $0F    ; Sprite Palette 1
    .BYTE   $1b, $1b, $07, $0F    ; Sprite Palette 2
    .BYTE   $1b, $1b, $06         ; Sprite Palette 3
;   
;******************************************************************************;
;                                                                              ;
;   Bank 1: CHR                                                                ;
;                                                                              ;
;******************************************************************************;
    .BANK   2
    .ORG    $0000
;
;******************************************************************************;
;                                                                              ;
;   Backgrounds                                                                ;
;                                                                              ;
;******************************************************************************;   
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
;******************************************************************************;
;                                                                              ;
;   Sprites.                                                                   ;
;                                                                              ;
;******************************************************************************;
;   Sprite 0: Main Hero frame 0.
    .BYTE   %00111100   ; 1st plane.
    .BYTE   %00111100   
    .BYTE   %00101000   
    .BYTE   %01111110
    .BYTE   %00111100
    .BYTE   %00000000
    .BYTE   %00000000
    .BYTE   %00110000
    .BYTE   %00000000   ; 2nd plane.
    .BYTE   %00111100   
    .BYTE   %00111100   
    .BYTE   %00000000
    .BYTE   %00000000
    .BYTE   %00111100
    .BYTE   %00111100   
    .BYTE   %00001100
;   Sprite 0: Main Hero frame 1.
    .BYTE   %00111100   ; 1st plane.
    .BYTE   %00111100   
    .BYTE   %00010100   
    .BYTE   %01111110
    .BYTE   %00111100
    .BYTE   %00000000
    .BYTE   %00000000
    .BYTE   %00001100
    .BYTE   %00000000   ; 2nd plane.
    .BYTE   %00111100   
    .BYTE   %00111100   
    .BYTE   %00000000
    .BYTE   %00000000
    .BYTE   %00111100
    .BYTE   %00111100   
    .BYTE   %00110000
;
