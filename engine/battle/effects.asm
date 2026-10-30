JumpMoveEffect:
	call _JumpMoveEffect
	ld b, $1
	ret

_JumpMoveEffect:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .next1
	ld a, [wEnemyMoveEffect]
.next1
	dec a ; subtract 1, there is no special effect for 00
	add a ; x2, 16bit pointers
	ld hl, MoveEffectPointerTable
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl ; jump to special effect handler

INCLUDE "data/moves/effects_pointers.asm"

INCLUDE "data/battle/move_effect_chances.asm"

; b = the current move's listed secondary-effect chance, scaled to 256.
GetMoveEffectChance:
	push af
	push hl
	push de
	push bc
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotMove
	ld a, [wEnemyMoveNum]
.gotMove
	dec a
	ld c, a
	ld b, 0
	ld hl, MoveEffectChances
	add hl, bc
	ld a, [hl]
	pop bc
	ld b, a
	pop de
	pop hl
	pop af
	ret

ReapplyBadgeBoostToRaisedPlayerStat:
	ldh a, [hWhoseTurn]
	and a
	ret nz
	jr ReapplyBadgeBoostToStatModC

ReapplyBadgeBoostToLoweredPlayerStat:
	ldh a, [hWhoseTurn]
	and a
	ret z

ReapplyBadgeBoostToStatModC:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z
	ld a, c
	cp NUM_MODIFIED_STATS
	ret nc
	push hl
	push bc
	ld a, 1
	ld b, c
	inc b
.maskLoop
	dec b
	jr z, .maskReady
	sla a
	sla a
	jr .maskLoop
.maskReady
	ld b, a
	ld a, [wObtainedBadges]
	and b
	jr z, .done
	ld hl, wBattleMonAttack
	ld b, 0
	sla c
	add hl, bc
	call ApplyBadgeBoostToStat
.done
	pop bc
	pop hl
	ret

ReapplyRaisedStatStatusPenalty:
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	call ReapplyStatusPenaltyForStatModC
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	ret

ReapplyStatusPenaltyForStatModC:
	push bc
	ld a, c
	cp MOD_DEFENSE
	jr nz, .speed
	call HalveAttackDueToBurn
	jr .done
.speed
	cp MOD_SPEED
	call z, QuarterSpeedDueToParalysis
.done
	pop bc
	ret

DefendEffect:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	ld a, [wBattleMonLevel]
	jr z, .markProtected
	ld hl, wEnemyBattleStatus3
	ld a, [wEnemyMonLevel]
.markProtected
	set DEFENDING, [hl]
	ld c, a
.roll
	call BattleRandom
	cp c
	jr c, .restoreTP
	jr nz, .roll
.restoreTP
	ld b, a
	ld a, c
	srl a
	add b ; floor(level / 2) through floor(level * 1.5)
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonTP
	ld de, wBattleMonMaxTP
	jr z, .addTP
	ld hl, wEnemyMonTP
	ld de, wEnemyMonMaxTP
.addTP
	ld a, [hli]
	ld c, a
	ld a, [hl]
	add b
	ld [hld], a
	ld a, c
	adc 0
	ld [hl], a
	jr c, .capTP
	ld a, [de]
	cp [hl]
	jr c, .capTP
	jr nz, .done
	inc hl
	inc de
	ld a, [de]
	cp [hl]
	jr c, .capTP
.done
	jp .syncPartyTP
.capTP
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonTP
	ld de, wBattleMonMaxTP
	jr z, .copyMax
	ld hl, wEnemyMonTP
	ld de, wEnemyMonMaxTP
.copyMax
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	; fallthrough
.syncPartyTP
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyParty
	ld a, [wPlayerBattleStatus3]
	bit TRANSFORMED, a
	ret nz
	ld a, [wPlayerMonNumber]
	ld hl, wPartyMon1TP
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld de, wBattleMonTP
	jr .copyPartyTP
.enemyParty
	ld a, [wIsInBattle]
	dec a
	ret z
	ld a, [wEnemyBattleStatus3]
	bit TRANSFORMED, a
	ret nz
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1TP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld de, wEnemyMonTP
.copyPartyTP
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ret

WetEffect:
	call CheckTargetSubstitute
	ret nz
	call GetMoveEffectChance
	call BattleRandom
	cp b
	ret nc
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus
	jr z, .target
	ld hl, wBattleMonStatus
.target
	ld a, [hl]
	and a
	ret nz
	set WET, [hl]
	call QuarterSpeedDueToParalysis
	ret

SleepEffect:
	ld de, wEnemyMonStatus
	ld bc, wEnemyBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jp z, .sleepEffect
	ld de, wBattleMonStatus
	ld bc, wPlayerBattleStatus2

.sleepEffect
	ld a, [bc]
	bit NEEDS_TO_RECHARGE, a ; does the target need to recharge? (hyper beam)
	res NEEDS_TO_RECHARGE, a ; target no longer needs to recharge
	ld [bc], a
	jr nz, .setSleepCounter ; if the target had to recharge, all hit tests will be skipped
	                        ; including the event where the target already has another status
	ld a, [de]
	ld b, a
	and $7
	jr z, .notAlreadySleeping ; can't affect a mon that is already asleep
	ld hl, AlreadyAsleepText
	jp PrintText
