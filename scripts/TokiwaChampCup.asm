TokiwaChampCup_Script:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	push hl
	call nz, .LoadNames
	pop hl
	bit 6, [hl]
	res 6, [hl]
	call nz, TokiwaChampCupOpenDoorScript
	call EnableAutoTextBoxDrawing
	ld hl, TokiwaChampCupDealerHeaders
	ld de, TokiwaChampCup_ScriptPointers
	ld a, [wTokiwaChampCupCurScript]
	call ExecuteCurMapScriptInTable
	ld [wTokiwaChampCupCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "TOKIWA CITY@"

.LeaderName:
	db "YUJIRO@"

TokiwaChampCupOpenDoorScript:
	CheckEvent EVENT_TOKIWA_CHAMP_CUP_DOOR_OPEN
	jr nz, .doorsOpen
	ld a, $15 ; double door tile ID
	jr .replaceTile
.doorsOpen
	ld a, SFX_GO_INSIDE
	call PlaySound
	ld a, $7 ; clear floor tile ID
.replaceTile
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef_jump ReplaceTileBlock

TokiwaChampCupResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wTokiwaChampCupCurScript], a
	ld [wCurMapScript], a
	ret

TokiwaChampCup_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw TokiwaChampCupLeaderPostBattle

TokiwaChampCupLeaderPostBattle:
	ld a, [wIsInBattle]
	cp $ff ; did we lose?
	jp z, TokiwaChampCupResetScripts
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a

	ld hl, wCharisma
	ld a, [hl]
	inc a
	ld [wCharisma], a

	SetEvent EVENT_BEAT_YUJIRO

	ld a, $1 ; PrintText ID
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID

	jp TokiwaChampCupResetScripts

TokiwaChampCup_TextPointers:
	dw YujiroText
	dw YujiroAfterBattleText
	dw TokiwaChampCupDealerText1
	dw TokiwaChampCupGuideText

TokiwaChampCupDealerHeaders:
	def_trainers 2
TokiwaChampCupDealerHeader0:
	trainer EVENT_BEAT_TOKIWA_CHAMP_CUP_DEALER_0, 0, TokiwaChampCupBattleText1, TokiwaChampCupEndBattleText1, TokiwaChampCupAfterBattleText1
	db -1 ; end


;   *** Champ Events ***
YujiroText:
	text_asm
	CheckEvent EVENT_BEAT_YUJIRO
	jr nz, .afterBeat
.beforeBeat
	ld hl, YujiroBeforeBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, YujiroBeatenText
	ld de, YujiroBeatenText
	call SaveEndBattleTextPointers

	ld hl, YujiroInBattleText
	ld de, YujiroInBattleText
	call SaveInBattleTextPointers

	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
;	ld a, $3
;	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, 3 ; Set Script Index to 3
	ld [wTokiwaChampCupCurScript], a
	ld [wCurMapScript], a
	jr .done
.afterBeat
	ld hl, YujiroAfterBattleText
	call PrintText
.done
	jp TextScriptEnd

YujiroBeforeBattleText:
	text_far _YujiroBeforeBattleText
	text_end

YujiroInBattleText:
	text_far _YujiroInBattleText
	text_end

YujiroBeatenText:
	text_far _YujiroBeatenText
	text_end

YujiroAfterBattleText:
	text_far _YujiroAfterBattleText
	text_end


;   *** Dealer Events ***
TokiwaChampCupDealerText1:
	text_asm
	ld hl, TokiwaChampCupDealerHeader0
	call TalkToTrainer
	jp TextScriptEnd

TokiwaChampCupBattleText1:
	text_far _TokiwaChampCupBattleText1
	text_end

TokiwaChampCupEndBattleText1:
	text_far _TokiwaChampCupEndBattleText1
	text_end

TokiwaChampCupAfterBattleText1:
	text_far _TokiwaChampCupAfterBattleText1
	text_end


;  *** Guide Events ***
TokiwaChampCupGuideText:
	text_asm

	CheckEvent EVENT_BEAT_YUJIRO
	jr nz, .ChampBeaten

	CheckEvent EVENT_TOKIWA_CHAMP_CUP_DOOR_OPEN
	jr nz, .DoorsOpen

	CheckEvent EVENT_BEAT_TOKIWA_CHAMP_CUP_DEALER_0
	jr z, .DealersNotBeaten

	ld hl, TokiwaChampCupGuideDoorOpenText
	call PrintText
	SetEvent EVENT_TOKIWA_CHAMP_CUP_DOOR_OPEN

	ld a, SFX_GO_INSIDE
	call PlaySound
	ld a, $7 ; clear floor tile ID
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef ReplaceTileBlock

	ld hl, TokiwaChampCupGuideDoorOpenText2
	call PrintText

	jr .done

.ChampBeaten
	ld hl, TokiwaChampCupGuideChampBeatenText
	call PrintText
	jr .done

.DoorsOpen
	ld hl, TokiwaChampCupGuideAfterDoorOpenText
	call PrintText
	jr .done
.DealersNotBeaten
	ld hl, TokiwaChampCupGuideInitialText
	call PrintText
.done
	jp TextScriptEnd

TokiwaChampCupGuideInitialText:
	text_far _TokiwaChampCupGuideInitialText
	text_end

TokiwaChampCupGuideDoorOpenText:
	text_far _TokiwaChampCupGuideDoorOpenText
	text_end

TokiwaChampCupGuideDoorOpenText2:
	text_far _TokiwaChampCupGuideDoorOpenText2
	text_end

TokiwaChampCupGuideAfterDoorOpenText:
	text_far _TokiwaChampCupGuideAfterDoorOpenText
	text_end

TokiwaChampCupGuideChampBeatenText:
	text_far _TokiwaChampCupGuideChampBeatenText
	text_end
