TokiwaHouse1_Script:
	jp EnableAutoTextBoxDrawing

TokiwaHouse1_TextPointers:
	dw TokiwaHouse1Text1
	dw TokiwaHouse1Text2
	dw TokiwaHouse1Text3
	dw TokiwaHouse1Text4

TokiwaHouse1Text1:
	text_far _TokiwaHouse1Text1
	text_end

TokiwaHouse1Text2:
	text_far _TokiwaHouse1Text2
	text_end

TokiwaHouse1Text3:
	text_asm
	ld hl, TokiwaHouse1Text_1d5b1
	call PrintText
	ld a, OMEGA
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

TokiwaHouse1Text_1d5b1:
	text_far _TokiwaHouse1Text_1d5b1
	text_end

TokiwaHouse1Text4:
	text_far _TokiwaHouse1Text4
	text_end
