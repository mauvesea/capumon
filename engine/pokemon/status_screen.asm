DrawHP:
; Draws the HP bar in the stats screen
	call GetPredefRegisters
	ld a, $1
	jr DrawHP_

DrawHP2:
; Draws the HP bar in the party screen
	call GetPredefRegisters
	ld a, $2

DrawHP_:
	ld [wHPBarType], a
	push hl
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	ld c, a
	or b
	jr nz, .nonzeroHP
	xor a
	ld c, a
	ld e, a
	ld a, $6
	ld d, a
	jp .drawHPBarAndPrintFraction
.nonzeroHP
	ld a, [wLoadedMonMaxHP]
	ld d, a
	ld a, [wLoadedMonMaxHP + 1]
	ld e, a
	predef HPBarLength
	ld a, $6
	ld d, a
	ld c, a
.drawHPBarAndPrintFraction
	pop hl
	push de
	push hl
;	push hl
;	call DrawHPBar
;	pop hl
	ldh a, [hUILayoutFlags]
	bit 0, a
	jr z, .printFractionBelowBar
	ld bc, $9 ; right of bar
	jr .printFraction
.printFractionBelowBar
	ld bc, SCREEN_WIDTH ; + 1 ; below bar
.printFraction
;	lb bc, 3, 8
	add hl, bc
	ld de, wLoadedMonHP
	lb bc, 2, 3
	call PrintNumber
;	ld a, "/"
;	ld [hli], a
;	ld de, wLoadedMonMaxHP
;	lb bc, 2, 3
;	call PrintNumber
	pop hl
	pop de
	ret

; Predef 0x37
StatusScreen:
	call LoadMonData
	ld a, [wMonDataLocation]
	cp BOX_DATA
	jr c, .DontRecalculate
; mon is in a box or daycare
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
	ld [wCurEnemyLVL], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, $1
	call CalcStats ; Recalculate stats
.DontRecalculate
	ld hl, wd72c
	set 1, [hl]
	ld a, $33
	ldh [rNR50], a ; Reduce the volume
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	hlcoord 19, 1
	lb bc, 6, 10
;	call DrawLineBox ; Draws the box around name, HP and status
	ld de, -6
	add hl, de
	ld [hl], "<DOT>"
	dec hl
	ld [hl], "№"
;	hlcoord 19, 9
;	lb bc, 8, 6
;	call DrawLineBox ; Draws the box around types, ID No. and OT
;	hlcoord 10, 9
;	ld de, Type1Text
;	call PlaceString ; "TYPE1/"
	ld hl, wStatusScreenHPBarColor
	call GetHealthBarColor
	ld b, SET_PAL_STATUS_SCREEN
	call RunPaletteCommand
;	hlcoord 14, 2
;	call PrintLevel ; Pokémon level
	ld a, [wMonHIndex]
	ld [wd11e], a
	ld [wd0b5], a
	predef IndexToPokedex
	hlcoord 4, 1
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; Pokémon no.
	
	ld de, -3
	add hl, de
	ld [hl], "<DOT>"
	dec hl
	ld [hl], "№"	
	
;	hlcoord 11, 10
;	predef PrintMonType

	hlcoord 0, 10
	lb bc, 2, 8
	call TextBoxBorder

	ld hl, NamePointers2
	call .GetStringPointer
	ld d, h
	ld e, l
	hlcoord 1, 10
	call PlaceString ; Pokémon name

	hlcoord 1, 11
	ld de, PartyMenuHPText
	call PlaceString
	
	hlcoord 1, 12
	ld de, PartyMenuTPText
	call PlaceString
	
	hlcoord 6, 10
	predef DrawHP

	hlcoord 6, 12
	ld de, wLoadedMonTP
	lb bc, 2, 3
	call PrintNumber

	hlcoord 1, 14
	ld de, PartyMenuValueText
	call PlaceString
	
	hlcoord 10, 12
	lb bc, 4, 8
	call TextBoxBorder	

	hlcoord 11, 13
	ld de, PartyMenuSpecialMoveText
	call PlaceString

; A mon's signature move is the move whose ID matches its Pokedex number.
; Show it (and what it costs) only if the mon actually knows it.
	ld a, [wLoadedMonSpecies]
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	push af
	ld a, [wLoadedMonSpecies]
	ld b, a
	ld a, [wLoadedMonLevel]
	ld c, a
	ld a, b
	ld b, c
	callfar GetAvailableMoves
	pop af
	ld b, a
	ld hl, wAvailableMoves
	ld a, [wAvailableMoveCount]
	ld c, a
	and a
	jr z, .noSignatureMove
