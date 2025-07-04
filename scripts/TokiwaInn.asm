TokiwaInn_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

TokiwaInn_TextPointers:
	dw ViridianHealNurseText
	dw TokiwaInnText2
	dw TokiwaInnText3
	dw ViridianTradeNurseText

ViridianHealNurseText:
	script_pokecenter_nurse

TokiwaInnText2:
	text_far _TokiwaInnText2
	text_end

TokiwaInnText3:
	text_far _TokiwaInnText3
	text_end

ViridianTradeNurseText:
	script_bills_pc
	
