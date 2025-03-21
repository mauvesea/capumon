Route2_Script:
	jp EnableAutoTextBoxDrawing

Route2_TextPointers:
	dw PickUpItemText
	dw PickUpItemText
	dw Route2Text3
	dw Route2Text4
	dw Route2Text5

Route2Text3:
	text_far _Route2Text3
	text_end

Route2Text4:
	text_far _Route2Text4
	text_end

Route2Text5:
	text_far _Route2Text5
	text_end