.findSignatureMove
	ld a, [hli]
	cp b
	jr z, .knowsSignatureMove
	dec c
	jr nz, .findSignatureMove
.noSignatureMove
	hlcoord 11, 15
	ld de, NoSignatureMoveText
	call PlaceString
	jr .signatureMoveDone
.knowsSignatureMove
	ld [wd11e], a
	hlcoord 11, 15
	call GetMoveName ; returns de = wcd6d
	call PlaceString
	ld a, [wd11e]
	call GetMoveTPCost
	ld [wMoveTPCostBuffer], a
	hlcoord 11, 16
	ld de, TPCostText
	call PlaceString
	hlcoord 14, 16
	ld de, wMoveTPCostBuffer
	lb bc, 1, 3
	call PrintNumber
.signatureMoveDone

; what the mon is worth
	call CalcMonValue
	hlcoord 1, 16
	ld de, wMonValue
	lb bc, 3, 6
	call PrintNumber
	ld [hl], "G"

;	ld hl, OTPointers
;	call .GetStringPointer
;	ld d, h
;	ld e, l
;	hlcoord 12, 16
;	call PlaceString ; OT
;	hlcoord 12, 14
;	ld de, wLoadedMonOTID
;	lb bc, LEADING_ZEROES | 2, 5
;	call PrintNumber ; ID Number
	ld d, $0
	call PrintStatsBox
	call Delay3
	call GBPalNormal
	hlcoord 1, 2
	call LoadFrontSpriteByMonIndex ; draw Pokémon picture
	ld a, [wcf91]
	call PlayCry ; play Pokémon cry
	call WaitForTextScrollButtonPress ; wait for button
	pop af
	ldh [hTileAnimations], a
	ret

.GetStringPointer
	ld a, [wMonDataLocation]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonDataLocation]
	cp DAYCARE_DATA
	ret z
	ld a, [wWhichPokemon]
	jp SkipFixedLengthTextEntries

OTPointers:
	dw wPartyMonOT
	dw wEnemyMonOT
	dw wBoxMonOT
	dw wDayCareMonOT

NamePointers2:
	dw wPartyMonNicks
	dw wEnemyMonNicks
	dw wBoxMonNicks
	dw wDayCareMonName

Type1Text:
	db   "TYPE1/"
	next ""
	; fallthrough
Type2Text:
	db   "TYPE2/"
	next ""
	; fallthrough
IDNoText:
	db   "<ID>№/"
	next ""
	; fallthrough
OTText:
	db   "OT/"
	next "@"

StatusText:
	db "STATUS@"

OKText:
	db "OK@"
	
PartyMenuHPText:
	db "HP@"
	
PartyMenuTPText:
	db "TP@"
	
PartyMenuValueText:
	db "VALUE@"

PartyMenuSpecialMoveText:
	db "SPECIAL@"

TPCostText:
	db "TP:@"

NoSignatureMoveText:
	db "  ----  @"

; Works out how much the mon in wLoadedMon is worth and stores it in
; wMonValue (binary) and wMonValueBCD (BCD, ready to be paid out).
; value = ((Level / 2) * (MaxHP / 2) * (MaxTP / 2)) / 2, clamped to 1-999999.
CalcMonValue::
; t = (MaxHP / 2) * (Level / 2); t fits in 16 bits (50 * 499 = 24950)
	ld hl, wLoadedMonMaxHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	srl b
	rr c
	xor a
	ldh [hMultiplicand], a
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, [wLoadedMonLevel]
	srl a
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 2]
	ld d, a
	ldh a, [hProduct + 3]
	ld e, a ; de = t
; wMonValue = t * LOW(MaxTP / 2)
	ld hl, wLoadedMonMaxTP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	srl b
	rr c ; bc = MaxTP / 2
	push bc
	xor a
	ldh [hMultiplicand], a
	ld a, d
	ldh [hMultiplicand + 1], a
	ld a, e
	ldh [hMultiplicand + 2], a
	ld a, c
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 1]
	ld [wMonValue], a
	ldh a, [hProduct + 2]
	ld [wMonValue + 1], a
	ldh a, [hProduct + 3]
	ld [wMonValue + 2], a
	pop bc
; add (t * HIGH(MaxTP / 2)) << 8
	ld a, b
	and a
	jr z, .noHighByte
	xor a
	ldh [hMultiplicand], a
	ld a, d
	ldh [hMultiplicand + 1], a
	ld a, e
	ldh [hMultiplicand + 2], a
	ld a, b
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 3]
	ld b, a
	ldh a, [hProduct + 2]
	ld c, a
	ld a, [wMonValue + 1]
	add b
	ld [wMonValue + 1], a
	ld a, [wMonValue]
	adc c
	ld [wMonValue], a
