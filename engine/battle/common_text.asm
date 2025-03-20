PrintBeginningBattleText:
	ld a, [wIsInBattle]
	dec a
	jr nz, .trainerBattle
	ld a, [wCurMap]
	cp POKEMON_TOWER_3F
	jr c, .notPokemonTower
	cp POKEMON_TOWER_7F + 1
	jr c, .pokemonTower
.notPokemonTower
	ld a, [wEnemyMonSpecies2]
	call PlayCry
	ld a, [wMonHIndex]
	ld [wd11e], a
	ld [wd0b5], a
	predef IndexToPokedex
	ld hl, WildMonAppearedText
	ld a, [wMoveMissed]
	and a
	jr z, .notFishing
	ld hl, HookedMonAttackedText
.notFishing
	jr .wildBattle
.trainerBattle
	call .playSFX
	ld c, 20
	call DelayFrames
	
;	xor a
;	ldh [hAutoBGTransferEnabled], a
	hlcoord 10, 0
	lb bc, 4, 10
	call ClearScreenArea

	hlcoord 10, 0
	lb bc, 2, 8
	call TextBoxBorder

	ld de, wTrainerName
	hlcoord 11, 0
	call PlaceString

	ld de, BattlePartyText
	hlcoord 11, 2
	call PlaceString
	
	hlcoord 18, 2
	ld de, wEnemyPartyCount
	ld c, $C1
	call PrintBCDNumber
	
;	ld de, TechPointText
;	hlcoord 11, 2
;	call PlaceString	
	
	ld hl, TrainerWantsToFightText
	call PrintText
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .LinkBattle
	call DisplayPrebattleMenu
	jr .done
.wildBattle
	call PrintText
.LinkBattle
	jr .done
.pokemonTower
	ld b, SILPH_SCOPE
	call IsItemInBag
	ld a, [wEnemyMonSpecies2]
	ld [wcf91], a
	cp RESTLESS_SOUL
	jr z, .isMarowak
	ld a, b
	and a
	jr z, .noSilphScope
	callfar LoadEnemyMonData
	jp .notPokemonTower
.noSilphScope
	ld hl, EnemyAppearedText
	call PrintText
	ld hl, GhostCantBeIDdText
	call PrintText
	jr .done
.isMarowak
	ld a, b
	and a
	jr z, .noSilphScope
	ld hl, EnemyAppearedText
	call PrintText
	ld hl, UnveiledGhostText
	call PrintText
	callfar LoadEnemyMonData
	callfar MarowakAnim
	ld hl, WildMonAppearedText
	call PrintText

.playSFX
	xor a
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a
	ld a, SFX_SILPH_SCOPE
	call PlaySound
	jp WaitForSoundToFinish
.done
	ret

WildMonAppearedText:
	text_far _WildMonAppearedText
	text_end

HookedMonAttackedText:
	text_far _HookedMonAttackedText
	text_end

EnemyAppearedText:
	text_far _EnemyAppearedText
	text_end

TrainerWantsToFightText:
	text_far _TrainerWantsToFightText
	text_end

UnveiledGhostText:
	text_far _UnveiledGhostText
	text_end

GhostCantBeIDdText:
	text_far _GhostCantBeIDdText
	text_end

PrintSendOutMonMessage:
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl]
	ld hl, GoText
	jr z, .printText
	xor a
	ldh [hMultiplicand], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wLastSwitchInEnemyMonHP], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ld [wLastSwitchInEnemyMonHP + 1], a
	ldh [hMultiplicand + 2], a
	ld a, 25
	ldh [hMultiplier], a
	call Multiply
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ldh [hDivisor], a ; enemy mon max HP divided by 4
	call Divide
	ldh a, [hQuotient + 3] ; a = (enemy mon current HP * 25) / (enemy max HP / 4); this approximates the current percentage of max HP
	ld hl, GoText ; 70% or greater
	cp 70
	jr nc, .printText
	ld hl, DoItText ; 40% - 69%
	cp 40
	jr nc, .printText
	ld hl, GetmText ; 10% - 39%
	cp 10
	jr nc, .printText
	ld hl, EnemysWeakText ; 0% - 9%
.printText
	jp PrintText

GoText:
	text_far _GoText
	text_asm
	jr PrintPlayerMon1Text

DoItText:
	text_far _DoItText
	text_asm
	jr PrintPlayerMon1Text

GetmText:
	text_far _GetmText
	text_asm
	jr PrintPlayerMon1Text

EnemysWeakText:
	text_far _EnemysWeakText
	text_asm

PrintPlayerMon1Text:
	ld hl, PlayerMon1Text
	ret

PlayerMon1Text:
	text_far _PlayerMon1Text
	text_end

RetreatMon:
	ld hl, PlayerMon2Text
	jp PrintText

