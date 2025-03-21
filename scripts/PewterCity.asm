PewterCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PewterCity_ScriptPointers
	ld a, [wPewterCityCurScript]
	jp CallFunctionInTable

PewterCity_ScriptPointers:
	dw NibiDefaultScript

NibiDefaultScript:
	xor a
	ld [wMuseum1FCurScript], a
	ResetEvent EVENT_BOUGHT_MUSEUM_TICKET
	call NibiScriptCantLeaveCity
	ret

NibiScriptCantLeaveCity:
	CheckEvent EVENT_BEAT_BROCK
	ret nz
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
	ld a, [wXCoord]
	cp 35
	ret nz
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, 5
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

PewterCity_TextPointers:
	dw NibiNPCText1
	dw NibiNPCText2
	dw NibiNPCText3
	dw NibiNPCText4
	dw NibiNPCText5
	dw MartSignText
	dw PokeCenterSignText
	dw NibiCityText
	dw NibiChampCupText
	dw NibiMuseumText
	dw NibiRocketText
	dw NibiPoliceText

NibiNPCText1:
	text_far _NibiNPCText1
	text_end

NibiNPCText2:
	text_far _NibiNPCText2
	text_end

NibiNPCText3:
	text_far _NibiNPCText3
	text_end

NibiNPCText4:
	text_far _NibiNPCText4
	text_end

NibiNPCText5:
	text_asm
	ld hl, NibiCantLeaveText
	call PrintText
	xor a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_LEFT
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	jp TextScriptEnd

NibiCantLeaveText:
	text_far _NibiCantLeaveText
	text_end

NibiCityText:
	text_far _NibiCityText
	text_end

NibiChampCupText:
	text_far _NibiChampCupText
	text_end

NibiMuseumText:
	text_far _NibiMuseumText
	text_end

NibiRocketText:
	text_far _NibiRocketText
	text_end

NibiPoliceText:
	text_far _NibiPoliceText
	text_end
