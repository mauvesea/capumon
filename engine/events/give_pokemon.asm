_GivePokemon::
; returns success in carry
; and whether the mon was added to the party in [wAddedToParty]
	call EnableAutoTextBoxDrawing
	xor a
	ld [wAddedToParty], a
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr c, .addToParty
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jr nc, .boxFull
; add to box
	xor a
	ld [wEnemyBattleStatus3], a
	ld a, [wcf91]
	ld [wEnemyMonSpecies2], a
	callfar LoadEnemyMonData
	call SetPokedexOwnedFlag
	callfar SendNewMonToBox
	call DecideWhichStorageCornerText
	call CopyToStringBuffer
	ld hl, SentToBoxText
	call PrintText
	scf
	ret
.boxFull
	ld hl, BoxIsFullText
	call PrintText
	and a
	ret
.addToParty
	call SetPokedexOwnedFlag
	call AddPartyMon
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld [wAddedToParty], a
	scf
	ret

SetPokedexOwnedFlag:
	ld a, [wcf91]
	push af
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld hl, wPokedexOwned
	ld b, FLAG_SET
	predef FlagActionPredef
	pop af
	ld [wd11e], a
	call GetMonName
	ld hl, GotMonText
	jp PrintText

GotMonText:
	text_far _GotMonText
	sound_get_item_1
	text_end

SentToBoxText:
	text_far _SentToBoxText
	text_end

BoxIsFullText:
	text_far _BoxIsFullText
	text_end

DecideWhichStorageCornerText:
.YamabukiSC
	ld a, [wCurrentBoxNum]
	cp 8
	jr nz, .GurenSC
	ld de, YamabukiSC
	jr .next
.GurenSC
	ld a, [wCurrentBoxNum]
	cp 7
	jr nz, .SekichikuSC
	ld de, GurenSC
	jr .next
.SekichikuSC
	ld a, [wCurrentBoxNum]
	cp 6
	jr nz, .TamamushiSC
	ld de, SekichikuSC
	jr .next
.TamamushiSC
	ld a, [wCurrentBoxNum]
	cp 5
	jr nz, .ShionSC
	ld de, TamamushiSC
	jr .next
.ShionSC
	ld a, [wCurrentBoxNum]
	cp 4
	jr nz, .KuchibaSC
	ld de, ShionSC
	jr .next
.KuchibaSC
	ld a, [wCurrentBoxNum]
	cp 3
	jr nz, .HanadaSC
	ld de, KuchibaSC
	jr .next
.HanadaSC
	ld a, [wCurrentBoxNum]
	cp 2
	jr nz, .NibiSC
	ld de, HanadaSC
	jr .next
.NibiSC
	ld a, [wCurrentBoxNum]
	cp 1
	jr nz, .TokiwaSC
	ld de, NibiSC
	jr .next
.TokiwaSC
	ld de, TokiwaSC
.next
	ret

YamabukiSC:
	db "YAMABUKI@"
GurenSC:
	db "GUREN@"
SekichikuSC:
	db "SEKICHIKU@"
TamamushiSC:
	db "TAMAMUSHI@"
ShionSC:
	db "SHION@"
KuchibaSC:
	db "KUCHIBA@"
HanadaSC:
	db "HANADA@"
NibiSC:
	db "NIBI@"
TokiwaSC:
	db "TOKIWA@"