PlayerMon2Text:
	text_far _PlayerMon2Text
	text_asm
	push de
	push bc
	ld hl, wEnemyMonHP + 1
	ld de, wLastSwitchInEnemyMonHP + 1
	ld b, [hl]
	dec hl
	ld a, [de]
	sub b
	ldh [hMultiplicand + 2], a
	dec de
	ld b, [hl]
	ld a, [de]
	sbc b
	ldh [hMultiplicand + 1], a
	ld a, 25
	ldh [hMultiplier], a
	call Multiply
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ldh [hDivisor], a
	call Divide
	pop bc
	pop de
	ldh a, [hQuotient + 3] ; a = ((LastSwitchInEnemyMonHP - CurrentEnemyMonHP) / 25) / (EnemyMonMaxHP / 4)
; Assuming that the enemy mon hasn't gained HP since the last switch in,
; a approximates the percentage that the enemy mon's total HP has decreased
; since the last switch in.
; If the enemy mon has gained HP, then a is garbage due to wrap-around and
; can fall in any of the ranges below.
	ld hl, EnoughText ; HP stayed the same
	and a
	ret z
	ld hl, ComeBackText ; HP went down 1% - 29%
	cp 30
	ret c
	ld hl, OKExclamationText ; HP went down 30% - 69%
	cp 70
	ret c
	ld hl, GoodText ; HP went down 70% or more
	ret

EnoughText:
	text_far _EnoughText
	text_asm
	jr PrintComeBackText

OKExclamationText:
	text_far _OKExclamationText
	text_asm
	jr PrintComeBackText

GoodText:
	text_far _GoodText
	text_asm
	jr PrintComeBackText

PrintComeBackText:
	ld hl, ComeBackText
	ret

ComeBackText:
	text_far _ComeBackText
	text_end

BattlePartyText:
	db "PARTY:@"


DisplayPrebattleMenu:
	hlcoord 0, 12
	lb bc, 6, 20
	call ClearScreenArea
	call SaveScreenTilesToBuffer1
	ld a, PREBATTLE_MENU_TEMPLATE
	ld [wTextBoxID], a
	call DisplayTextBoxID
.handleBattleMenuInput
	ld a, [wBattleAndStartSavedMenuItem]
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	sub 2 ; check if the cursor is in the left column
	jr c, .leftColumn
; cursor is in the right column
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	jr .rightColumn
.leftColumn ; put cursor in left column of menu
	ld a, " "
	ldcoord_a 7, 14 ; clear upper cursor position in right column
	ldcoord_a 7, 16 ; clear lower cursor position in right column
	ld b, $1 ; top menu item X
	jr .leftColumn_WaitForInput
.leftColumn_WaitForInput
	ld hl, wTopMenuItemY
	ld a, $e
	ld [hli], a ; wTopMenuItemY
	ld a, b
	ld [hli], a ; wTopMenuItemX
	inc hl
	inc hl
	ld a, $1
	ld [hli], a ; wMaxMenuItem
	ld [hl], D_RIGHT | A_BUTTON ; wMenuWatchedKeys
	call HandleMenuInput
	bit BIT_D_RIGHT, a
	jr nz, .rightColumn
	jr .AButtonPressed ; the A button was pressed
.rightColumn ; put cursor in right column of menu
	ld a, " "
	ldcoord_a 1, 14 ; clear upper cursor position in left column
	ldcoord_a 1, 16 ; clear lower cursor position in left column
	ld b, $7 ; top menu item X
	jr .rightColumn_WaitForInput
.rightColumn_WaitForInput
	ld hl, wTopMenuItemY
	ld a, $e
	ld [hli], a ; wTopMenuItemY
	ld a, b
	ld [hli], a ; wTopMenuItemX
	inc hl
	inc hl
	ld a, $1
	ld [hli], a ; wMaxMenuItem
	ld a, D_LEFT | A_BUTTON
	ld [hli], a ; wMenuWatchedKeys
	call HandleMenuInput
	bit 5, a ; check if left was pressed
	jr nz, .leftColumn ; if left was pressed, jump
	ld a, [wCurrentMenuItem]
	add $2 ; if we're in the right column, the actual id is +2
	ld [wCurrentMenuItem], a
.AButtonPressed
	call PlaceUnfilledArrowMenuCursor
	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	ld a, [wCurrentMenuItem]
	ld [wBattleAndStartSavedMenuItem], a
	and a
	jr nz, .upperLeftMenuItemWasNotSelected
	ret

.upperLeftMenuItemWasNotSelected ; a menu item other than the upper left item was selected
	cp $2
	jp z, .Tools
	dec a
	jp nz, .Run

	call PrintInBattleText
	jp DisplayPrebattleMenu

.Tools ; Can't be used in prebattle
	ld hl, PreBattleCantUseItemsText
	call PrintText
	jp DisplayPrebattleMenu

.Run
	jp DisplayPrebattleMenu

PreBattleCantUseItemsText::
	text_far _ItemsCantBeUsedHereText
	text_end

