INCLUDE "hardware.inc"

SECTION "Header", ROM0[$100]
	; our code here

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
.waitVBlank
	ld a, [rLY]
	cp 144	;check if LCD is past VBlank
	jr c, .waitVBlank
	xor a ; clears a
	ld [rLCDC], a ;

	ld hl, $9000
	ld de, FontTiles
	ld bc, FontTilesEnd - FontTiles
.copyFont
	ld a, [de] ; Grab 1 byte from source
	ld [hli], a ; place it at the destination, increment hl
	inc de ; Move to next byte
	dec bc ; Decrement Count
	ld a, b ; Check if Count is 0 as dec bc doesn't update flags
	or c
	jr nz, .copyFont
	ld hl, $9865 ; This will print the string to the top left corner each iteration goes left to right top to bottom.
	ld de, HelloWorldStr
	call CopyString
	ld hl, $9884;
	ld de, MessageStr1;
	call CopyString
	ld hl, $9903;
	ld de, MessageStr2
	call CopyString


; Init display Registers

	ld a, %11100100
	ld [rBGP], a
	xor a; zero a
	ld [rSCY], a
	ld [rSCX], a
	;Turn Screen on, display background
	ld a, %10000001
	ld [rLCDC], a
	ld b, %11100100
.lockup
	call waitVBlank
	ld a, $80
	ld [$FF26], a
	ld a, $11
	ld [$FF25], a
	ld a, $77
	ld [$FF24], a
	ld a, $1E
	ld [$FF10], a
	ld a, $10;
	ld [$FF11], a
	ld a, $F3
	ld [$ff12], a
	ld a, $00
	ld [$FF13], a
	ld a, $87
	ld [$FF14], a
	inc b
	ld a, b
	ld [rBGP], a
	jr .lockup

SECTION "Font", ROM0

FontTiles:
INCBIN "font.chr"
FontTilesEnd:
FontEnd:

SECTION "Function Calls", ROM0

CopyString:
	ld a, [de]
	ldi [hl], a
	inc de
	and a
	jr nz, CopyString
	ret

waitVBlank:
	ld a, [rLY]
	cp 144
	jr c, waitVBlank
	ret


SECTION "Strings", ROM0
HelloWorldStr:
	db "GBC-OBDII", 0
MessageStr1:
	db "Prototype V1", 0
MessageStr2:
	db "ALPHA VERSION!", 0
