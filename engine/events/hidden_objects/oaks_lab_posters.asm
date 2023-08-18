DisplayOakLabLeftPoster:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomSNESText ; tx_pre_jump PushStartText -> Figure out why it's glitching


DisplayOakLabRightPoster:
	call EnableAutoTextBoxDrawing
	tx_pre_jump SaveOptionText

PushStartText::
	text_far _PushStartText
	text_end

SaveOptionText::
	text_far _SaveOptionText
	text_end

StrengthsAndWeaknessesText::
	text_far _StrengthsAndWeaknessesText
	text_end
