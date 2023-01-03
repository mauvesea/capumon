PalletTown_Script:
	jp EnableAutoTextBoxDrawing

PalletTown_TextPointers:
	dw MasaraTown_WomanNPCText
	dw MasaraTown_ManNPCText
	dw MasaraTown_SignPostText
	dw MasaraTown_PlayerHouseSignText
	dw MasaraTown_JuniorHouseSignText

MasaraTown_WomanNPCText:
	text_far _MasaraTown_WomanNPCText
	text_end

MasaraTown_ManNPCText:
	text_far _MasaraTown_ManNPCText
	text_end

MasaraTown_SignPostText:
	text_far _MasaraTown_SignPostText
	text_end

MasaraTown_PlayerHouseSignText:
	text_far _MasaraTown_PlayerHouseSignText
	text_end

MasaraTown_JuniorHouseSignText:
	text_far _MasaraTown_JuniorHouseSignText
	text_end
