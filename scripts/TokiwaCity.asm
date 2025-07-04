TokiwaCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, TokiwaCity_ScriptPointers
	ld a, [wTokiwaCityCurScript]
	jp CallFunctionInTable

TokiwaCity_ScriptPointers:
	dw TokiwaCityScript0
	dw TokiwaCityScript1
	dw TokiwaCityScript2
	dw TokiwaCityScript3

TokiwaCityScript0:
	call TokiwaCityScript_1900b
	jp TokiwaCityScript_1903d

TokiwaCityScript_1900b:
	ret

TokiwaCityScript_1903d:
	CheckEvent EVENT_GOT_POKEDEX
	ret nz
	ld a, [wYCoord]
	cp 7
	ret nz
	ld a, [wXCoord]
	cp 15
	ret nz
	ld a, $5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	call TokiwaCityScript_190cf
	ld a, $3
	ld [wTokiwaCityCurScript], a
	ret

TokiwaCityScript1:
	ld a, [wSprite03StateData1YPixels]
	ldh [hSpriteScreenYCoord], a
	ld a, [wSprite03StateData1XPixels]
	ldh [hSpriteScreenXCoord], a
	ld a, [wSprite03StateData2MapY]
	ldh [hSpriteMapYCoord], a
	ld a, [wSprite03StateData2MapX]
	ldh [hSpriteMapXCoord], a
	xor a
	ld [wListScrollOffset], a

	; set up battle for Old Man
	ld a, BATTLE_TYPE_OLD_MAN
	ld [wBattleType], a
	ld a, 5
	ld [wCurEnemyLVL], a
	ld a, OMEGA
	ld [wCurOpponent], a
	ld a, $2
	ld [wTokiwaCityCurScript], a
	ret

TokiwaCityScript2:
	ldh a, [hSpriteScreenYCoord]
	ld [wSprite03StateData1YPixels], a
	ldh a, [hSpriteScreenXCoord]
	ld [wSprite03StateData1XPixels], a
	ldh a, [hSpriteMapYCoord]
	ld [wSprite03StateData2MapY], a
	ldh a, [hSpriteMapXCoord]
	ld [wSprite03StateData2MapX], a
	call UpdateSprites
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld a, $f
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wBattleType], a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wTokiwaCityCurScript], a
	ret

TokiwaCityScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, 0
	ld [wTokiwaCityCurScript], a
	ret

TokiwaCityScript_190cf:
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	ret

TokiwaCity_TextPointers:
	dw TokiwaCityText1
	dw TokiwaCityText2
	dw TokiwaCityText3
	dw TokiwaCityText4
	dw TokiwaCityText5
	dw TokiwaCityText6
	dw TokiwaCityText7
	dw TokiwaCityText8
	dw TokiwaCityText9
	dw TokiwaCityText10
	dw MartSignText
	dw PokeCenterSignText
	dw TokiwaCityText13
	dw TokiwaCityText14
	dw TokiwaCityText15

TokiwaCityText1:
	text_far _TokiwaCityText1
	text_end

TokiwaCityText2:
	text_far _TokiwaCityText2
	text_end

TokiwaCityText_19122:
	text_far _TokiwaCityText_19122
	text_end

TokiwaCityText_19127:
	text_far _TokiwaCityText_19127
	text_end

TokiwaCityText3:
	text_asm
   	ld a, [wPlayerGender]
	and a
	jr z, .BoyText
	ld hl, TokiwaCityText_1914d2
	jr .next
.BoyText	
	ld hl, TokiwaCityText_1914d
.next
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	ld hl, TokiwaCityText_19157
	call PrintText
	jr .done
.no
	ld hl, TokiwaCityText_19152
	call PrintText
.done
	jp TextScriptEnd

TokiwaCityText_1914d:
	text_far _TokiwaCityText_1914d
	text_end
	
TokiwaCityText_1914d2:
	text_far _TokiwaCityText_1914d2
	text_end

TokiwaCityText_19152:
	text_far _TokiwaCityText_19152
	text_end

TokiwaCityText_19157:
	text_far _TokiwaCityText_19157
	text_end

TokiwaCityText4:
	text_far _TokiwaCityText4
	text_end

TokiwaCityText_19175:
	text_far _TokiwaCityText_19175
	text_end

TokiwaCityText_1917a:
	text_far _TokiwaCityText_1917a
	text_end

TokiwaCityText5:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .GotDex
	ld hl, TokiwaCityText_19191
	call PrintText
	call TokiwaCityScript_190cf
	ld a, $3
	ld [wTokiwaCityCurScript], a
	jr .end
.GotDex
	ld hl, TokiwaCityText_19191_2
	call PrintText
.end
	jp TextScriptEnd

TokiwaCityText_19191:
	text_far _TokiwaCityText_19191
	text_end
	
TokiwaCityText_19191_2:
	text_far _TokiwaCityText_19191_2
	text_end

TokiwaCityText6:
	text_far _TokiwaCityText6
	text_end


TokiwaCityText_191ca:
	text_far _TokiwaCityText_191ca
	text_end

ReceivedTM42Text:
	text_far _ReceivedTM42Text
	sound_get_item_2
	text_end

TM42Explanation:
	text_far _TM42Explanation
	text_end

TM42NoRoomText:
	text_far _TM42NoRoomText
	text_end

TokiwaCityText7:
	text_far _TokiwaCityText7
	text_end

TokiwaCityText_1920a:
	text_far _TokiwaCityText_1920a
	text_end

TokiwaCityText_1920f:
	text_far _TokiwaCityText_1920f
	text_end

TokiwaCityText_19214:
	text_far _TokiwaCityText_19214
	text_end

TokiwaCityText15:
	text_far _TokiwaCityText_19219
	text_end

TokiwaCityText8:
	text_far _TokiwaCityText8
	text_end

TokiwaCityText9:
	text_far _TokiwaCityText9
	text_end

TokiwaCityText10:
	text_far _TokiwaCityText10
	text_end

TokiwaCityText13:
	text_far _TokiwaCityText13
	text_end

TokiwaCityText14:
	text_far _TokiwaCityText14
	text_end
