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
;    Constants and variables.
;===============================================================================
;
        .include        src/constants.asm
        .include        src/vars.asm
;
;===============================================================================
;    iNES header.
;===============================================================================
;
        .db             "NES", $1a              ; Required.
        .db             NUM_PRG_ROMS            ; How many 16KB PRG banks?
        .db             NUM_CHR_ROMS            ; How many 8KN CHR banks?
        .db             $30 | MODE_MIRRORING    ; Mapper 3 and mirroring mode.
        .dsb            9, $00                  ; Zeroes remaining bytes.
;
;===============================================================================
;    Program banks.
;===============================================================================
;
        .base           $8000                   ; PRG-ROM starting address.
        .include        src/macros.asm
        .include        src/preintro.asm
        .include        src/mainmenu.asm
        .include        src/prologue.asm
        .include        src/ui.asm
        .include        src/dgn.asm
;
;===============================================================================
;    Interrupts.
;===============================================================================
;
        .org            $fffa                   ; Pad until this.
;
        .dw             NMI                     ; NMI handler.
        .dw             Reset                   ; Entry point.
        .dw             0                       ; IRQs are not used.
;
;===============================================================================
;    CHR data.
;===============================================================================
;
        .base           $00
        .include        src/chr0.asm
        .org            $2000   
;