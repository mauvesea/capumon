PrintStatusAilment::
	ld a, [de]
	bit PSN, a
	jr nz, .psn
	bit BRN, a
	jr nz, .brn
	bit FRZ, a
	jr nz, .frz
	bit PAR, a
	jr nz, .par
	and 1 << WET
	ret z
	ld a, "W"
	ld [hli], a
	ld a, "E"
	ld [hli], a
	ld [hl], "T"
	ret
.psn
	ld a, "P"
	ld [hli], a
	ld a, "S"
	ld [hli], a
	ld [hl], "N"
	ret
.brn
	ld a, "B"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld [hl], "N"
	ret
.frz
	ld a, "F"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld [hl], "Z"
	ret
.par
	ld a, "P"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld [hl], "Z"
	ret
