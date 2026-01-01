TokiwaCVS_Script:
	jp EnableAutoTextBoxDrawing

TokiwaCVS_TextPointers:
	dw TokiwaItemSellerText
	dw TokiwaMonsterSellerText
	dw TokiwaCVSText1
	dw TokiwaCVSText2

TokiwaCVSText1:
	text_far _TokiwaCVSText1
	text_end

TokiwaCVSText2:
	text_far _TokiwaCVSText2
	text_end

TokiwaMonsterSellerText:
	text_asm
	ld hl, .Text1
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $20
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
; Add a Rank check here
	lb bc, CYHORN, 5
	call GivePokemon
	jr nc, .done
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $20
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jr .done
.choseNo
	ld hl, .RefuseText
	jr .printText
.printText
	call PrintText
.done
	jp TextScriptEnd

.Text1
	text_far _TokiwaCVSMonsterSellerText1
	text_end

.RefuseText
	text_far _TokiwaCVSMonsterSellerTextNotBuying
	text_end

.NoMoneyText
	text_far _TokiwaCVSMonsterSellerTextNoMoney
	text_end
