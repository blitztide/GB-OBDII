; GB-OBDII project
; Revision 1
; testing branch
; 2018-10-26

INCLUDE "include/hardware.inc"
INCLUDE "functions.asm"
INCLUDE "strings.asm"


SECTION "Header", ROM0[$100]

EntryPoint: ; execution begins
	di ; disable interrupts
	jp Start ; jump to start label

REPT $150 - $104
	db 0 
ENDR

SECTION "Game code", ROM0

Start:
	;Set Registers
	ld SP, $FFFF ;sets Stack pointer to $FFFF
	;Turn off the LCD
	call WaitVBlank
	xor a ; clears a
	ld [rLCDC], a ;
	ld hl, $9000
	ld de, FontTiles
	ld bc, FontTilesEnd - FontTiles
	call MemCpy ; copies fonts to $9000
	ld hl, $9865 ; This will print the string to the top left corner each iteration goes left to right top to bottom.
	ld de, HelloWorldStr
	call StrCpy
	ld hl, $9884;
	ld de, MessageStr1;
	call StrCpy
	ld hl, $9903;
	ld de, MessageStr2
	call StrCpy
	; Init display Registers

	ld a, %00100111 ; 
	ld [rBGP], a
	xor a; zero a
	ld [rSCY], a
	ld [rSCX], a
	;Turn Screen on, display background
	ld a, %10000001
	ld [rLCDC], a
	ld b, %11100100
.main
	jr .main

SECTION "Font", ROM0

FontTiles:
INCBIN "include/font.chr"
FontTilesEnd:
FontEnd:

