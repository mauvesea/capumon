Route2_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route2TrainerHeaders
	ld de, Route2_ScriptPointers
	ld a, [wRoute2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute2CurScript], a
	ret

Route2_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route2_TextPointers:
	dw Route2NPCDealerText1
	dw Route2NPCDealerText2
	dw Route2NPCDealerText3
	dw Route2NPCDealerText4
	dw Route2NPCDealerText5
	dw Route2NPCDealerText6
	dw Route2NPCDealerText7
	dw Route2NPCDealerText8
	dw Route2NPCDealerText9
	dw Route2FisherText
	dw PickUpItemText
	dw PickUpItemText
	dw Route2SignText1
	dw Route2SignText2
	dw Route2SignText3

Route2TrainerHeaders:
	def_trainers
Route2TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_0, 3, Route2BattleText1, Route2EndBattleText1, Route2AfterBattleText1
Route2TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_1, 3, Route2BattleText2, Route2EndBattleText2, Route2AfterBattleText2
Route2TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_2, 3, Route2BattleText3, Route2EndBattleText3, Route2AfterBattleText3
Route2TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_3, 3, Route2BattleText4, Route2EndBattleText4, Route2AfterBattleText4
Route2TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_4, 3, Route2BattleText5, Route2EndBattleText5, Route2AfterBattleText5
Route2TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_5, 2, Route2BattleText6, Route2EndBattleText6, Route2AfterBattleText6
Route2TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_6, 2, Route2BattleText7, Route2EndBattleText7, Route2AfterBattleText7
Route2TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_7, 2, Route2BattleText8, Route2EndBattleText8, Route2AfterBattleText8
Route2TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_8, 2, Route2BattleText9, Route2EndBattleText9, Route2AfterBattleText9
	db -1 ; end


;   *** Regular NPC Text ***

Route2FisherText:
	text_far _Route2FisherText
	text_end


;   *** Sign Text ***

Route2SignText1:
	text_far _Route2SignText1
	text_end

Route2SignText2:
	text_far _Route2SignText2
	text_end

Route2SignText3:
	text_far _Route2SignText3
	text_end


;   *** Dealer Text ***

Route2NPCDealerText1:
	text_asm
	ld hl, Route2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText1:
	text_far _Route2BattleText1
	text_end
Route2EndBattleText1:
	text_far _Route2EndBattleText1
	text_end
Route2AfterBattleText1:
	text_far _Route2AfterBattleText1
	text_end


Route2NPCDealerText2:
	text_asm
	ld hl, Route2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText2:
	text_far _Route2BattleText2
	text_end
Route2EndBattleText2:
	text_far _Route2EndBattleText2
	text_end
Route2AfterBattleText2:
	text_far _Route2AfterBattleText2
	text_end


Route2NPCDealerText3:
	text_asm
	ld hl, Route2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText3:
	text_far _Route2BattleText3
	text_end
Route2EndBattleText3:
	text_far _Route2EndBattleText3
	text_end
Route2AfterBattleText3:
	text_far _Route2AfterBattleText3
	text_end


Route2NPCDealerText4:
	text_asm
	ld hl, Route2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText4:
	text_far _Route2BattleText4
	text_end
Route2EndBattleText4:
	text_far _Route2EndBattleText4
	text_end
Route2AfterBattleText4:
	text_far _Route2AfterBattleText4
	text_end


Route2NPCDealerText5:
	text_asm
	ld hl, Route2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText5:
	text_far _Route2BattleText5
	text_end
Route2EndBattleText5:
	text_far _Route2EndBattleText5
	text_end
Route2AfterBattleText5:
	text_far _Route2AfterBattleText5
	text_end


Route2NPCDealerText6:
	text_asm
	ld hl, Route2TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText6:
	text_far _Route2BattleText6
	text_end
Route2EndBattleText6:
	text_far _Route2EndBattleText6
	text_end
Route2AfterBattleText6:
	text_far _Route2AfterBattleText6
	text_end


Route2NPCDealerText7:
	text_asm
	ld hl, Route2TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText7:
	text_far _Route2BattleText7
	text_end
Route2EndBattleText7:
	text_far _Route2EndBattleText7
	text_end
Route2AfterBattleText7:
	text_far _Route2AfterBattleText7
	text_end


Route2NPCDealerText8:
	text_asm
	ld hl, Route2TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText8:
	text_far _Route2BattleText8
	text_end
Route2EndBattleText8:
	text_far _Route2EndBattleText8
	text_end
Route2AfterBattleText8:
	text_far _Route2AfterBattleText8
	text_end


Route2NPCDealerText9:
	text_asm
	ld hl, Route2TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd
Route2BattleText9:
	text_far _Route2BattleText9
	text_end
Route2EndBattleText9:
	text_far _Route2EndBattleText9
	text_end
Route2AfterBattleText9:
	text_far _Route2AfterBattleText9
	text_end
