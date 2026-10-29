RockTunnelB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnel2TrainerHeaders
	ld de, RockTunnelB1F_ScriptPointers
	ld a, [wRockTunnelB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRockTunnelB1FCurScript], a
	ret

RockTunnelB1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

RockTunnelB1F_TextPointers:
	dw RockTunnel2Text1
	dw RockTunnel2Text2
	dw RockTunnel2Text3
	dw RockTunnel2Text4
	dw RockTunnel2Text5
	dw RockTunnel2Text6
	dw RockTunnel2Text7
	dw RockTunnel2Text8

RockTunnel2TrainerHeaders:
	def_trainers
RockTunnel2TrainerHeader0:
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_0, 4, RockTunnel2BattleText2, RockTunnel2EndBattleText2, RockTunnel2AfterBattleText2, RockTunnelB1FInBattleScript0
RockTunnel2TrainerHeader1:
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_1, 3, RockTunnel2BattleText3, RockTunnel2EndBattleText3, RockTunnel2AfterBattleText3, RockTunnelB1FInBattleScript1
RockTunnel2TrainerHeader2:
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_2, 3, RockTunnel2BattleText4, RockTunnel2EndBattleText4, RockTunnel2AfterBattleText4, RockTunnelB1FInBattleScript2
RockTunnel2TrainerHeader3:
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_3, 4, RockTunnel2BattleText5, RockTunnel2EndBattleText5, RockTunnel2AfterBattleText5, RockTunnelB1FInBattleScript3
RockTunnel2TrainerHeader4:
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_4, 3, RockTunnel2BattleText6, RockTunnel2EndBattleText6, RockTunnel2AfterBattleText6, RockTunnelB1FInBattleScript4
RockTunnel2TrainerHeader5:
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_5, 4, RockTunnel2BattleText7, RockTunnel2EndBattleText7, RockTunnel2AfterBattleText7, RockTunnelB1FInBattleScript5
RockTunnel2TrainerHeader6:
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_6, 3, RockTunnel2BattleText8, RockTunnel2EndBattleText8, RockTunnel2AfterBattleText8, RockTunnelB1FInBattleScript6
RockTunnel2TrainerHeader7:
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_7, 3, RockTunnel2BattleText9, RockTunnel2EndBattleText9, RockTunnel2AfterBattleText9, RockTunnelB1FInBattleScript7
	db -1 ; end

RockTunnel2Text1:
	text_asm
	ld hl, RockTunnel2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text2:
	text_asm
	ld hl, RockTunnel2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text3:
	text_asm
	ld hl, RockTunnel2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text4:
	text_asm
	ld hl, RockTunnel2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text5:
	text_asm
	ld hl, RockTunnel2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text6:
	text_asm
	ld hl, RockTunnel2TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text7:
	text_asm
	ld hl, RockTunnel2TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2Text8:
	text_asm
	ld hl, RockTunnel2TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel2BattleText2:
	text_far _RockTunnel2BattleText2
	text_end

RockTunnel2EndBattleText2:
	text_far _RockTunnel2EndBattleText2
	text_end

RockTunnel2AfterBattleText2:
	text_far _RockTunnel2AfterBattleText2
	text_end

RockTunnel2BattleText3:
	text_far _RockTunnel2BattleText3
	text_end

RockTunnel2EndBattleText3:
	text_far _RockTunnel2EndBattleText3
	text_end

RockTunnel2AfterBattleText3:
	text_far _RockTunnel2AfterBattleText3
	text_end

RockTunnel2BattleText4:
	text_far _RockTunnel2BattleText4
	text_end

RockTunnel2EndBattleText4:
	text_far _RockTunnel2EndBattleText4
	text_end

RockTunnel2AfterBattleText4:
	text_far _RockTunnel2AfterBattleText4
	text_end

RockTunnel2BattleText5:
	text_far _RockTunnel2BattleText5
	text_end

RockTunnel2EndBattleText5:
	text_far _RockTunnel2EndBattleText5
	text_end

RockTunnel2AfterBattleText5:
	text_far _RockTunnel2AfterBattleText5
	text_end

RockTunnel2BattleText6:
	text_far _RockTunnel2BattleText6
	text_end

RockTunnel2EndBattleText6:
	text_far _RockTunnel2EndBattleText6
	text_end

RockTunnel2AfterBattleText6:
	text_far _RockTunnel2AfterBattleText6
	text_end

RockTunnel2BattleText7:
	text_far _RockTunnel2BattleText7
	text_end

RockTunnel2EndBattleText7:
	text_far _RockTunnel2EndBattleText7
	text_end

RockTunnel2AfterBattleText7:
	text_far _RockTunnel2AfterBattleText7
	text_end

RockTunnel2BattleText8:
	text_far _RockTunnel2BattleText8
	text_end

RockTunnel2EndBattleText8:
	text_far _RockTunnel2EndBattleText8
	text_end

RockTunnel2AfterBattleText8:
	text_far _RockTunnel2AfterBattleText8
	text_end

RockTunnel2BattleText9:
	text_far _RockTunnel2BattleText9
	text_end

RockTunnel2EndBattleText9:
	text_far _RockTunnel2EndBattleText9
	text_end

RockTunnel2AfterBattleText9:
	text_far _RockTunnel2AfterBattleText9
	text_end

; Pre-battle TALK scripts. Every trainer gets its own copy of the default
; placeholder so it can be replaced with something specific to them.
	default_in_battle_script RockTunnelB1FInBattleScript0
	default_in_battle_script RockTunnelB1FInBattleScript1
	default_in_battle_script RockTunnelB1FInBattleScript2
	default_in_battle_script RockTunnelB1FInBattleScript3
	default_in_battle_script RockTunnelB1FInBattleScript4
	default_in_battle_script RockTunnelB1FInBattleScript5
	default_in_battle_script RockTunnelB1FInBattleScript6
	default_in_battle_script RockTunnelB1FInBattleScript7
