PlayersHouse1F_Script:
	jp EnableAutoTextBoxDrawing

PlayersHouse1F_TextPointers:
	dw PlayersHouse1FMomText
	dw PlayersHouse1FDadText
	dw PlayersHouse1FTVText

PlayersHouse1FMomText:
	text_asm
	call MomHealPokemon
.done
	jp TextScriptEnd

MomWakeUpText:
	text_far _MomWakeUpText
	text_end

MomHealPokemon:
	ld hl, MomHealText1
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.next
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wMapMusicSoundID]
	ld [wNewSoundID], a
	call PlaySound
	call GBFadeInFromWhite
	ld hl, MomHealText2
	jp PrintText

MomHealText1:
	text_far _MomHealText1
	text_end
MomHealText2:
	text_far _MomHealText2
	text_end

PlayersHouse1FDadText:
	text_far _PlayersHouse1FDadText
	text_end

PlayersHouse1FTVText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, TVWrongSideText
	jr nz, .got_text
	ld hl, StandByMeText
.got_text
	call PrintText
	jp TextScriptEnd

StandByMeText:
	text_far _StandByMeText
	text_end

TVWrongSideText:
	text_far _TVWrongSideText
	text_end
