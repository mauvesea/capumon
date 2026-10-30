; Spends the TP cost of the move that is about to be used.
; de points to the selected move (wPlayerSelectedMove or wEnemySelectedMove).
; The cost is read straight out of the move data (data/moves/moves.asm) and
; subtracted from the mon's current TP, both in the battle struct and in the
; party struct, so that the two stay in sync.
DecrementTP:
	ld a, [de]
	and a
	ret z                ; no move, nothing to pay
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyTurn

; player
	ld hl, wPlayerBattleStatus1
	ld a, [hli]          ; load wPlayerBattleStatus1 and point hl at wPlayerBattleStatus2
	and (1 << STORING_ENERGY) | (1 << THRASHING_ABOUT) | (1 << ATTACKING_MULTIPLE_TIMES)
	ret nz               ; locked into a multi-turn move, so no TP is spent
	bit USING_RAGE, [hl]
	ret nz               ; Rage keeps attacking for free too
	ld a, [de]
	call GetMoveTPCost
	and a
	ret z                ; free move
	push af
	ld hl, wBattleMonTP
	call SubtractTPFromMon
	pop af
	ld hl, wPlayerBattleStatus3
	bit TRANSFORMED, [hl]
	ret nz               ; a transformed mon has no party TP of its own to update
	push af
	ld hl, wPartyMon1TP
	ld a, [wPlayerMonNumber] ; which mon in the party is active
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes       ; calculate the address of the mon to modify
	pop af
	jp SubtractTPFromMon

.enemyTurn
	ld hl, wEnemyBattleStatus1
	ld a, [hli]
	and (1 << STORING_ENERGY) | (1 << THRASHING_ABOUT) | (1 << ATTACKING_MULTIPLE_TIMES)
	ret nz
	bit USING_RAGE, [hl]
	ret nz
	ld a, [de]
	call GetMoveTPCost
	and a
	ret z
	push af
	ld hl, wEnemyMonTP
	call SubtractTPFromMon
	pop af
	ld hl, wEnemyBattleStatus3
	bit TRANSFORMED, [hl]
	ret nz
	ld a, [wIsInBattle]
	dec a
	ret z                ; a wild mon has no party data to update
	push af
	ld hl, wEnemyMon1TP
	ld a, [wEnemyMonPartyPos]
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	pop af
	; fallthrough

; Subtracts a from the big-endian 16-bit current TP value at hl, flooring at 0.
SubtractTPFromMon:
	ld b, a
	inc hl
	ld a, [hl]  ; low byte
	sub b
	ld c, a
	dec hl
	ld a, [hl]  ; high byte
	sbc 0
	jr c, .noTPLeft
	ld [hli], a
	ld [hl], c
	ret
.noTPLeft
	xor a
	ld [hli], a
	ld [hl], a
	ret
