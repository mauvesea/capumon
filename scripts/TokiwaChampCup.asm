TokiwaChampCup_Script:
	ld hl, .CityName
	ld de, .LeaderName
	call LoadGymLeaderAndCityName
	call EnableAutoTextBoxDrawing
	ld hl, TokiwaChampCupTrainerHeaders
	ld de, TokiwaChampCup_ScriptPointers
	ld a, [wTokiwaChampCupCurScript]
	call ExecuteCurMapScriptInTable
	ld [wTokiwaChampCupCurScript], a
	ret

.CityName:
	db "VIRIDIAN CITY@"

.LeaderName:
	db "GIOVANNI@"

TokiwaChampCupResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wTokiwaChampCupCurScript], a
	ld [wCurMapScript], a
	ret

TokiwaChampCup_ScriptPointers:
	dw TokiwaChampCupScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw TokiwaChampCupGiovanniPostBattle
	dw TokiwaChampCupScript4

TokiwaChampCupScript0:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, TokiwaChampCupArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	call StartSimulatingJoypadStates
	ld hl, wd736
	set 7, [hl]
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $4
	ld [wCurMapScript], a
	ret

TokiwaChampCupArrowTilePlayerMovement:
	map_coord_movement 19, 11, TokiwaChampCupArrowMovement1
	map_coord_movement 19,  1, TokiwaChampCupArrowMovement2
	map_coord_movement 18,  2, TokiwaChampCupArrowMovement3
	map_coord_movement 11,  2, TokiwaChampCupArrowMovement4
	map_coord_movement 16, 10, TokiwaChampCupArrowMovement5
	map_coord_movement  4,  6, TokiwaChampCupArrowMovement6
	map_coord_movement  5, 13, TokiwaChampCupArrowMovement7
	map_coord_movement  4, 14, TokiwaChampCupArrowMovement8
	map_coord_movement  0, 15, TokiwaChampCupArrowMovement9
	map_coord_movement  1, 15, TokiwaChampCupArrowMovement10
	map_coord_movement 13, 16, TokiwaChampCupArrowMovement11
	map_coord_movement 13, 17, TokiwaChampCupArrowMovement12
	db -1 ; end

TokiwaChampCupArrowMovement1:
	db D_UP, 9
	db -1 ; end

TokiwaChampCupArrowMovement2:
	db D_LEFT, 8
	db -1 ; end

TokiwaChampCupArrowMovement3:
	db D_DOWN, 9
	db -1 ; end

TokiwaChampCupArrowMovement4:
	db D_RIGHT, 6
	db -1 ; end

TokiwaChampCupArrowMovement5:
	db D_DOWN, 2
	db -1 ; end

TokiwaChampCupArrowMovement6:
	db D_DOWN, 7
	db -1 ; end

TokiwaChampCupArrowMovement7:
	db D_RIGHT, 8
	db -1 ; end

TokiwaChampCupArrowMovement8:
	db D_RIGHT, 9
	db -1 ; end

TokiwaChampCupArrowMovement9:
	db D_UP, 8
	db -1 ; end

TokiwaChampCupArrowMovement10:
	db D_UP, 6
	db -1 ; end

TokiwaChampCupArrowMovement11:
	db D_LEFT, 6
	db -1 ; end

TokiwaChampCupArrowMovement12:
	db D_LEFT, 12
	db -1 ; end

TokiwaChampCupScript4:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, .TokiwaChampCupLoadSpinnerArrow
	xor a
	ld [wJoyIgnore], a
	ld hl, wd736
	res 7, [hl]
	ld a, $0
	ld [wCurMapScript], a
	ret
.TokiwaChampCupLoadSpinnerArrow
	farjp LoadSpinnerArrowTiles

TokiwaChampCupGiovanniPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, TokiwaChampCupResetScripts
	ld a, $f0
	ld [wJoyIgnore], a
