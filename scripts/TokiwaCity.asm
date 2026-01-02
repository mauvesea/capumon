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
	call TokiwaCityScriptClear
	jp TokiwaCityScript_Scientist

TokiwaCityScriptClear:
	ret

TokiwaCityScript_Scientist: ; Check both Dex and Yujiro's defeat
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .FailedFirstCheck
	CheckEvent EVENT_BEAT_YUJIRO
	ret nz
.FailedFirstCheck
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
	call TokiwaCityScript_MovePlayerDown
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

TokiwaCityScript_MovePlayerDown:
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
	dw TokiwaCityTextBoy
	dw TokiwaCityTextScientist
	dw TokiwaCityTextGirl
	dw TokiwaCityTextLass
	dw TokiwaCityTextScientistRoadblock
	dw TokiwaCityText6
	dw TokiwaCityText7
	dw TokiwaCityText8
	dw TokiwaCityText9
	dw TokiwaCityText10
	dw MartSignText
	dw PokeCenterSignText
	dw TokiwaCityText13

TokiwaCityTextBoy:
	text_far _TokiwaCityTextBoy1
	text_end

TokiwaCityTextScientist:
	text_far _TokiwaCityTextScientist
	text_end

TokiwaCityTextGirl:
	text_asm
   	ld a, [wPlayerGender]
	and a
	jr z, .BoyText
	ld hl, TokiwaCityTextGirl_FemaleMC
	jr .next
.BoyText
	ld hl, TokiwaCityTextGirl_MaleMC
.next
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	ld hl, TokiwaCityTextGirl_YesChosen
	call PrintText
	jr .done
.no
	ld hl, TokiwaCityTextGirl_NoChosen
	call PrintText
.done
	jp TextScriptEnd

TokiwaCityTextGirl_MaleMC:
	text_far _TokiwaCityTextGirl_MaleMC
	text_end
	
TokiwaCityTextGirl_FemaleMC:
	text_far _TokiwaCityTextGirl_FemaleMC
	text_end

TokiwaCityTextGirl_NoChosen:
	text_far _TokiwaCityTextGirl_NoChosen
	text_end

TokiwaCityTextGirl_YesChosen:
	text_far _TokiwaCityTextGirl_YesChosen
	text_end

TokiwaCityTextLass:
	text_asm
	CheckEvent EVENT_BEAT_YUJIRO
	jr nz, .BeatYujiro
	ld hl, TokiwaCityTextLass1
	call PrintText
	jr .done
.BeatYujiro
	ld hl, TokiwaCityTextLass2
	call PrintText
.done
	jp TextScriptEnd

TokiwaCityTextLass1:
	text_far _TokiwaCityTextLass1
	text_end

TokiwaCityTextLass2:
	text_far _TokiwaCityTextLass2
	text_end

TokiwaCityTextScientistRoadblock:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .DexText
	CheckEvent EVENT_BEAT_YUJIRO
	jr z, .ChampText
	ld hl, TokiwaCityText_Scientist3
	call PrintText
	jr .done

.DexText
	ld hl, TokiwaCityText_Scientist1
	call PrintText
	jr .MovePlayer

.ChampText
	ld hl, TokiwaCityText_Scientist2
	call PrintText

.MovePlayer
	call TokiwaCityScript_MovePlayerDown
	ld a, $3
	ld [wTokiwaCityCurScript], a

.done
	jp TextScriptEnd

TokiwaCityText_Scientist1:
	text_far _TokiwaCityText_Scientist1
	text_end
	
TokiwaCityText_Scientist2:
	text_far _TokiwaCityText_Scientist2
	text_end

TokiwaCityText_Scientist3:
	text_far _TokiwaCityText_Scientist3
	text_end

TokiwaCityText6:
	text_far _TokiwaCityText6
	text_end

TokiwaCityText7:
	text_far _TokiwaCityText7
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


