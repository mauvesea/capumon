TokiwaInn_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

TokiwaInn_TextPointers:
	dw TokiwaInnNurseText
	dw TokiwaInnText2
	dw TokiwaInnText3
	dw TokiwaInnBoxLadyText

TokiwaInnNurseText:
	script_pokecenter_nurse

TokiwaInnText2:
	text_far _TokiwaInnText2
	text_end

TokiwaInnText3:
	text_far _TokiwaInnText3
	text_end

TokiwaInnBoxLadyText:
	text_asm
	ld hl, TokiwaInnBoxLadyText1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .No
	ld a, 0
	ld [wCurrentMenuItem], a
	farcall ChangeBox
	call SaveScreenTilesToBuffer2
	callfar BillsPC_
.No
	ld hl, TokiwaInnBoxLadyText2
	call PrintText
.Finished
	jp TextScriptEnd

TokiwaInnBoxLadyText1:
	text_far _TokiwaInnBoxLadyText1
	text_end


TokiwaInnBoxLadyText2:
	text_far _TokiwaInnBoxLadyText2
	text_end
	
