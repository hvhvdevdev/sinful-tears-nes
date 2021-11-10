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
;
;===============================================================================
;    Related to iNES header.
;===============================================================================
;
        NUM_PRG_ROMS            .equ    2       ; 32KB.
        NUM_CHR_ROMS            .equ    4       ; 32KB.
        MODE_MIRRORING          .equ    %0000   ; Horizontal.
;
;===============================================================================
;    Related to PPU.
;===============================================================================
;
        ADDR_PPUCONTROLLER      .equ    $2000
        ADDR_PPUMASK            .equ    $2001
        ADDR_PPUSTATUS          .equ    $2002
        ADDR_PPUOAM             .equ    $2003
        ADDR_PPUSCROLL          .equ    $2005
        ADDR_PPUADDR            .equ    $2006
        ADDR_PPUDATA            .equ    $2007
        ADDR_CONTROLLERPORT     .equ    $4016
        ADDR_OAMADDR            .equ    $2003
        ADDR_OAMDMA             .equ    $4014
;
;===============================================================================
;    Misc.
;===============================================================================
;
        TXT_DRAW_DELAY          .equ    #$04
        UI_COLDDOWN             .equ    #$04
;