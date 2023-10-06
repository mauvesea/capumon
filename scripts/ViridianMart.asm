ViridianMart_Script:
	jp EnableAutoTextBoxDrawing

ViridianMart_TextPointers:
	dw ViridianCashierText
	dw ViridianMartText2
	dw ViridianMartText3
	dw ViridianMartText4

ViridianMartText1:
	text_far _ViridianMartText1
	text_end

ViridianMartText5:
	text_far ViridianMartParcelQuestText
	sound_get_key_item
	text_end

ViridianMartText2:
	text_far _ViridianMartText2
	text_end

ViridianMartText3:
	text_far _ViridianMartText3
	text_end

ViridianMartText4:
	text_asm
	CheckEvent EVENT_BOUGHT_MAGIKARP, 1
	jp c, .alreadyBoughtMagikarp
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
	ld a, $5
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, MAGIKARP, 5
	call GivePokemon
	jr nc, .done
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $5
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	SetEvent EVENT_BOUGHT_MAGIKARP
	jr .done
.choseNo
	ld hl, .RefuseText
	jr .printText
.alreadyBoughtMagikarp
	ld hl, .Text2
.printText
	call PrintText
.done
	jp TextScriptEnd

.Text1
	text_far _MagikarpSalesmanText1
	text_end

.RefuseText
	text_far _MagikarpSalesmanNoText
	text_end

.NoMoneyText
	text_far _MagikarpSalesmanNoMoneyText
	text_end

.Text2
	text_far _MagikarpSalesmanText2
	text_end