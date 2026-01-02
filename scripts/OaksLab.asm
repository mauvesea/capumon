OaksLab_Script:
	call EnableAutoTextBoxDrawing
	ld hl, OaksLab_ScriptPointers
	ld a, [wOaksLabCurScript]
	jp CallFunctionInTable

OaksLab_ScriptPointers:
	dw OaksLabScript0
	
OaksLabScript0:
	CheckEvent EVENT_GOT_POKEDEX
	ret nz
	CheckEvent EVENT_CAN_TAKE_DEX
	jr z, .Finish
	ld a, [wYCoord]
	cp 5
	ret nz
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
.Finish
	ret	

OaksLab_TextPointers:
	dw TokiwaOokidoSchoolScript1
	dw TokiwaOokidoSchoolDexScript1
	dw TokiwaOokidoSchoolDexScript2
	dw TokiwaOokidoSchoolScientistScript
	dw TokiwaOokidoSchoolGirlScript
	dw OokidoDexText3

TokiwaOokidoSchoolScript1:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .CheckPokedexProgress
	CheckEvent EVENT_CAN_TAKE_DEX
	jr nz, .GetDex
	ld hl, OokidoDexText1
	call PrintText
	SetEvent EVENT_CAN_TAKE_DEX
	jr .ScriptEnd
.GetDex
	ld hl, OokidoDexText2
	call PrintText
	jr .ScriptEnd
.CheckPokedexProgress
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ld hl, OaksLabText_1d31d
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	predef DisplayDexRating
.ScriptEnd	
	jp TextScriptEnd
	
TokiwaOokidoSchoolDexScript1:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .RegularText
	CheckEvent EVENT_CAN_TAKE_DEX
	jr nz, .GetDex
.RegularText
	ld hl, TokiwaDexText
	call PrintText
	jr .ScriptEnd
.GetDex
	lb bc, POKEDEX, 1
	call GiveItem
	jr nc, .bag_full
	ld a, HS_POKEDEX_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, TokiwaReceivedDexText
	call PrintText
	SetEvent EVENT_GOT_POKEDEX
	jr .ScriptEnd
.bag_full
	ld hl, OokidoSchoolBagFull
	call PrintText
.ScriptEnd
	jp TextScriptEnd

TokiwaOokidoSchoolDexScript2:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .RegularText
	CheckEvent EVENT_CAN_TAKE_DEX
	jr nz, .GetDex
.RegularText	
	ld hl, TokiwaDexText
	call PrintText
	jr .ScriptEnd
.GetDex	
	lb bc, POKEDEX, 1
	call GiveItem
	jr nc, .bag_full
	ld a, HS_POKEDEX_2
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, TokiwaReceivedDexText
	call PrintText
	SetEvent EVENT_GOT_POKEDEX
	jr .ScriptEnd
.bag_full
	ld hl, OokidoSchoolBagFull
	call PrintText
.ScriptEnd
	jp TextScriptEnd
	
TokiwaOokidoSchoolScientistScript:
	text_asm
	ld hl, TokiwaOokidoSchoolScientistText
	call PrintText
	jp TextScriptEnd
	
TokiwaOokidoSchoolGirlScript:
	text_asm
	ld hl, TokiwaOokidoSchoolGirlText
	call PrintText
	jp TextScriptEnd

OokidoDexText1:
	text_far _OokidoDexText1
	text_end
	
OokidoDexText2:
	text_far _OokidoDexText2
	text_end
	
OokidoDexText3:
	text_far _OokidoDexText3
	text_end
	
OaksLabText_1d31d:
	text_far _OaksLabText_1d31d
	text_end
	
OokidoSchoolBagFull:
	text_far _OokidoSchoolBagFull
	text_end

TokiwaDexText:
	text_far _TokiwaDexText
	text_end	

TokiwaReceivedDexText:
	text_far _TokiwaReceivedDexText
	sound_get_key_item
	text_end
	
TokiwaOokidoSchoolScientistText:
	text_far _TokiwaOokidoSchoolScientistText
	text_end	
	
TokiwaOokidoSchoolGirlText:
	text_far _TokiwaOokidoSchoolGirlScript
	text_end	
	

	
