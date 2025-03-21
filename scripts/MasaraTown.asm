MasaraTown_Script:
	jp EnableAutoTextBoxDrawing

MasaraTown_TextPointers:
	dw MasaraTown_WomanNPCText
	dw MasaraTown_ManNPCText
	dw MasaraTownText
	dw MasaraPlayerHouseText
	dw MasaraJuniorHouseText

MasaraTown_WomanNPCText:
	text_far _MasaraTown_WomanNPCText
	text_end

MasaraTown_ManNPCText:
	text_far _MasaraTown_ManNPCText
	text_end

MasaraTownText:
	text_far _MasaraTownText
	text_end

MasaraPlayerHouseText:
	text_far _MasaraPlayerHouseText
	text_end

MasaraJuniorHouseText:
	text_far _MasaraJuniorHouseText
	text_end