; fallthrough
TokiwaChampCupReceiveTM27:
	ld a, $c
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	lb bc, TM_FISSURE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $d
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM27
	jr .gymVictory
.BagFull
	ld a, $e
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_EARTHBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_EARTHBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7

	ld a, HS_ROUTE_22_RIVAL_2
	ld [wMissableObjectIndex], a
	predef ShowObject
	SetEvents EVENT_2ND_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	jp TokiwaChampCupResetScripts

TokiwaChampCup_TextPointers:
	dw GiovanniText
	dw TokiwaChampCupTrainerText1
	dw TokiwaChampCupTrainerText2
	dw TokiwaChampCupTrainerText3
	dw TokiwaChampCupTrainerText4
	dw TokiwaChampCupTrainerText5
	dw TokiwaChampCupTrainerText6
	dw TokiwaChampCupTrainerText7
	dw TokiwaChampCupTrainerText8
	dw TokiwaChampCupGuideText
	dw PickUpItemText
	dw GiovanniEarthBadgeInfoText
	dw ReceivedTM27Text
	dw TM27NoRoomText

TokiwaChampCupTrainerHeaders:
	def_trainers 2
TokiwaChampCupTrainerHeader0:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, 4, TokiwaChampCupBattleText1, TokiwaChampCupEndBattleText1, TokiwaChampCupAfterBattleText1
TokiwaChampCupTrainerHeader1:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_1, 4, TokiwaChampCupBattleText2, TokiwaChampCupEndBattleText2, TokiwaChampCupAfterBattleText2
TokiwaChampCupTrainerHeader2:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_2, 4, TokiwaChampCupBattleText3, TokiwaChampCupEndBattleText3, TokiwaChampCupAfterBattleText3
TokiwaChampCupTrainerHeader3:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_3, 2, TokiwaChampCupBattleText4, TokiwaChampCupEndBattleText4, TokiwaChampCupAfterBattleText4
TokiwaChampCupTrainerHeader4:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_4, 3, TokiwaChampCupBattleText5, TokiwaChampCupEndBattleText5, TokiwaChampCupAfterBattleText5
TokiwaChampCupTrainerHeader5:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_5, 4, TokiwaChampCupBattleText6, TokiwaChampCupEndBattleText6, TokiwaChampCupAfterBattleText6
TokiwaChampCupTrainerHeader6:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_6, 3, TokiwaChampCupBattleText7, TokiwaChampCupEndBattleText7, TokiwaChampCupAfterBattleText7
TokiwaChampCupTrainerHeader7:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7, 4, TokiwaChampCupBattleText8, TokiwaChampCupEndBattleText8, TokiwaChampCupAfterBattleText8
	db -1 ; end

GiovanniText:
	text_asm
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM27
	jr nz, .afterBeat
	call z, TokiwaChampCupReceiveTM27
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, GiovanniPostBattleAdviceText
	call PrintText
	call GBFadeOutToBlack
	ld a, HS_VIRIDIAN_GYM_GIOVANNI
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	jr .done
.beforeBeat
	ld hl, GiovanniPreBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, ReceivedEarthBadgeText
	ld de, ReceivedEarthBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $8
	ld [wGymLeaderNo], a
	ld a, $3
	ld [wTokiwaChampCupCurScript], a
.done
	jp TextScriptEnd

GiovanniPreBattleText:
	text_far _GiovanniPreBattleText
	text_end

ReceivedEarthBadgeText:
	text_far _ReceivedEarthBadgeText
	sound_level_up ; probably supposed to play SFX_GET_ITEM_1 but the wrong music bank is loaded
	text_end

GiovanniPostBattleAdviceText:
	text_far _GiovanniPostBattleAdviceText
	text_waitbutton
	text_end

GiovanniEarthBadgeInfoText:
	text_far _GiovanniEarthBadgeInfoText
	text_end

ReceivedTM27Text:
	text_far _ReceivedTM27Text
	sound_get_item_1

