_ScrollTrainerPicAfterBattle:
; Load the enemy trainer's pic and scrolls it into
; the screen from the right.
	xor a
	ld [wEnemyMonSpecies2], a
	callfar _LoadTrainerPic
	hlcoord 19, 4
	ld c, $0
.scrollLoop
	inc c
	ld a, c
	cp 8
	ret z
	ld d, $0
	push bc
	push hl
.drawTrainerPicLoop
	call DrawTrainerPicColumn
	inc hl
	ld a, 8
	add d
	ld d, a
	dec c
	jr nz, .drawTrainerPicLoop
	ld c, 4
	call DelayFrames
	pop hl
	pop bc
	dec hl
	jr .scrollLoop

; write one 7-tile column of the trainer pic to the tilemap
DrawTrainerPicColumn:
	push hl
	push de
	push bc
	ld e, 8
.loop
	ld [hl], d
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc d
	dec e
	jr nz, .loop
	pop bc
	pop de
	pop hl
	ret
