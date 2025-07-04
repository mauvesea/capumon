	const_def -1
	const MOVE_NIDORINO_RIGHT
	const MOVE_GENGAR_RIGHT
	const MOVE_GENGAR_LEFT

DEF ANIMATION_END EQU 80

PlayIntro:
	xor a
	ldh [hJoyHeld], a
	inc a
	ldh [hAutoBGTransferEnabled], a
	call LoadSplashGFXIntro
	call GBFadeOutToWhite
	xor a
	ldh [hSCX], a
	ldh [hAutoBGTransferEnabled], a
	call ClearSprites
	call DelayFrame
	ret

IntroClearScreen:
	ld hl, vBGMap1
	ld bc, BG_MAP_WIDTH * SCREEN_HEIGHT
	jr IntroClearCommon

IntroClearMiddleOfScreen:
; clear the area of the tile map between the black bars on the top and bottom
	hlcoord 0, 4
	ld bc, SCREEN_WIDTH * 10

IntroClearCommon:
	ld [hl], 0
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, IntroClearCommon
	ret

IntroPlaceBlackTiles:
	ld a, 1
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

IntroCopyTiles:
	hlcoord 13, 7

CopyTileIDsFromList_ZeroBaseTileID:
	ld c, 0
	predef_jump CopyTileIDsFromList

LoadSplashGFXIntro:
	ld b, SET_PAL_GAME_FREAK_INTRO
	call RunPaletteCommand
	farcall LoadCopyrightAndTextBoxTiles
	ldpal a, SHADE_BLACK, SHADE_DARK, SHADE_LIGHT, SHADE_WHITE
	ldh [rBGP], a
	ld c, 180
	call DelayFrames
	call ClearScreen
	call DisableLCD
	xor a
	ld [wCurOpponent], a
	call EnableLCD
	call ClearSprites
	jp Delay3

GameFreakIntro:: INCBIN "gfx/title/splash.2bpp"