TM27ExplanationText:
	text_far _TM27ExplanationText
	text_end

TM27NoRoomText:
	text_far _TM27NoRoomText
	text_end

TokiwaChampCupTrainerText1:
	text_asm
	ld hl, TokiwaChampCupTrainerHeader0
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

TokiwaChampCupTrainerText2:
	text_asm
	ld hl, TokiwaChampCupTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

TokiwaChampCupBattleText2:
	text_far _TokiwaChampCupBattleText2
	text_end

TokiwaChampCupEndBattleText2:
	text_far _TokiwaChampCupEndBattleText2
	text_end

TokiwaChampCupAfterBattleText2:
	text_far _TokiwaChampCupAfterBattleText2
	text_end

TokiwaChampCupTrainerText3:
	text_asm
	ld hl, TokiwaChampCupTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

TokiwaChampCupBattleText3:
	text_far _TokiwaChampCupBattleText3
	text_end

TokiwaChampCupEndBattleText3:
	text_far _TokiwaChampCupEndBattleText3
	text_end

TokiwaChampCupAfterBattleText3:
	text_far _TokiwaChampCupAfterBattleText3
	text_end

TokiwaChampCupTrainerText4:
	text_asm
	ld hl, TokiwaChampCupTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

TokiwaChampCupBattleText4:
	text_far _TokiwaChampCupBattleText4
	text_end

TokiwaChampCupEndBattleText4:
	text_far _TokiwaChampCupEndBattleText4
	text_end

TokiwaChampCupAfterBattleText4:
	text_far _TokiwaChampCupAfterBattleText4
	text_end

TokiwaChampCupTrainerText5:
	text_asm
	ld hl, TokiwaChampCupTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

TokiwaChampCupBattleText5:
	text_far _TokiwaChampCupBattleText5
	text_end

TokiwaChampCupEndBattleText5:
	text_far _TokiwaChampCupEndBattleText5
	text_end

TokiwaChampCupAfterBattleText5:
	text_far _TokiwaChampCupAfterBattleText5
	text_end

TokiwaChampCupTrainerText6:
	text_asm
	ld hl, TokiwaChampCupTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

TokiwaChampCupBattleText6:
	text_far _TokiwaChampCupBattleText6
	text_end

TokiwaChampCupEndBattleText6:
	text_far _TokiwaChampCupEndBattleText6
	text_end

TokiwaChampCupAfterBattleText6:
	text_far _TokiwaChampCupAfterBattleText6
	text_end

TokiwaChampCupTrainerText7:
	text_asm
	ld hl, TokiwaChampCupTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

TokiwaChampCupBattleText7:
	text_far _TokiwaChampCupBattleText7
	text_end

TokiwaChampCupEndBattleText7:
	text_far _TokiwaChampCupEndBattleText7
	text_end

TokiwaChampCupAfterBattleText7:
	text_far _TokiwaChampCupAfterBattleText7
	text_end

TokiwaChampCupTrainerText8:
	text_asm
	ld hl, TokiwaChampCupTrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

TokiwaChampCupBattleText8:
	text_far _TokiwaChampCupBattleText8
	text_end

TokiwaChampCupEndBattleText8:
	text_far _TokiwaChampCupEndBattleText8
	text_end

TokiwaChampCupAfterBattleText8:
	text_far _TokiwaChampCupAfterBattleText8
	text_end

TokiwaChampCupGuideText:
	text_asm
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .afterBeat
	ld hl, TokiwaChampCupGuidePreBattleText
	call PrintText
	jr .done
.afterBeat
	ld hl, TokiwaChampCupGuidePostBattleText
	call PrintText
.done
	jp TextScriptEnd

TokiwaChampCupGuidePreBattleText:
	text_far _TokiwaChampCupGuidePreBattleText
	text_end

TokiwaChampCupGuidePostBattleText:
	text_far _TokiwaChampCupGuidePostBattleText
	text_end
