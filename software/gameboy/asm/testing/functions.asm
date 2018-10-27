INCLUDE "include/hardware.inc"

SECTION "Functions", ROM0
StrCpy:
	ld a, [de]
	ldi [hl], a
	inc de
	and a
	jr nz, StrCpy
	ret

WaitVBlank:
	ld a, [rLY]
	cp 144
	jr c, WaitVBlank
	ret

PlaySound:
	ld a, $80
	ld [$FF26], a
	ld a, $11
	ld [$FF25], a
	ld a, $77
	ld [$FF24], a
	ld a, $1E
	ld [$FF10], a
	ld a, $10
	ld [$FF11], a
	ld a, $F3
	ld [$FF12], a
	xor a
	ld [$FF13], a
	ld a, $87
	ld [$FF14], a
	ret

MemCpy:	;load start Read address in DE and read bytes to BC and copy address in HL
	ld a, [de]
	ldi [hl], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, MemCpy
	ret
	
VBD:
	push af
	call WaitVBlank
	pop af
	dec a
	and a ; test if a is zero
	jp nz, VBD
	ret


