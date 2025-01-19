; copy text of fixed length NAME_LENGTH (like player name, rival name, mon names, ...)
CopyFixedLengthText:
	ld bc, NAME_LENGTH
	jp CopyData

SetDefaultNamesBeforeTitlescreen::
	ld hl, NintenText
	ld de, wPlayerName
	call CopyFixedLengthText
	ld hl, SonyText
	ld de, wRivalName
	call CopyFixedLengthText
	
	xor a
	ldh [hWY], a
	ld [wLetterPrintingDelayFlags], a
	ld hl, wd732
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, BANK(Music_TitleScreen)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a

DisplayTitleScreen:
	xor a
	ldh [hTileAnimations], a
	call GBPalWhiteOut
;	ld a, $1
;	ldh [hAutoBGTransferEnabled], a
;	xor a
;	ldh [hTileAnimations], a
;	ldh [hSCX], a
;	ld a, $40
;	ldh [hSCY], a
;	ld a, $90
;	ldh [hWY], a
	call ClearScreen
	call DisableLCD
	call LoadFontTilePatterns
	
	ld hl, NintendoCopyrightLogoGraphics
	ld de, vTitleLogo2 tile 16
	ld bc, 5 tiles
	ld a, BANK(NintendoCopyrightLogoGraphics)
	call FarCopyData2
	
	ld hl, GamefreakLogoGraphics
	ld de, vTitleLogo2 tile (16 + 5)
	ld bc, 36 tiles
	ld a, BANK(GamefreakLogoGraphics)
	call FarCopyData2

	ld hl, Logo1GFX
	ld de, vTitleLogo
	ld bc, $70 tiles
	ld a, BANK(Logo1GFX)
	call FarCopyData2
	
	ld hl, Logo2GFX
	ld de, vTitleLogo tile 128
	ld bc, $24 tiles
	ld a, BANK(Logo2GFX)
	call FarCopyData2	

	call ClearBothBGMaps

; logo first half
	hlcoord 1, 1
	ld a, $80
	ld de, 20
	ld c, 6
.pokemonLogoTileLoop
	ld b, $12
	push hl
.pokemonLogoTileRowLoop ; place tiles for one row
	ld [hli], a
	inc a
	dec b
	jr nz, .pokemonLogoTileRowLoop
	pop hl
	add hl, de
	dec c
	jr nz, .pokemonLogoTileLoop
	
; logo second half
	hlcoord 1, 7
	ld a, $00
	ld de, 20
	ld c, 2
.pokemonLogo2TileLoop
	ld b, $12
	push hl
.pokemonLogo2TileRowLoop ; place tiles for one row
	ld [hli], a
	inc a
	dec b
	jr nz, .pokemonLogo2TileRowLoop
	pop hl
	add hl, de
	dec c
	jr nz, .pokemonLogo2TileLoop	

	hlcoord 6, 13
	ld de, .PressStartTiles
	ld b, $8
.PressStartTilesLoop
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .PressStartTilesLoop

.PressStartTiles
	db $46,$47,$48,$49,$4A,$4B,$4C,$4D

	hlcoord 5, 17
	ld de, .NintendoCopyrightTiles
	ld b, $a
.NintendoCopyrightTilesLoop
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .NintendoCopyrightTilesLoop

.NintendoCopyrightTiles
	db $4e, $4f, $50, $51, $52, $53, $54, $55, $56, $57
	
	call SaveScreenTilesToBuffer2
	call LoadScreenTilesFromBuffer2
	call EnableLCD

	ld b, SET_PAL_TITLE_SCREEN
	call RunPaletteCommand
	call GBPalNormal
	ld a, %11100100
	ldh [rOBP0], a


	ld a, HIGH(vBGMap1)
	call TitleScreenCopyTileMapToVRAM
	call LoadScreenTilesFromBuffer2
	call Delay3
	ld a, MUSIC_TITLE_SCREEN
	ld [wNewSoundID], a
	call PlaySound
	xor a
	ld [wUnusedCC5B], a

.awaitUserInterruptionLoop
	ld c, 200
	call Joypad
	ldh a, [hJoyHeld]
	bit BIT_START, a
	jr nz, .finishedWaiting
IF DEF(_DEBUG)
	bit BIT_SELECT, a
	jr nz, .finishedWaiting
ENDC
	jr .awaitUserInterruptionLoop

.finishedWaiting
.randomLoop ; loop until a random number less than 5 is generated
	call Random
	cp 32
	jr nc, .randomLoop
	jr z, .randomLoop
	call PlayCry
	call WaitForSoundToFinish
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	xor a
	ldh [hWY], a
	inc a
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	ld a, HIGH(vBGMap0)
	call TitleScreenCopyTileMapToVRAM
	ld a, HIGH(vBGMap1)
	call TitleScreenCopyTileMapToVRAM
	call Delay3
	call LoadGBPal
	ldh a, [hJoyHeld]
	ld b, a
	and D_UP | SELECT | B_BUTTON
	cp D_UP | SELECT | B_BUTTON
	jp z, .doClearSaveDialogue
IF DEF(_DEBUG)
	ld a, b
	bit BIT_SELECT, a
	jp nz, DebugMenu
ENDC
	jp MainMenu

.doClearSaveDialogue
	farjp DoClearSaveDialogue

ClearBothBGMaps:
	ld hl, vBGMap0
	ld bc, $400 * 2
	ld a, " "
	jp FillMemory

TitleScreenCopyTileMapToVRAM:
	ldh [hAutoBGTransferDest + 1], a
	jp Delay3

LoadCopyrightAndTextBoxTiles:
	xor a
	ldh [hWY], a
	call ClearScreen
	call LoadTextBoxTilePatterns

LoadCopyrightTiles:
	ld de, NintendoCopyrightLogoGraphics
	ld hl, vChars2 tile $30
	lb bc, BANK(NintendoCopyrightLogoGraphics), (NintendoCopyrightLogoGraphics) / $10
	call CopyVideoData
	hlcoord 5, 7
	ld de, CopyrightTextString
	jp PlaceString

CopyrightTextString: ; GAMEFREAK PRESENTS
	db   $30,$31,$32,$33,$41,$34,$35,$36,$37,$38
	next $41
	next $41, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40 
	db   "@"

NintenText: db "YUUICHI@"
SonyText:   db "Sony@"
