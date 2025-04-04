PlayersHouse2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PlayersHouse2F_ScriptPointers
	ld a, [wPlayersHouse2FCurScript]
	jp CallFunctionInTable

PlayersHouse2F_ScriptPointers:
	dw PlayersHouse2FScript0
	dw PlayersHouse2FScript1

PlayersHouse2FScript0:
	xor a
	ldh [hJoyHeld], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, 1
	ld [wPlayersHouse2FCurScript], a
	ret

PlayersHouse2FScript1:
	ret

PlayersHouse2F_TextPointers:

	text_end ; unused