.notAlreadySleeping
	ld a, b
	and a
	jr nz, .didntAffect ; can't affect a mon that is already statused
	push de
	call MoveHitTest ; apply accuracy tests
	pop de
	ld a, [wMoveMissed]
	and a
	jr nz, .didntAffect
.setSleepCounter
; set target's sleep counter to a random number between 1 and 7
	call BattleRandom
	and $7
	jr z, .setSleepCounter
	ld [de], a
	call PlayCurrentMoveAnimation2
	ld hl, FellAsleepText
	jp PrintText
.didntAffect
	jp PrintDidntAffectText

FellAsleepText:
	text_far _FellAsleepText
	text_end

AlreadyAsleepText:
	text_far _AlreadyAsleepText
	text_end

PoisonEffect:
	ld hl, wEnemyMonStatus
	ld de, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	jr z, .poisonEffect
	ld hl, wBattleMonStatus
	ld de, wEnemyMoveEffect
.poisonEffect
	call CheckTargetSubstitute
	jr nz, .noEffect ; can't poison a substitute target
	ld a, [hli]
	ld b, a
	and a
	jr nz, .noEffect ; miss if target is already statused
	inc hl
	dec hl ; attributes grant no status immunity
	ld a, [de]
	cp POISON_SIDE_EFFECT1
	ld b, 20 percent + 1 ; chance of poisoning
	jr z, .sideEffectTest
	cp POISON_SIDE_EFFECT2
	ld b, 40 percent + 1 ; chance of poisoning
	jr z, .sideEffectTest
	push hl
	push de
	call MoveHitTest ; apply accuracy tests
	pop de
	pop hl
	ld a, [wMoveMissed]
	and a
	jr nz, .didntAffect
	jr .inflictPoison
.sideEffectTest
	call GetMoveEffectChance
	call BattleRandom
	cp b ; was side effect successful?
	ret nc
.inflictPoison
	dec hl
	set 3, [hl] ; mon is now poisoned
	push de
	dec de
	ldh a, [hWhoseTurn]
	and a
	ld b, ANIM_C7
	ld hl, wPlayerBattleStatus3
	ld a, [de]
	ld de, wPlayerToxicCounter
	jr nz, .ok
	ld b, ANIM_A9
	ld hl, wEnemyBattleStatus3
	ld de, wEnemyToxicCounter
.ok
	; Poison is always the fixed-damage form.
.normalPoison
	ld hl, PoisonedText
.continue
	pop de
	ld a, [de]
	cp POISON_EFFECT
	jr z, .regularPoisonEffect
	ld a, b
	call PlayBattleAnimation2
	jp PrintText
.regularPoisonEffect
	call PlayCurrentMoveAnimation2
	jp PrintText
.noEffect
	ld a, [de]
	cp POISON_EFFECT
	ret nz
.didntAffect
	ld c, 50
	call DelayFrames
	jp PrintDidntAffectText

PoisonedText:
	text_far _PoisonedText
	text_end

BadlyPoisonedText:
	text_far _BadlyPoisonedText
	text_end

DrainHPEffect:
	jpfar DrainHPEffect_

ExplodeEffect:
	ld hl, wBattleMonHP
	ld de, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .faintUser
	ld hl, wEnemyMonHP
	ld de, wEnemyBattleStatus2
.faintUser
	xor a
	ld [hli], a ; set the mon's HP to 0
	ld [hli], a
	inc hl
	ld [hl], a ; set mon's status to 0
	ld a, [de]
	res SEEDED, a ; clear mon's leech seed status
	ld [de], a
	ret

FreezeBurnParalyzeEffect:
	xor a
	ld [wAnimationType], a
	call CheckTargetSubstitute ; test bit 4 of d063/d068 flags [target has substitute flag]
	ret nz ; return if they have a substitute, can't effect them
	ldh a, [hWhoseTurn]
	and a
	jp nz, .opponentAttacker
	ld a, [wEnemyMonStatus]
	and a
	ret nz ; target already has a status
	ld a, [wPlayerMoveType]
	ld b, a
	ld a, [wEnemyMonType1]
	cp b ; do target type 1 and move type match?
	; No monster type immunities.
	ld a, [wEnemyMonType2]
	cp b ; do target type 2 and move type match?
	; No monster type immunities.
	ld a, [wPlayerMoveEffect]
	cp PARALYZE_SIDE_EFFECT1 + 1
	ld b, 10 percent + 1
	jr c, .regular_effectiveness
; extra effectiveness
	ld b, 30 percent + 1
	sub BURN_SIDE_EFFECT2 - BURN_SIDE_EFFECT1 ; treat extra effective as regular from now on
.regular_effectiveness
	call GetMoveEffectChance
	push af
	call BattleRandom ; get random 8bit value for probability test
	cp b
	pop bc
	ret nc ; do nothing if random value is >= 1A or 4D [no status applied]
	ld a, b ; what type of effect is this?
	cp BURN_SIDE_EFFECT1
	jr z, .burn1
	cp FREEZE_SIDE_EFFECT
	jr z, .freeze1
; .paralyze1
	ld a, 1 << PAR
	ld [wEnemyMonStatus], a
	call QuarterSpeedDueToParalysis ; quarter speed of affected mon
	ld a, ANIM_A9
	call PlayBattleAnimation
	jp PrintMayNotAttackText ; print paralysis text
