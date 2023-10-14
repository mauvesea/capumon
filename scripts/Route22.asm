Route22_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route22TrainerHeaders
	ld de, Route22_ScriptPointers
	ld a, [wRoute22CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute22CurScript], a
	ret

Route22_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route22_TextPointers:
	dw Route22Text1
	dw Route22Text2
	dw Route22Text3
	dw Route22Text4
	dw Route22Text5
	dw Route22Text6
	dw Route22Text7
	dw Route22Text8
	dw Route22Text9
	dw Route22Text10

Route22TrainerHeaders:
	def_trainers 2
Route22TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_22_TRAINER_0, 3, Route22BattleText1, Route22EndBattleText1, Route22AfterBattleText1
Route22TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_22_TRAINER_1, 3, Route22BattleText2, Route22EndBattleText2, Route22AfterBattleText2
Route22TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_22_TRAINER_2, 3, Route22BattleText3, Route22EndBattleText3, Route22AfterBattleText3
Route22TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_22_TRAINER_3, 3, Route22BattleText4, Route22EndBattleText4, Route22AfterBattleText4
Route22TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_22_TRAINER_4, 3, Route22BattleText5, Route22EndBattleText5, Route22AfterBattleText5
Route22TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_22_TRAINER_5, 2, Route22BattleText6, Route22EndBattleText6, Route22AfterBattleText6
Route22TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_22_TRAINER_6, 2, Route22BattleText7, Route22EndBattleText7, Route22AfterBattleText7
Route22TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_22_TRAINER_7, 2, Route22BattleText8, Route22EndBattleText8, Route22AfterBattleText8
	db -1 ; end

Route22Text1:
	text_far _Route22Text1
	text_end

Route22Text2:
	text_asm
	ld hl, Route22TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route22BattleText1:
	text_far _Route22BattleText1
	text_end

Route22EndBattleText1:
	text_far _Route22EndBattleText1
	text_end

Route22AfterBattleText1:
	text_far _Route22AfterBattleText1
	text_end

Route22Text3:
	text_asm
	ld hl, Route22TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route22BattleText2:
	text_far _Route22BattleText2
	text_end

Route22EndBattleText2:
	text_far _Route22EndBattleText2
	text_end

Route22AfterBattleText2:
	text_far _Route22AfterBattleText2
	text_end

Route22Text4:
	text_asm
	ld hl, Route22TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route22BattleText3:
	text_far _Route22BattleText3
	text_end

Route22EndBattleText3:
	text_far _Route22EndBattleText3
	text_end

Route22AfterBattleText3:
	text_far _Route22AfterBattleText3
	text_end

Route22Text5:
	text_asm
	ld hl, Route22TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route22BattleText4:
	text_far _Route22BattleText4
	text_end

Route22EndBattleText4:
	text_far _Route22EndBattleText4
	text_end

Route22AfterBattleText4:
	text_far _Route22AfterBattleText4
	text_end

Route22Text6:
	text_asm
	ld hl, Route22TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route22BattleText5:
	text_far _Route22BattleText5
	text_end

Route22EndBattleText5:
	text_far _Route22EndBattleText5
	text_end

Route22AfterBattleText5:
	text_far _Route22AfterBattleText5
	text_end

Route22Text7:
	text_asm
	ld hl, Route22TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route22BattleText6:
	text_far _Route22BattleText6
	text_end

Route22EndBattleText6:
	text_far _Route22EndBattleText6
	text_end

Route22AfterBattleText6:
	text_far _Route22AfterBattleText6
	text_end

Route22Text8:
	text_asm
	ld hl, Route22TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route22BattleText7:
	text_far _Route22BattleText7
	text_end

Route22EndBattleText7:
	text_far _Route22EndBattleText7
	text_end

Route22AfterBattleText7:
	text_far _Route22AfterBattleText7
	text_end

Route22Text9:
	text_asm
	ld hl, Route22TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route22BattleText8:
	text_far _Route22BattleText8
	text_end

Route22EndBattleText8:
	text_far _Route22EndBattleText8
	text_end

Route22AfterBattleText8:
	text_far _Route22AfterBattleText8
	text_end

Route22Text10:
	text_far _Route22Text10
	text_end
