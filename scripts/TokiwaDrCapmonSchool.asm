TokiwaDrCapmonSchool_Script:
	call EnableAutoTextBoxDrawing
	ld hl, TokiwaDrCapmonSchool_ScriptPointers
	ld a, [wTokiwaDrCapmonSchoolCurScript]
	jp CallFunctionInTable

TokiwaDrCapmonSchool_ScriptPointers:
	dw TokiwaDrCapmonSchoolScript0
	
TokiwaDrCapmonSchoolScript0:
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

TokiwaDrCapmonSchool_TextPointers:
	dw TokiwaDrCapmonSchoolScript1
	dw TokiwaDrCapmonSchoolDexScript1
	dw TokiwaDrCapmonSchoolDexScript2
	dw TokiwaDrCapmonSchoolScientistScript
	dw TokiwaDrCapmonSchoolGirlScript
	dw OokidoDexText3

TokiwaDrCapmonSchoolScript1:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .CheckPokedexProgress
	CheckEvent EVENT_CAN_TAKE_DEX
	jr nz, .GetDex
	ld hl, OokidoDexText1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .RefusedFieldGuide

	SetEvent EVENT_CAN_TAKE_DEX
	ld hl, OokidoDexText2
	call PrintText
	jr .ScriptEnd
.RefusedFieldGuide
	ld hl, OokidoDexText3
	call PrintText
	jr .ScriptEnd
.GetDex
	ld hl, OokidoDexText4
	call PrintText
	jr .ScriptEnd
.CheckPokedexProgress
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ld hl, OokidoDexText5
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	predef DisplayDexRating
.ScriptEnd	
	jp TextScriptEnd
	
TokiwaDrCapmonSchoolDexScript1:
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
	ld hl, TokiwaDrCapmonSchoolCatchingText
	call PrintText
	SetEvent EVENT_GOT_POKEDEX
	jr .ScriptEnd
.bag_full
	ld hl, OokidoSchoolBagFull
	call PrintText
.ScriptEnd
	jp TextScriptEnd

TokiwaDrCapmonSchoolDexScript2:
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
	ld hl, TokiwaDrCapmonSchoolCatchingText
	call PrintText
	SetEvent EVENT_GOT_POKEDEX
	jr .ScriptEnd
.bag_full
	ld hl, OokidoSchoolBagFull
	call PrintText
.ScriptEnd
	jp TextScriptEnd
	
TokiwaDrCapmonSchoolScientistScript:
	text_asm
	ld hl, TokiwaDrCapmonSchoolScientistText
	call PrintText
	jp TextScriptEnd
	
TokiwaDrCapmonSchoolGirlScript:
	text_asm
	ld hl, TokiwaDrCapmonSchoolGirlText
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

OokidoDexText4:
	text_far _OokidoDexText4
	text_end
	
OokidoDexText5:
	text_far _OokidoDexText5
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
	
TokiwaDrCapmonSchoolScientistText:
	text_far _TokiwaDrCapmonSchoolScientistText
	text_end	
	
TokiwaDrCapmonSchoolGirlText:
	text_far _TokiwaDrCapmonSchoolGirlScript
	text_end	

TokiwaDrCapmonSchoolCatchingText:
	text_far _TokiwaDrCapmonSchoolCatchingText
	text_end
	
