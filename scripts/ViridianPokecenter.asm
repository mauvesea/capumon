ViridianPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

ViridianPokecenter_TextPointers:
	dw ViridianHealNurseText
	dw ViridianPokeCenterText2
	dw ViridianPokeCenterText3
	dw ViridianTradeNurseText

ViridianHealNurseText:
	script_pokecenter_nurse

ViridianPokeCenterText2:
	text_far _ViridianPokeCenterText2
	text_end

ViridianPokeCenterText3:
	text_far _ViridianPokeCenterText3
	text_end

ViridianTradeNurseText:
	script_bills_pc
	