.noHighByte
; halve the result
	ld hl, wMonValue
	srl [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
; clamp to 999999 ($0f423f)
	ld a, [wMonValue]
	cp $0f
	jr c, .notTooBig
	jr nz, .tooBig
	ld a, [wMonValue + 1]
	cp $42
	jr c, .notTooBig
	jr nz, .tooBig
	ld a, [wMonValue + 2]
	cp $40
	jr c, .notTooBig
.tooBig
	ld a, $0f
	ld [wMonValue], a
	ld a, $42
	ld [wMonValue + 1], a
	ld a, $3f
	ld [wMonValue + 2], a
	jr .toBCD
.notTooBig
; every mon is worth at least 1
	ld a, [wMonValue]
	ld hl, wMonValue + 1
	or [hl]
	inc hl
	or [hl]
	jr nz, .toBCD
	ld [hl], 1
.toBCD
; convert wMonValue to BCD by pulling off one decimal digit at a time
	xor a
	ldh [hDividend], a
	ld a, [wMonValue]
	ldh [hDividend + 1], a
	ld a, [wMonValue + 1]
	ldh [hDividend + 2], a
	ld a, [wMonValue + 2]
	ldh [hDividend + 3], a
	ld hl, wMonValueBCD + 2
	ld c, 3
.bcdLoop
	ld a, 10
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hRemainder]
	ld d, a ; low digit
	ld a, 10
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hRemainder]
	swap a
	or d
	ld [hld], a
	dec c
	jr nz, .bcdLoop
	ret

; Draws a line starting from hl high b and wide c
DrawLineBox:
	ld de, SCREEN_WIDTH ; New line
.PrintVerticalLine
	ld [hl], $78 ; │
	add hl, de
	dec b
	jr nz, .PrintVerticalLine
	ld [hl], $77 ; ┘
	dec hl
.PrintHorizLine
	ld [hl], $76 ; ─
	dec hl
	dec c
	jr nz, .PrintHorizLine
	ld [hl], $6f ; ← (halfarrow ending)
	ret

PTile: INCBIN "gfx/font/P.1bpp"

PrintStatsBox:
	ld a, d
	and a ; a is 0 from the status screen
	jr nz, .DifferentBox
	hlcoord 10, 0
	ld b, 10
	ld c, 8
	call TextBoxBorder ; Draws the box
	hlcoord 11, 1 ; Start printing stats from here
	ld bc, $19 ; Number offset
	jr .PrintStats
.DifferentBox
	hlcoord 10, 0
	ld b, 10
	ld c, 8
	call TextBoxBorder
	hlcoord 11, 1
	ld bc, $18
.PrintStats
	push bc
	push hl
	ld de, StatsText
	call PlaceString
	pop hl
	pop bc

	hlcoord 17, 1
	call PrintLevel ; Pokémon level	
	
;	add hl, bc
	hlcoord 16, 3
	ld de, wLoadedMonAttack
	lb bc, 2, 3
	call PrintStat
	ld de, wLoadedMonSpeed
	call PrintStat
	ld de, wLoadedMonSpecial
	call PrintStat
	ld de, wLoadedMonDefense
	jp PrintNumber
PrintStat:
	push hl
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

StatsText:
	db   "LEVEL"
	next "ATK"
	next "SPD"
	next "INT"
	next "DEF@"

