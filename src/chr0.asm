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
;,0x01:13_1,0x02:13_2,0x03:13_3,0x04:14_1,0x05:14_2,0x06:14_3,0x07:15_1,0x08:15_2,0x09:15_3,0x2c:1_16,0x2e:1_17,0x30:1_6,0x31:1_7,0x32:1_8,0x33:1_9,0x34:1_10,0x35:1_11,0x36:1_12,0x37:1_13,0x38:1_14,0x39:1_15,0x41:0_0,0x42:0_1,0x43:0_2,0x44:0_3,0x45:0_4,0x46:0_5,0x47:0_6,0x48:0_7,0x49:0_8,0x4a:0_9,0x4b:0_10,0x4c:0_11,0x4d:0_12,0x4e:0_13,0x4f:0_14,0x50:0_15,0x51:0_16,0x52:0_17,0x53:0_18,0x54:0_19,0x55:1_0,0x56:1_1,0x57:1_2,0x58:1_3,0x59:1_4,0x5a:1_5,0x80:18_0,0x81:18_1,0x82:18_2,0x83:18_3,0x84:18_16,0x85:18_17,0x86:18_18,0x87:18_19,0x88:19_8,0x89:24_8,0x8a:20_7,0x8b:20_12,0x8c:25_0,0x8d:25_1,0x8e:25_2,0x8f:25_3,0x90:25_16,0x91:25_17,0x92:25_18,0x93:25_19,0xfe:14_5
;
       .org $01 * 16
        Tile_0x01:
        .db     %00000000
        .db     %01111110
        .db     %01000011
        .db     %01011010
        .db     %01011010
        .db     %01000011
        .db     %01111110
        .db     %00100100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $02 * 16
        Tile_0x02:
        .db     %00000000
        .db     %00000000
        .db     %11111111
        .db     %00000000
        .db     %00000000
        .db     %11111111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $03 * 16
        Tile_0x03:
        .db     %00000000
        .db     %01111110
        .db     %11000010
        .db     %01011010
        .db     %01011010
        .db     %11000010
        .db     %01111110
        .db     %00100100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $04 * 16
        Tile_0x04:
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $05 * 16
        Tile_0x05:
        .db     %00000000
        .db     %00111100
        .db     %01000010
        .db     %00000100
        .db     %00001000
        .db     %00001000
        .db     %00000000
        .db     %00001000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $06 * 16
        Tile_0x06:
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00100100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $07 * 16
        Tile_0x07:
        .db     %00100100
        .db     %01111110
        .db     %01000011
        .db     %01011010
        .db     %01011010
        .db     %01000011
        .db     %01111110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $08 * 16
        Tile_0x08:
        .db     %00000000
        .db     %00000000
        .db     %11111111
        .db     %00000000
        .db     %00000000
        .db     %11111111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $09 * 16
        Tile_0x09:
        .db     %00100100
        .db     %01111110
        .db     %11000010
        .db     %01011010
        .db     %01011010
        .db     %11000010
        .db     %01111110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $2c * 16
        Tile_0x2c:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00010000
        .db     %00010000
        .db     %00100000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $2e * 16
        Tile_0x2e:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00110000
        .db     %00110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $30 * 16
        Tile_0x30:
        .db     %00000000
        .db     %00111100
        .db     %01000010
        .db     %01000010
        .db     %01000010
        .db     %01000010
        .db     %01000010
        .db     %00111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $31 * 16
        Tile_0x31:
        .db     %00000000
        .db     %00011000
        .db     %00101000
        .db     %00001000
        .db     %00001000
        .db     %00001000
        .db     %00001000
        .db     %01111110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $32 * 16
        Tile_0x32:
        .db     %00000000
        .db     %00111100
        .db     %01000010
        .db     %00000010
        .db     %00111110
        .db     %01000000
        .db     %01000000
        .db     %01111110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $33 * 16
        Tile_0x33:
        .db     %00000000
        .db     %01111100
        .db     %00000010
        .db     %00000010
        .db     %01111100
        .db     %00000010
        .db     %00000010
        .db     %01111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $34 * 16
        Tile_0x34:
        .db     %00000000
        .db     %01000100
        .db     %01000100
        .db     %01000100
        .db     %01111110
        .db     %00000100
        .db     %00000100
        .db     %00000100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $35 * 16
        Tile_0x35:
        .db     %00000000
        .db     %01111110
        .db     %01000000
        .db     %01000000
        .db     %01111100
        .db     %00000010
        .db     %00000010
        .db     %01111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $36 * 16
        Tile_0x36:
        .db     %00000000
        .db     %00111100
        .db     %01000010
        .db     %01000000
        .db     %01111100
        .db     %01000010
        .db     %01000010
        .db     %00111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $37 * 16
        Tile_0x37:
        .db     %00000000
        .db     %01111110
        .db     %00000010
        .db     %00000010
        .db     %00000100
        .db     %00000100
        .db     %00001000
        .db     %00001000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $38 * 16
        Tile_0x38:
        .db     %00000000
        .db     %00111100
        .db     %01000010
        .db     %01000010
        .db     %00111100
        .db     %01000010
        .db     %01000010
        .db     %00111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $39 * 16
        Tile_0x39:
        .db     %00000000
        .db     %00111100
        .db     %01000010
        .db     %01000010
        .db     %00111110
        .db     %00000010
        .db     %01000010
        .db     %00111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $41 * 16
        Tile_0x41:
        .db     %00000000
        .db     %01111100
        .db     %11000110
        .db     %11000110
        .db     %11111110
        .db     %11000110
        .db     %11000110
        .db     %11000110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $42 * 16
        Tile_0x42:
        .db     %00000000
        .db     %11111100
        .db     %11000010
        .db     %11000010
        .db     %11111100
        .db     %11000010
        .db     %11000010
        .db     %11111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $43 * 16
        Tile_0x43:
        .db     %00000000
        .db     %01111100
        .db     %11000010
        .db     %11000000
        .db     %11000000
        .db     %11000000
        .db     %11000010
        .db     %01111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $44 * 16
        Tile_0x44:
        .db     %00000000
        .db     %11111100
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $45 * 16
        Tile_0x45:
        .db     %00000000
        .db     %11111110
        .db     %11000000
        .db     %11000000
        .db     %11111110
        .db     %11000000
        .db     %11000000
        .db     %11111110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $46 * 16
        Tile_0x46:
        .db     %00000000
        .db     %11111110
        .db     %11000000
        .db     %11000000
        .db     %11111110
        .db     %11000000
        .db     %11000000
        .db     %11000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $47 * 16
        Tile_0x47:
        .db     %00000000
        .db     %01111110
        .db     %11000000
        .db     %11000000
        .db     %11000110
        .db     %11000010
        .db     %11000010
        .db     %01111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $48 * 16
        Tile_0x48:
        .db     %00000000
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11111110
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $49 * 16
        Tile_0x49:
        .db     %00000000
        .db     %11111110
        .db     %00010000
        .db     %00010000
        .db     %00010000
        .db     %00010000
        .db     %00010000
        .db     %11111110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $4a * 16
        Tile_0x4a:
        .db     %00000000
        .db     %00000110
        .db     %00000110
        .db     %00000110
        .db     %00000110
        .db     %00000110
        .db     %10000110
        .db     %01111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $4b * 16
        Tile_0x4b:
        .db     %00000000
        .db     %11000010
        .db     %11000100
        .db     %11001000
        .db     %11110000
        .db     %11001000
        .db     %11000100
        .db     %11000010
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $4c * 16
        Tile_0x4c:
        .db     %00000000
        .db     %11000000
        .db     %11000000
        .db     %11000000
        .db     %11000000
        .db     %11000000
        .db     %11000000
        .db     %11111110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $4d * 16
        Tile_0x4d:
        .db     %00000000
        .db     %11100110
        .db     %11011010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $4e * 16
        Tile_0x4e:
        .db     %00000000
        .db     %11000010
        .db     %11100010
        .db     %11010010
        .db     %11001010
        .db     %11000110
        .db     %11000010
        .db     %11000010
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $4f * 16
        Tile_0x4f:
        .db     %00000000
        .db     %01111100
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %01111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $50 * 16
        Tile_0x50:
        .db     %00000000
        .db     %11111100
        .db     %11000010
        .db     %11000010
        .db     %11111100
        .db     %11000000
        .db     %11000000
        .db     %11000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $51 * 16
        Tile_0x51:
        .db     %00000000
        .db     %01111100
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000100
        .db     %01111010
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $52 * 16
        Tile_0x52:
        .db     %00000000
        .db     %11111100
        .db     %11000010
        .db     %11000010
        .db     %11111100
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $53 * 16
        Tile_0x53:
        .db     %00000000
        .db     %01111110
        .db     %11000000
        .db     %11000000
        .db     %01111100
        .db     %00000110
        .db     %10000110
        .db     %01111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $54 * 16
        Tile_0x54:
        .db     %00000000
        .db     %11111110
        .db     %00011000
        .db     %00011000
        .db     %00011000
        .db     %00011000
        .db     %00011000
        .db     %00011000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $55 * 16
        Tile_0x55:
        .db     %00000000
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %11000010
        .db     %01111100
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $56 * 16
        Tile_0x56:
        .db     %00000000
        .db     %11000110
        .db     %11000110
        .db     %11000110
        .db     %11000110
        .db     %01000100
        .db     %00101000
        .db     %00010000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $57 * 16
        Tile_0x57:
        .db     %00000000
        .db     %11000110
        .db     %11000110
        .db     %11000110
        .db     %11000110
        .db     %11010110
        .db     %01010100
        .db     %00101000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $58 * 16
        Tile_0x58:
        .db     %00000000
        .db     %10000010
        .db     %01000100
        .db     %00101000
        .db     %00010000
        .db     %00101000
        .db     %01000100
        .db     %10000010
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $59 * 16
        Tile_0x59:
        .db     %00000000
        .db     %10000010
        .db     %01000100
        .db     %00101000
        .db     %00010000
        .db     %00010000
        .db     %00010000
        .db     %00010000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $5a * 16
        Tile_0x5a:
        .db     %00000000
        .db     %11111110
        .db     %00000100
        .db     %00001000
        .db     %00010000
        .db     %00100000
        .db     %01000000
        .db     %11111110
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $80 * 16
        Tile_0x80:
        .db     %11110000
        .db     %00001111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $81 * 16
        Tile_0x81:
        .db     %00000000
        .db     %00000000
        .db     %11110000
        .db     %00001111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $82 * 16
        Tile_0x82:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %11110000
        .db     %00001111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $83 * 16
        Tile_0x83:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %11110000
        .db     %00001111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $84 * 16
        Tile_0x84:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00001111
        .db     %11110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $85 * 16
        Tile_0x85:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00001111
        .db     %11110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $86 * 16
        Tile_0x86:
        .db     %00000000
        .db     %00000000
        .db     %00001111
        .db     %11110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $87 * 16
        Tile_0x87:
        .db     %00001111
        .db     %11110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $88 * 16
        Tile_0x88:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %11111111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $89 * 16
        Tile_0x89:
        .db     %11111111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $8a * 16
        Tile_0x8a:
        .db     %00000001
        .db     %00000001
        .db     %00000001
        .db     %00000001
        .db     %00000001
        .db     %00000001
        .db     %00000001
        .db     %00000001
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $8b * 16
        Tile_0x8b:
        .db     %10000000
        .db     %10000000
        .db     %10000000
        .db     %10000000
        .db     %10000000
        .db     %10000000
        .db     %10000000
        .db     %10000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $8c * 16
        Tile_0x8c:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00001111
        .db     %11110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $8d * 16
        Tile_0x8d:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00001111
        .db     %11110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $8e * 16
        Tile_0x8e:
        .db     %00000000
        .db     %00000000
        .db     %00001111
        .db     %11110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $8f * 16
        Tile_0x8f:
        .db     %00001111
        .db     %11110000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $90 * 16
        Tile_0x90:
        .db     %11110000
        .db     %00001111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $91 * 16
        Tile_0x91:
        .db     %00000000
        .db     %00000000
        .db     %11110000
        .db     %00001111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $92 * 16
        Tile_0x92:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %11110000
        .db     %00001111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $93 * 16
        Tile_0x93:
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %11110000
        .db     %00001111
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;
       .org $fe * 16
        Tile_0xfe:
        .db     %00000000
        .db     %01100000
        .db     %11111000
        .db     %11111110
        .db     %11111111
        .db     %11111110
        .db     %11111000
        .db     %01100000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
        .db     %00000000
;