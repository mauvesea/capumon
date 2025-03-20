SetDefaultNames:
	ld a, [wLetterPrintingDelayFlags]
	push af
	ld a, [wOptions]
	push af
	ld a, [wd732]
	push af
	ld hl, wPlayerName
	ld bc, wBoxDataEnd - wPlayerName
	xor a
	call FillMemory
	ld hl, wSpriteDataStart
	ld bc, wSpriteDataEnd - wSpriteDataStart
	xor a
	call FillMemory
	pop af
	ld [wd732], a
	pop af
	ld [wOptions], a
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, [wOptionsInitialized]
	and a
	call z, InitOptions
	ld hl, NintenText
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, SonyText
	ld de, wRivalName
	ld bc, NAME_LENGTH
	jp CopyData

OakSpeech:
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld a, BANK(Music_Routes2)
	ld c, a
	ld a, MUSIC_ROUTES2
	call PlayMusic
	call ClearScreen
	call SetDefaultNames
	predef InitPlayerData2
	ld hl, wNumBoxItems
	ld a, POTION
	ld [wcf91], a
	ld a, 1
	ld [wItemQuantity], a
	call AddItemToInventory  ; give one potion
	ld a, [wDefaultMap]
	ld [wDestinationMap], a
	call SpecialWarpIn
	xor a
	ldh [hTileAnimations], a
	ld a, [wd732]
	bit 1, a ; possibly a debug mode bit
	jp nz, .skipChoosingNames


;	ld de, ProfOakPic
;	lb bc, BANK(ProfOakPic), $00
;	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, OakSpeechText1
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen

	call FadeInIntroPic
	ld hl, BoyGirlText
  	call PrintText
  	call BoyGirlChoice
   	ld a, [wCurrentMenuItem]
   	ld [wPlayerGender], a
	and a
	jr z, .ChoseBoy
	ld hl, OakSpeechGirlText
  	call PrintText
	jr .ChooseYourNameTransition
.ChoseBoy
	ld hl, OakSpeechBoyText
  	call PrintText
.ChooseYourNameTransition	
	call GBFadeOutToWhite
   	call ClearScreen

	ld a, [wPlayerGender]
	and a
	jr z, .BoyFrontPic1
	ld de, PlayerFPicFront
	lb bc, BANK(PlayerFPicFront), $00
	jr .FrontPicSelected
.BoyFrontPic1
	ld de, PlayerMPicFront
	lb bc, BANK(PlayerMPicFront), $00
.FrontPicSelected
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	
	ld hl, IntroducePlayerText
	call PrintText
	call ChoosePlayerName
.skipChoosingNames
	call GBFadeOutToWhite
	call ClearScreen
	
;	ld de, Rival1Pic
;	lb bc, BANK(Rival1Pic), $00
;	call IntroDisplayPicCenteredOrUpperRight
;	call FadeInIntroPic
;	ld hl, IntroduceRivalText
;	call PrintText
;	call ChooseRivalName

;	call GBFadeOutToWhite
;	call ClearScreen

   	ld a, [wPlayerGender]
	and a
	jr z, .ChoseBoyStarter
	ld a, HARIUSAF
	ld [wd0b5], a
	ld [wcf91], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFrontSpriteByMonIndex
	call FadeInIntroPic
	ld hl, OakSpeechText2
	call PrintText

	ld de, StarterMonF ; add starter
	ld a, [de]
	cp -1
	ret z
	ld [wcf91], a
	inc de
	ld a, [de]
	ld [wCurEnemyLVL], a
	inc de	
	call AddPartyMon
	jr .StarterSceneFinish
	
.ChoseBoyStarter
	ld a, HARIUSAM
	ld [wd0b5], a
	ld [wcf91], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFrontSpriteByMonIndex
	call FadeInIntroPic
	ld hl, OakSpeechText2
	call PrintText

	ld de, StarterMonM ; add starter
	ld a, [de]
	cp -1
	ret z
	ld [wcf91], a
	inc de
	ld a, [de]
	ld [wCurEnemyLVL], a
	inc de	
	call AddPartyMon
	