.burn1
	ld a, 1 << BRN
	ld [wEnemyMonStatus], a
	call HalveAttackDueToBurn ; halve defense of affected mon
	ld a, ANIM_A9
	call PlayBattleAnimation
	ld hl, BurnedText
	jp PrintText
.freeze1
	call ClearHyperBeam ; resets hyper beam (recharge) condition from target
	ld a, 1 << FRZ
	ld [wEnemyMonStatus], a
	call BattleRandom
	and 3
	add 2
	ld [wEnemyToxicCounter], a
	ld a, ANIM_A9
	call PlayBattleAnimation
	ld hl, FrozenText
	jp PrintText
.opponentAttacker
	ld a, [wBattleMonStatus] ; mostly same as above with addresses swapped for opponent
	and a
	ret nz
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wBattleMonType1]
	cp b
	; No monster type immunities.
	ld a, [wBattleMonType2]
	cp b
	; No monster type immunities.
	ld a, [wEnemyMoveEffect]
	cp PARALYZE_SIDE_EFFECT1 + 1
	ld b, 10 percent + 1
	jr c, .regular_effectiveness2
; extra effectiveness
	ld b, 30 percent + 1
	sub BURN_SIDE_EFFECT2 - BURN_SIDE_EFFECT1 ; treat extra effective as regular from now on
.regular_effectiveness2
	call GetMoveEffectChance
	push af
	call BattleRandom
	cp b
	pop bc
	ret nc
	ld a, b
	cp BURN_SIDE_EFFECT1
	jr z, .burn2
	cp FREEZE_SIDE_EFFECT
	jr z, .freeze2
; .paralyze2
	ld a, 1 << PAR
	ld [wBattleMonStatus], a
	call QuarterSpeedDueToParalysis
	jp PrintMayNotAttackText
.burn2
	ld a, 1 << BRN
	ld [wBattleMonStatus], a
	call HalveAttackDueToBurn
	ld hl, BurnedText
	jp PrintText
.freeze2
; hyper beam bits aren't reseted for opponent's side
	ld a, 1 << FRZ
	ld [wBattleMonStatus], a
	call BattleRandom
	and 3
	add 2
	ld [wPlayerToxicCounter], a
	ld hl, FrozenText
	jp PrintText

BurnedText:
	text_far _BurnedText
	text_end

FrozenText:
	text_far _FrozenText
	text_end

StatModifierUpEffect:
	ld hl, wPlayerMonStatMods
	ld de, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	jr z, .statModifierUpEffect
	ld hl, wEnemyMonStatMods
	ld de, wEnemyMoveEffect
.statModifierUpEffect
	ld a, [de]
	sub ATTACK_UP1_EFFECT
	cp EVASION_UP1_EFFECT + $3 - ATTACK_UP1_EFFECT ; covers all +1 effects
	jr c, .incrementStatMod
	sub ATTACK_UP2_EFFECT - ATTACK_UP1_EFFECT ; map +2 effects to equivalent +1 effect
.incrementStatMod
	ld c, a
	ld b, $0
	add hl, bc
	ld b, [hl]
	inc b ; increment corresponding stat mod
	ld a, 8
	cp b ; one stage above neutral
	jp c, PrintNothingHappenedText
	ld a, [de]
	cp ATTACK_UP1_EFFECT + $8 ; is it a +2 effect?
	jr c, .ok
	inc b ; if so, increment stat mod again
	ld a, 8
	cp b
	jr nc, .ok
	ld b, a
.ok
	ld [hl], b
	ld a, c
	cp $4
	jr nc, UpdateStatDone ; jump if mod affected is evasion/accuracy
	push hl
	ld hl, wBattleMonAttack + 1
	ld de, wPlayerMonUnmodifiedAttack
	ldh a, [hWhoseTurn]
	and a
	jr z, .pointToStats
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyMonUnmodifiedAttack
.pointToStats
	push bc
	sla c
	ld b, $0
	add hl, bc ; hl = modified stat
	ld a, c
	add e
	ld e, a
	jr nc, .checkIf999
	inc d ; de = unmodified (original) stat
.checkIf999
	pop bc
	; check if stat is already 999
	ld a, [hld]
	sub LOW(MAX_STAT_VALUE)
	jr nz, .recalculateStat
	ld a, [hl]
	sbc HIGH(MAX_STAT_VALUE)
	jp z, RestoreOriginalStatModifier