StatusScreen2:
	hlcoord 0, 0
	lb bc, 8, 8
	call ClearScreenArea ; Clear under name
	hlcoord 6, 0
	ld b, 6
	ld c, 12
	call TextBoxBorder ; Draw move container
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	ldh [hAutoBGTransferEnabled], a
	ld a, [wLoadedMonSpecies]
	ld b, a
	ld a, [wLoadedMonLevel]
	ld c, a
	ld a, b
	ld b, c
	callfar GetAvailableMoves
	xor a
	ld [wAvailableMoveOffset], a
	call StatusScreen_DrawMoveList
	hlcoord 7, 1
	ld de, StatusScreenExpText
	call PlaceString
	ld a, [wLoadedMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .Level100
	inc a
	ld [wLoadedMonLevel], a ; Increase temporarily if not 100
.Level100
	pop af
	ld [wLoadedMonLevel], a
	ld de, wLoadedMonExp
	hlcoord 12, 1
	lb bc, 3, 7
	call PrintNumber ; exp
	call CalcExpToLevelUp
	ld de, wLoadedMonExp
	hlcoord 12, 3
	lb bc, 3, 7
	call PrintNumber ; exp needed to level up

	hlcoord 16, 5
	ld de, wLoadedMonStatus
	call PrintStatusCondition
	jr nz, .StatusWritten
	hlcoord 17, 5
	ld de, OKText
	call PlaceString ; "OK"
.StatusWritten
	hlcoord 7, 5
	ld de, StatusText
	call PlaceString ; "STATUS/"

	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call StatusScreen_MoveInput
	pop af
	ldh [hTileAnimations], a
	ld hl, wd72c
	res 1, [hl]
	ld a, $77
	ldh [rNR50], a
	call GBPalWhiteOut
	jp ClearScreen


; The four double-spaced rows show a window into the unlocked learnset.
StatusScreen_DrawMoveList:
	hlcoord 0, 8
	ld b, 8
	ld c, 18
	call TextBoxBorder
	ld a, [wAvailableMoveCount]
	ld b, a
	ld a, [wAvailableMoveOffset]
	ld c, a
	ld a, b
	sub c
	cp 4
	jr c, .countReady
	ld a, 4
.countReady
	ld [wAvailableMoveCursor], a ; number of visible rows
	and a
	ret z
	ld a, [wAvailableMoveOffset]
	ld c, a
	ld b, 0
	ld hl, wAvailableMoves
	add hl, bc
	ld b, 0
.printRow
	ld a, [hli]
	push hl
	push bc
	ld [wd11e], a
	call GetMoveName
	pop bc
	push bc
	ld a, b
	ld bc, SCREEN_WIDTH * 2
	hlcoord 2, 9
	call AddNTimes
	call PlaceString
	pop bc
	pop hl
	push hl
	push bc
	ld a, [wd11e]
	call GetMoveTPCost
	ld [wMoveTPCostBuffer], a
	pop bc
	push bc
	ld a, b
	ld bc, SCREEN_WIDTH * 2
	hlcoord 12, 9
	call AddNTimes
	ld de, TPCostText
	call PlaceString
	pop bc
	push bc
	ld a, b
	ld bc, SCREEN_WIDTH * 2
	hlcoord 15, 9
	call AddNTimes
	ld de, wMoveTPCostBuffer
	lb bc, 1, 3
	call PrintNumber
	pop bc
	pop hl
	inc b
	ld a, [wAvailableMoveCursor]
	cp b
	jr nz, .printRow
	ld a, [wAvailableMoveOffset]
	and a
	jr z, .checkDownArrow
	hlcoord 18, 9
	ld [hl], "▲"
.checkDownArrow
	ld a, [wAvailableMoveOffset]
	ld b, a
	ld a, [wAvailableMoveCursor]
	add b
	ld b, a
	ld a, [wAvailableMoveCount]
	cp b
	ret z
	hlcoord 18, 15
	ld [hl], "▼"
	ret

StatusScreen_MoveInput:
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit BIT_D_DOWN, a
	jr nz, .down
	bit BIT_D_UP, a
	jr nz, .up
	and A_BUTTON | B_BUTTON
	jr z, StatusScreen_MoveInput
	ret
.down
	ld a, [wAvailableMoveOffset]
	ld c, a
	ld a, [wAvailableMoveCount]
	sub 4
	jr c, StatusScreen_MoveInput
	cp c
	jr z, StatusScreen_MoveInput
	ld hl, wAvailableMoveOffset
	inc [hl]
	jr .redraw
.up
	ld hl, wAvailableMoveOffset
	ld a, [hl]
	and a
	jr z, StatusScreen_MoveInput
	dec [hl]
.redraw
	xor a
	ldh [hAutoBGTransferEnabled], a
	call StatusScreen_DrawMoveList
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	jr StatusScreen_MoveInput

CalcExpToLevelUp:
	ld a, [wLoadedMonLevel]
	cp MAX_LEVEL
	jr z, .atMaxLevel
	inc a
	ld d, a
	callfar CalcExperience
	ld hl, wLoadedMonExp + 2
	ldh a, [hExperience + 2]
	sub [hl]
	ld [hld], a
	ldh a, [hExperience + 1]
	sbc [hl]
	ld [hld], a
	ldh a, [hExperience]
	sbc [hl]
	ld [hld], a
	ret
.atMaxLevel
	ld hl, wLoadedMonExp
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

StatusScreenExpText:
	db   "EXP."
	next "NEXT@"

StatusScreen_ClearName:
	ld bc, 10
	ld a, " "
	jp FillMemory

StatusScreen_PrintTP:
; print "TP" c times, going down two rows each time
	ld a, "T"
	ld [hli], a
	ld a, "P"
	ld [hld], a
	add hl, de
	dec c
	jr nz, StatusScreen_PrintTP
	ret

StatusScreen_PrintPlaceholder:
; print the character in a twice, c times, going down two rows each time
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, StatusScreen_PrintPlaceholder
	ret
