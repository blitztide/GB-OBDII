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
	ld hl, $9800 ; This will print the string to the top left corner each iteration goes left to right top to bottom.
	ld de, HelloWorldStr
.copyString
	ld a, [de]
	ld [hli], a
	inc de
	and a ; Checks if the byte is null
	jr nz, .copyString ; if not zero goto copystring

; Init display Registers

	ld a, %11100100
	ld [rBGP], a
	xor a; zero a
	ld [rSCY], a
	ld [rSCX], a
	; Shut sound down
	ld [rNR52], a
	;Turn Screen on, display background
	ld a, %10000001
	ld [rLCDC], a
	
.lockup
	jr .lockup

SECTION "Font", ROM0

FontTiles:
INCBIN "font.chr"
FontTilesEnd:
FontEnd:


SECTION "Strings", ROM0
HelloWorldStr:
	db "Hello Taylor", 0
MessageStr:
	db "You are a Cunt!", 0

