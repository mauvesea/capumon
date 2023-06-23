BluesHouse_Script:
	call EnableAutoTextBoxDrawing

BluesHouse_TextPointers:
	dw NanamiScript

NanamiScript:
	text_asm
	CheckEvent EVENT_GOT_TOWN_MAP
	jr nz, .got_town_map
	ld hl, NanamiText1
	call PrintText
	lb bc, TOWN_MAP, 1
	call GiveItem
	jr nc, .bag_full
	ld a, HS_TOWN_MAP
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, GotMapText
	call PrintText
	SetEvent EVENT_GOT_TOWN_MAP
	ld hl, NanamiText2
	call PrintText	
	jr .done

.got_town_map
	ld hl, NanamiText3
	call PrintText
	jr .done

.bag_full
	ld hl, NanamiBagFullText
	call PrintText
.done
	jp TextScriptEnd

NanamiText1:
	text_far _NanamiText1
	text_end

NanamiText2:
	text_far _NanamiText2
	text_end

NanamiText3:
	text_far _NanamiText3
	text_end

GotMapText:
	text_far _GotMapText
	sound_get_key_item
	text_end
	
NanamiBagFullText:
	text_far _NanamiBagFullText
	text_end
	