.recalculateStat ; recalculate affected stat
                 ; paralysis and burn penalties, as well as badge boosts are ignored
	push hl
	push bc
	ld hl, StatModifierRatios
	dec b
	sla b
	ld c, b
	ld b, $0
	add hl, bc
	pop bc
	xor a
	ldh [hMultiplicand], a
	ld a, [de]
	ldh [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ldh [hMultiplicand + 2], a
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
	ld a, [hl]
	ldh [hDivisor], a
	ld b, $4
	call Divide
	pop hl
; cap at MAX_STAT_VALUE (999)
	ldh a, [hProduct + 3]
	sub LOW(MAX_STAT_VALUE)
	ldh a, [hProduct + 2]
	sbc HIGH(MAX_STAT_VALUE)
	jp c, UpdateStat
	ld a, HIGH(MAX_STAT_VALUE)
	ldh [hMultiplicand + 1], a
	ld a, LOW(MAX_STAT_VALUE)
	ldh [hMultiplicand + 2], a

UpdateStat:
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	pop hl
UpdateStatDone:
	call ReapplyBadgeBoostToRaisedPlayerStat
	call ReapplyRaisedStatStatusPenalty
	ld b, c
	inc b
	call PrintStatText
	ld hl, wPlayerBattleStatus2
	ld de, wPlayerMoveNum
	ld bc, wPlayerMonMinimized
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	ld hl, wEnemyBattleStatus2
	ld de, wEnemyMoveNum
	ld bc, wEnemyMonMinimized
.playerTurn
	ld a, [de]
	cp MINIMIZE
	jr nz, .notMinimize
 ; if a substitute is up, slide off the substitute and show the mon pic before
 ; playing the minimize animation
	bit HAS_SUBSTITUTE_UP, [hl]
	push af
	push bc
	ld hl, HideSubstituteShowMonAnim
	ld b, BANK(HideSubstituteShowMonAnim)
	push de
	call nz, Bankswitch
	pop de
.notMinimize
	call PlayCurrentMoveAnimation
	ld a, [de]
	cp MINIMIZE
	jr nz, .applyBadgeBoostsAndStatusPenalties
	pop bc
	ld a, $1
	ld [bc], a
	ld hl, ReshowSubstituteAnim
	ld b, BANK(ReshowSubstituteAnim)
	pop af
	call nz, Bankswitch
.applyBadgeBoostsAndStatusPenalties
	ld hl, MonsStatsRoseText
	call PrintText

	ret

RestoreOriginalStatModifier:
	pop hl
	dec [hl]

PrintNothingHappenedText:
	ld hl, NothingHappenedText
	jp PrintText

MonsStatsRoseText:
	text_far _MonsStatsRoseText
	text_asm
	ld hl, GreatlyRoseText
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .playerTurn
	ld a, [wEnemyMoveEffect]
.playerTurn
	cp ATTACK_DOWN1_EFFECT
	ret nc
	ld hl, RoseText
	ret

GreatlyRoseText:
	text_pause
	text_far _GreatlyRoseText
; fallthrough
RoseText:
	text_far _RoseText
	text_end

StatModifierDownEffect:
	ld hl, wEnemyMonStatMods
	ld de, wPlayerMoveEffect
	ld bc, wEnemyBattleStatus1
	ldh a, [hWhoseTurn]
	and a
	jr z, .statModifierDownEffect
	ld hl, wPlayerMonStatMods
	ld de, wEnemyMoveEffect
	ld bc, wPlayerBattleStatus1
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .statModifierDownEffect
	call BattleRandom
	cp 25 percent + 1 ; chance to miss by in regular battle
	jp c, MoveMissed
.statModifierDownEffect
	call CheckTargetSubstitute ; can't hit through substitute
	jp nz, MoveMissed
	ld a, [de]
	cp ATTACK_DOWN_SIDE_EFFECT
	jr c, .nonSideEffect
	call GetMoveEffectChance
	call BattleRandom
	cp b ; chance for this move's side effect
	jp nc, CantLowerAnymore
	ld a, [de]
	sub ATTACK_DOWN_SIDE_EFFECT ; map each stat to 0-4
	jr .decrementStatMod
.nonSideEffect ; non-side effects only
	push hl
	push de
	push bc
	call MoveHitTest ; apply accuracy tests
	pop bc
	pop de
	pop hl
	ld a, [wMoveMissed]
	and a
	jp nz, MoveMissed
	ld a, [bc]
	bit INVULNERABLE, a ; fly/dig
	jp nz, MoveMissed
	ld a, [de]
	sub ATTACK_DOWN1_EFFECT
	cp EVASION_DOWN1_EFFECT + $3 - ATTACK_DOWN1_EFFECT ; covers all -1 effects
	jr c, .decrementStatMod
	sub ATTACK_DOWN2_EFFECT - ATTACK_DOWN1_EFFECT ; map -2 effects to corresponding -1 effect
.decrementStatMod
	ld c, a
	ld b, $0
	add hl, bc
	ld b, [hl]
	dec b ; dec corresponding stat mod
	ld a, b
	cp 6
	jp c, CantLowerAnymore ; one stage below neutral
	ld a, [de]
	cp ATTACK_DOWN2_EFFECT - $16 ; $24
	jr c, .ok
	cp EVASION_DOWN2_EFFECT + $5 ; $44
	jr nc, .ok
	dec b ; stat down 2 effects only (dec mod again)
	ld a, b
	cp 6
	jr nc, .ok
	ld b, 6
.ok
	ld [hl], b ; save modified mod
	ld a, c
	cp $4
	jr nc, UpdateLoweredStatDone ; jump for evasion/accuracy
	push hl
	push de
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyMonUnmodifiedAttack
	ldh a, [hWhoseTurn]
	and a
	jr z, .pointToStat
	ld hl, wBattleMonAttack + 1
	ld de, wPlayerMonUnmodifiedAttack
.pointToStat
	push bc
	sla c
	ld b, $0
	add hl, bc ; hl = modified stat
	ld a, c
	add e
	ld e, a
	jr nc, .noCarry
	inc d ; de = unmodified stat
.noCarry
	pop bc
	ld a, [hld]
	sub $1 ; can't lower stat below 1 (-6)
	jr nz, .recalculateStat
	ld a, [hl]
	and a
	jp z, CantLowerAnymore_Pop
.recalculateStat
; recalculate affected stat
; paralysis and burn penalties, as well as badge boosts are ignored
	push hl
	push bc
	ld hl, StatModifierRatios
	dec b
	sla b
	ld c, b
	ld b, $0
	add hl, bc
	pop bc
	xor a
	ldh [hMultiplicand], a
	ld a, [de]
	ldh [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ldh [hMultiplicand + 2], a
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
	ld a, [hl]
	ldh [hDivisor], a
	ld b, $4
	call Divide
	pop hl
	ldh a, [hProduct + 3]
	ld b, a
	ldh a, [hProduct + 2]
	or b
	jp nz, UpdateLoweredStat
	ldh [hMultiplicand + 1], a
	ld a, $1
	ldh [hMultiplicand + 2], a

UpdateLoweredStat:
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	pop de
	pop hl
UpdateLoweredStatDone:
	call ReapplyBadgeBoostToLoweredPlayerStat
	call ReapplyStatusPenaltyForStatModC
	ld b, c
	inc b
	push de
	call PrintStatText
	pop de
	ld a, [de]
	cp $44
	jr nc, .ApplyBadgeBoostsAndStatusPenalties
	call PlayCurrentMoveAnimation2
.ApplyBadgeBoostsAndStatusPenalties
	ld hl, MonsStatsFellText
	call PrintText

	ret

CantLowerAnymore_Pop:
	pop de
	pop hl
	inc [hl]

CantLowerAnymore:
	ld a, [de]
	cp ATTACK_DOWN_SIDE_EFFECT
	ret nc
	ld hl, NothingHappenedText
	jp PrintText

MoveMissed:
	ld a, [de]
	cp $44
	ret nc
	jp ConditionalPrintButItFailed

MonsStatsFellText:
	text_far _MonsStatsFellText
	text_asm
	ld hl, FellText
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .playerTurn
	ld a, [wEnemyMoveEffect]
.playerTurn
; check if the move's effect decreases a stat by 2
	cp BIDE_EFFECT
	ret c
	cp ATTACK_DOWN_SIDE_EFFECT
	ret nc
	ld hl, GreatlyFellText
	ret

GreatlyFellText:
	text_pause
	text_far _GreatlyFellText
; fallthrough
FellText:
	text_far _FellText
	text_end

PrintStatText:
	ld hl, StatModTextStrings
	ld c, "@"
.findStatName_outer
	dec b
	jr z, .foundStatName
.findStatName_inner
	ld a, [hli]
	cp c
	jr z, .findStatName_outer
	jr .findStatName_inner
.foundStatName
	ld de, wStringBuffer
	ld bc, $a
	jp CopyData

INCLUDE "data/battle/stat_mod_names.asm"

INCLUDE "data/battle/stat_modifiers.asm"

BideEffect:
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerBideAccumulatedDamage
	ld bc, wPlayerNumAttacksLeft
	ldh a, [hWhoseTurn]
	and a
	jr z, .bideEffect
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyBideAccumulatedDamage
	ld bc, wEnemyNumAttacksLeft
.bideEffect
	set STORING_ENERGY, [hl] ; mon is now using bide
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld [wPlayerMoveEffect], a
	ld [wEnemyMoveEffect], a
	call BattleRandom
	and $1
	inc a
	inc a
	ld [bc], a ; set Bide counter to 2 or 3 at random
	ldh a, [hWhoseTurn]
	add XSTATITEM_ANIM
	jp PlayBattleAnimation2

ThrashPetalDanceEffect:
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerNumAttacksLeft
	ldh a, [hWhoseTurn]
	and a
	jr z, .thrashPetalDanceEffect
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyNumAttacksLeft
.thrashPetalDanceEffect
	set THRASHING_ABOUT, [hl] ; mon is now using thrash/petal dance
	call BattleRandom
	and $1
	inc a
	inc a
	ld [de], a ; set thrash/petal dance counter to 2 or 3 at random
	ldh a, [hWhoseTurn]
	add ANIM_B0
	jp PlayBattleAnimation2

SwitchAndTeleportEffect:
	ldh a, [hWhoseTurn]
	and a
	jr nz, .handleEnemy
	ld a, [wIsInBattle]
	dec a
	jr nz, .notWildBattle1
	ld a, [wCurEnemyLVL]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b ; is the player's level greater than the enemy's level?
	jr nc, .playerMoveWasSuccessful ; if so, teleport will always succeed
	add b
	ld c, a
	inc c ; c = playerLevel + enemyLevel + 1
.rejectionSampleLoop1
	call BattleRandom
	cp c ; get a random number between 0 and c
	jr nc, .rejectionSampleLoop1
	srl b
	srl b  ; b = enemyLevel / 4
	cp b ; is rand[0, playerLevel + enemyLevel] >= (enemyLevel / 4)?
	jr nc, .playerMoveWasSuccessful ; if so, allow teleporting
	ld c, 50
	call DelayFrames
	ld a, [wPlayerMoveNum]
	cp TELEPORT
	jp nz, PrintDidntAffectText
	jp PrintButItFailedText_
.playerMoveWasSuccessful
	call ReadPlayerMonCurHPAndStatus
	xor a
	ld [wAnimationType], a
	inc a
	ld [wEscapedFromBattle], a
	ld a, [wPlayerMoveNum]
	jr .playAnimAndPrintText
.notWildBattle1
	ld c, 50
	call DelayFrames
	ld hl, IsUnaffectedText
	ld a, [wPlayerMoveNum]
	cp TELEPORT
	jp nz, PrintText
	jp PrintButItFailedText_
.handleEnemy
	ld a, [wIsInBattle]
	dec a
	jr nz, .notWildBattle2
	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurEnemyLVL]
	cp b
	jr nc, .enemyMoveWasSuccessful
	add b
	ld c, a
	inc c
.rejectionSampleLoop2
	call BattleRandom
	cp c
	jr nc, .rejectionSampleLoop2
	srl b
	srl b
	cp b
	jr nc, .enemyMoveWasSuccessful
	ld c, 50
	call DelayFrames
	ld a, [wEnemyMoveNum]
	cp TELEPORT
	jp nz, PrintDidntAffectText
	jp PrintButItFailedText_
.enemyMoveWasSuccessful
	call ReadPlayerMonCurHPAndStatus
	xor a
	ld [wAnimationType], a
	inc a
	ld [wEscapedFromBattle], a
	ld a, [wEnemyMoveNum]
	jr .playAnimAndPrintText
.notWildBattle2
	ld c, 50
	call DelayFrames
	ld hl, IsUnaffectedText
	ld a, [wEnemyMoveNum]
	cp TELEPORT
	jp nz, PrintText
	jp ConditionalPrintButItFailed
.playAnimAndPrintText
	push af
	call PlayBattleAnimation
	ld c, 20
	call DelayFrames
	pop af
	ld hl, RanFromBattleText
	cp TELEPORT
	jr z, .printText
	ld hl, RanAwayScaredText
	cp ROAR
	jr z, .printText
	ld hl, WasBlownAwayText
.printText
	jp PrintText

RanFromBattleText:
	text_far _RanFromBattleText
	text_end

RanAwayScaredText:
	text_far _RanAwayScaredText
	text_end

WasBlownAwayText:
	text_far _WasBlownAwayText
	text_end

TwoToFiveAttacksEffect:
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerNumAttacksLeft
	ld bc, wPlayerNumHits
	ldh a, [hWhoseTurn]
	and a
	jr z, .twoToFiveAttacksEffect
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyNumAttacksLeft
	ld bc, wEnemyNumHits
.twoToFiveAttacksEffect
	bit ATTACKING_MULTIPLE_TIMES, [hl] ; is mon attacking multiple times?
	ret nz
	set ATTACKING_MULTIPLE_TIMES, [hl] ; mon is now attacking multiple times
	ld hl, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	jr z, .setNumberOfHits
	ld hl, wEnemyMoveEffect
.setNumberOfHits
	ld a, [hl]
	cp TWINEEDLE_EFFECT
	jr z, .twineedle
	cp ATTACK_TWICE_EFFECT
	ld a, $2 ; number of hits it's always 2 for ATTACK_TWICE_EFFECT
	jr z, .saveNumberOfHits
; for TWO_TO_FIVE_ATTACKS_EFFECT 3/8 chance for 2 and 3 hits, and 1/8 chance for 4 and 5 hits
	call BattleRandom
	and $3
	cp $2
	jr c, .gotNumHits
; if the number of hits was greater than 2, re-roll again for a lower chance
	call BattleRandom
	and $3
.gotNumHits
	inc a
	inc a
.saveNumberOfHits
	ld [de], a
	ld [bc], a
	ret
.twineedle
	ld a, POISON_SIDE_EFFECT1
	ld [hl], a ; set Twineedle's effect to poison effect
	jr .saveNumberOfHits

FlinchSideEffect:
	call CheckTargetSubstitute
	ret nz
	ld hl, wEnemyBattleStatus1
	ld de, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	jr z, .flinchSideEffect
	ld hl, wPlayerBattleStatus1
	ld de, wEnemyMoveEffect
.flinchSideEffect
	ld a, [de]
	cp FLINCH_SIDE_EFFECT1
	ld b, 10 percent + 1 ; chance of flinch (FLINCH_SIDE_EFFECT1)
	jr z, .gotEffectChance
	ld b, 30 percent + 1 ; chance of flinch otherwise
.gotEffectChance
	call BattleRandom
	cp b
	ret nc
	set FLINCHED, [hl] ; set mon's status to flinching
	call ClearHyperBeam
	ret

OneHitKOEffect:
	jpfar OneHitKOEffect_

ChargeEffect:
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	ld b, XSTATITEM_ANIM
	jr z, .chargeEffect
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyMoveEffect
	ld b, ANIM_AF
.chargeEffect
	set CHARGING_UP, [hl]
	ld a, [de]
	dec de ; de contains enemy or player MOVENUM
	cp FLY_EFFECT
	jr nz, .notFly
	set INVULNERABLE, [hl] ; mon is now invulnerable to typical attacks (fly/dig)
	ld b, TELEPORT ; load Teleport's animation
.notFly
	ld a, [de]
	cp DIG
	jr nz, .notDigOrFly
	set INVULNERABLE, [hl] ; mon is now invulnerable to typical attacks (fly/dig)
	ld b, ANIM_C0
.notDigOrFly
	xor a
	ld [wAnimationType], a
	ld a, b
	call PlayBattleAnimation
	ld a, [de]
	ld [wChargeMoveNum], a
	ld hl, ChargeMoveEffectText
	jp PrintText

ChargeMoveEffectText:
	text_far _ChargeMoveEffectText
	text_asm
	ld a, [wChargeMoveNum]
	cp SOLARBEAM
	ld hl, TookInSunlightText
	jr z, .gotText
	cp SKULL_BASH
	ld hl, LoweredItsHeadText
	jr z, .gotText
	cp SKY_ATTACK
	ld hl, SkyAttackGlowingText
	jr z, .gotText
	cp FLY
	ld hl, FlewUpHighText
	jr z, .gotText
	cp DIG
	ld hl, DugAHoleText
.gotText
	ret

TookInSunlightText:
	text_far _TookInSunlightText
	text_end

LoweredItsHeadText:
	text_far _LoweredItsHeadText
	text_end

SkyAttackGlowingText:
	text_far _SkyAttackGlowingText
	text_end

FlewUpHighText:
	text_far _FlewUpHighText
	text_end

DugAHoleText:
	text_far _DugAHoleText
	text_end

TrappingEffect:
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerNumAttacksLeft
	ldh a, [hWhoseTurn]
	and a
	jr z, .trappingEffect
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyNumAttacksLeft
.trappingEffect
	bit USING_TRAPPING_MOVE, [hl]
	ret nz
	call ClearHyperBeam ; since this effect is called before testing whether the move will hit,
                        ; the target won't need to recharge even if the trapping move missed
	set USING_TRAPPING_MOVE, [hl] ; mon is now using a trapping move
	call BattleRandom ; 3/8 chance for 2 and 3 attacks, and 1/8 chance for 4 and 5 attacks
	and $3
	cp $2
	jr c, .setTrappingCounter
	call BattleRandom
	and $3
.setTrappingCounter
	inc a
	ld [de], a
	ret

MistEffect:
	jpfar MistEffect_

FocusEnergyEffect:
	jpfar FocusEnergyEffect_

RecoilEffect:
	jpfar RecoilEffect_

ConfusionSideEffect:
	call BattleRandom
	cp 10 percent ; chance of confusion
	ret nc
	jr ConfusionSideEffectSuccess

ConfusionEffect:
	call CheckTargetSubstitute
	jr nz, ConfusionEffectFailed
	call MoveHitTest
	ld a, [wMoveMissed]
	and a
	jr nz, ConfusionEffectFailed

ConfusionSideEffectSuccess:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus1
	ld bc, wEnemyConfusedCounter
	ld a, [wPlayerMoveEffect]
	jr z, .confuseTarget
	ld hl, wPlayerBattleStatus1
	ld bc, wPlayerConfusedCounter
	ld a, [wEnemyMoveEffect]
.confuseTarget
	bit CONFUSED, [hl] ; is mon confused?
	jr nz, ConfusionEffectFailed
	set CONFUSED, [hl] ; mon is now confused
	push af
	call BattleRandom
	and $3
	inc a
	inc a
	ld [bc], a ; confusion status will last 2-5 turns
	pop af
	cp CONFUSION_SIDE_EFFECT
	call nz, PlayCurrentMoveAnimation2
	ld hl, BecameConfusedText
	jp PrintText

BecameConfusedText:
	text_far _BecameConfusedText
	text_end

ConfusionEffectFailed:
	cp CONFUSION_SIDE_EFFECT
	ret z
	ld c, 50
	call DelayFrames
	jp ConditionalPrintButItFailed

ParalyzeEffect:
	jpfar ParalyzeEffect_

SubstituteEffect:
	jpfar SubstituteEffect_

HyperBeamEffect:
	ld hl, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .hyperBeamEffect
	ld hl, wEnemyBattleStatus2
.hyperBeamEffect
	set NEEDS_TO_RECHARGE, [hl] ; mon now needs to recharge
	ret

ClearHyperBeam:
	push hl
	ld hl, wEnemyBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	ld hl, wPlayerBattleStatus2
.playerTurn
	res NEEDS_TO_RECHARGE, [hl] ; mon no longer needs to recharge
	pop hl
	ret

RageEffect:
	ld hl, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .player
	ld hl, wEnemyBattleStatus2
.player
	set USING_RAGE, [hl] ; mon is now in "rage" mode
	ret

MimicEffect:
	ld c, 50
	call DelayFrames
	call MoveHitTest
	ld a, [wMoveMissed]
	and a
	jr nz, .mimicMissed
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonMoves
	ld a, [wPlayerBattleStatus1]
	jr nz, .enemyTurn
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .letPlayerChooseMove
	ld hl, wEnemyMonMoves
	ld a, [wEnemyBattleStatus1]
.enemyTurn
	bit INVULNERABLE, a
	jr nz, .mimicMissed
.getRandomMove
	push hl
	call BattleRandom
	and $3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .getRandomMove
	ld d, a
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonMoves
	ld a, [wPlayerMoveListIndex]
	jr z, .playerTurn
	ld hl, wEnemyMonMoves
	ld a, [wEnemyMoveListIndex]
	jr .playerTurn
.letPlayerChooseMove
	ld a, [wEnemyBattleStatus1]
	bit INVULNERABLE, a
	jr nz, .mimicMissed
	ld a, [wCurrentMenuItem]
	push af
	ld a, $1
	ld [wMoveMenuType], a
	call MoveSelectionMenu
	call LoadScreenTilesFromBuffer1
	ld hl, wEnemyMonMoves
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	add hl, bc
	ld d, [hl]
	pop af
	ld hl, wBattleMonMoves
.playerTurn
	ld c, a
	ld b, $0
	add hl, bc
	ld a, d
	ld [hl], a
	ld [wd11e], a
	call GetMoveName
	call PlayCurrentMoveAnimation
	ld hl, MimicLearnedMoveText
	jp PrintText
.mimicMissed
	jp PrintButItFailedText_

MimicLearnedMoveText:
	text_far _MimicLearnedMoveText
	text_end

LeechSeedEffect:
	jpfar LeechSeedEffect_

SplashEffect:
	call PlayCurrentMoveAnimation
	jp PrintNoEffectText

DisableEffect:
	call MoveHitTest
	ld a, [wMoveMissed]
	and a
	jr nz, .moveMissed
	ld de, wEnemyDisabledMove
	ld hl, wEnemyMonMoves
	ldh a, [hWhoseTurn]
	and a
	jr z, .disableEffect
	ld de, wPlayerDisabledMove
	ld hl, wBattleMonMoves
.disableEffect
; no effect if target already has a move disabled
	ld a, [de]
	and a
	jr nz, .moveMissed
.pickMoveToDisable
	push hl
	call BattleRandom
	and $3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .pickMoveToDisable ; loop until a non-00 move slot is found
	ld [wd11e], a ; store move number
; with TP there is no per-move PP left to check, so any known move can be disabled
	call BattleRandom
	and $7
	inc a ; 1-8 turns disabled
	inc c ; move 1-4 will be disabled
	swap c
	add c ; map disabled move to high nibble of wEnemyDisabledMove / wPlayerDisabledMove
	ld [de], a
	call PlayCurrentMoveAnimation2
	ld hl, wPlayerDisabledMoveNumber
	ldh a, [hWhoseTurn]
	and a
	jr nz, .printDisableText
	inc hl ; wEnemyDisabledMoveNumber
.printDisableText
	ld a, [wd11e] ; move number
	ld [hl], a
	call GetMoveName
	ld hl, MoveWasDisabledText
	jp PrintText
.moveMissed
	jp PrintButItFailedText_

MoveWasDisabledText:
	text_far _MoveWasDisabledText
	text_end

PayDayEffect:
	jpfar PayDayEffect_

ConversionEffect:
	jpfar ConversionEffect_

HazeEffect:
	jpfar HazeEffect_

HealEffect:
	jpfar HealEffect_

TransformEffect:
	jpfar TransformEffect_

ReflectLightScreenEffect:
	jpfar ReflectLightScreenEffect_

NothingHappenedText:
	text_far _NothingHappenedText
	text_end

PrintNoEffectText:
	ld hl, NoEffectText
	jp PrintText

NoEffectText:
	text_far _NoEffectText
	text_end

ConditionalPrintButItFailed:
	ld a, [wMoveDidntMiss]
	and a
	ret nz ; return if the side effect failed, yet the attack was successful

PrintButItFailedText_:
	ld hl, ButItFailedText
	jp PrintText

ButItFailedText:
	text_far _ButItFailedText
	text_end

PrintDidntAffectText:
	ld hl, DidntAffectText
	jp PrintText

DidntAffectText:
	text_far _DidntAffectText
	text_end

IsUnaffectedText:
	text_far _IsUnaffectedText
	text_end

PrintMayNotAttackText:
	ld hl, ParalyzedMayNotAttackText
	jp PrintText

ParalyzedMayNotAttackText:
	text_far _ParalyzedMayNotAttackText
	text_end

CheckTargetSubstitute:
	push hl
	ld hl, wEnemyBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .next1
	ld hl, wPlayerBattleStatus2
.next1
	bit HAS_SUBSTITUTE_UP, [hl]
	pop hl
	ret

PlayCurrentMoveAnimation2:
; animation at MOVENUM will be played unless MOVENUM is 0
; plays wAnimationType 3 or 6
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .notEnemyTurn
	ld a, [wEnemyMoveNum]
.notEnemyTurn
	and a
	ret z

PlayBattleAnimation2:
; play animation ID at a and animation type 6 or 3
	ld [wAnimationID], a
	ldh a, [hWhoseTurn]
	and a
	ld a, $6
	jr z, .storeAnimationType
	ld a, $3
.storeAnimationType
	ld [wAnimationType], a
	jp PlayBattleAnimationGotID

PlayCurrentMoveAnimation:
; animation at MOVENUM will be played unless MOVENUM is 0
; resets wAnimationType
	xor a
	ld [wAnimationType], a
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .notEnemyTurn
	ld a, [wEnemyMoveNum]
.notEnemyTurn
	and a
	ret z

PlayBattleAnimation:
; play animation ID at a and predefined animation type
	ld [wAnimationID], a

PlayBattleAnimationGotID:
; play animation at wAnimationID
	push hl
	push de
	push bc
	predef MoveAnimation
	pop bc
	pop de
	pop hl
	ret