.StarterSceneFinish	
	ld hl, OakSpeechText3
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen

   	ld a, [wPlayerGender]
	and a
	jr z, .BoyFrontPic2
	ld de, PlayerFPicFront
	lb bc, BANK(PlayerFPicFront), $00
	jr .FrontPicSelected2
.BoyFrontPic2	
	ld de, PlayerMPicFront
	lb bc, BANK(PlayerMPicFront), $00
.FrontPicSelected2	
	call IntroDisplayPicCenteredOrUpperRight
	call GBFadeInFromWhite
	ld a, [wd72d]
	and a
	jr nz, .next
	ld hl, OakSpeechText4
	call PrintText
.next
	ldh a, [hLoadedROMBank]
	push af
	ld a, SFX_SHRINK
	call PlaySound
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 4
	call DelayFrames

   	ld a, [wPlayerGender]
	and a
	jr z, .BoySpriteSelected
	ld de, RedFSprite
	ld hl, vSprites
	lb bc, BANK(RedFSprite), $0C	
	jr .SpriteSelected
.BoySpriteSelected	
	ld de, RedSprite
	ld hl, vSprites
	lb bc, BANK(RedSprite), $0C
.SpriteSelected
	call CopyVideoData
	ld de, ShrinkPic1
	lb bc, BANK(ShrinkPic1), $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c, 4
	call DelayFrames
	ld de, ShrinkPic2
	lb bc, BANK(ShrinkPic2), $00
	call IntroDisplayPicCenteredOrUpperRight
	call ResetPlayerSpriteData
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(Music_PalletTown)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, 10
	ld [wAudioFadeOutControl], a
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 20
	call DelayFrames
	hlcoord 6, 5
	ld b, 7
	ld c, 7
	call ClearScreenArea
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld c, 50
	call DelayFrames
	call GBFadeOutToWhite
	jp ClearScreen
OakSpeechText1:
	text_far _OakSpeechText1
	text_end
OakSpeechText2:
	text_far _OakSpeechText2
	text_end
IntroducePlayerText:
	text_far _IntroducePlayerText
	text_end
IntroduceRivalText:
	text_far _IntroduceRivalText
	text_end
OakSpeechText3:
	text_far _OakSpeechText3
	text_end
OakSpeechText4:
	text_far _OakSpeechText4
	text_end	
BoyGirlText:
    text_far _BoyGirlText
    text_end
OakSpeechBoyText:
    text_far _OakSpeechBoyText
    text_end
OakSpeechGirlText:
    text_far _OakSpeechGirlText
    text_end
	
FadeInIntroPic:
	ld hl, IntroFadePalettes
	ld b, 6
.next
	ld a, [hli]
	ldh [rBGP], a
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .next
	ret

IntroFadePalettes:
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

MovePicLeft:
	ld a, 119
	ldh [rWX], a
	call DelayFrame

	ld a, %11100100
	ldh [rBGP], a
.next
	call DelayFrame
	ldh a, [rWX]
	sub 8
	cp $FF
	ret z
	ldh [rWX], a
	jr .next

DisplayPicCenteredOrUpperRight:
	call GetPredefRegisters
IntroDisplayPicCenteredOrUpperRight:
; b = bank
; de = address of compressed pic
; c: 0 = centred, non-zero = upper-right
	push bc
	ld a, b
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $400
	call CopyData
	ld de, vFrontPic
	call InterlaceMergeSpriteBuffers
	pop bc
	ld a, c
	and a
	hlcoord 15, 1
	jr nz, .next
	hlcoord 6, 4
.next
	xor a
	ldh [hStartTileID], a
	predef_jump CopyUncompressedPicToTilemap

BoyGirlChoice::
	call SaveScreenTilesToBuffer1
	call InitBoyGirlTextBoxParameters
	jr DisplayBoyGirlChoice
    
InitBoyGirlTextBoxParameters::
	ld a, $1 ; loads the value for the unused North/West choice, that was changed to say Boy/Girl
	ld [wTwoOptionMenuID], a
	coord hl, 13, 7
	ld bc, $80e
	ret

DisplayBoyGirlChoice::
	ld a, $14
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1

StarterMonM:
	db HARIUSAM, 5
	db -1 ; end

StarterMonF:
	db HARIUSAF, 5
	db -1 ; end	
	
