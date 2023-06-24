_NanamiText1::
	text "NANAMI: Hello,"
	line "<PLAYER>!"
	para "To go on a"
	line "journey..."
	para "You make me"
	line "proud!"
	para "Here, this is"
	line "a gift from"
	para "this big"
	line "sister!"
	prompt

_GotMapText::
	text "<PLAYER> got a"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_NanamiBagFullText::
	text "NANAMI: Oh!"
	line "You're carrying"
	para "too much stuff,"
	line "right?"
	para "Come back when"
	line "you got some"	
	para "space in your"
	cont "bag!"
	done

_NanamiText2::
	text "NANAMI: You"
	line "can use the"
	para "TOWN MAP to"
	line "find out where"
	para "you are at any"
	line "moment."
	done

_NanamiText3::
	text "NANAMI: Hey!"
	line "Never forget that"
	para "CAPMON are living"
	line "things, okay?"
	para "You must take care"
	line "of them, just"
	para "like I used to"
	line "take care of you"
	para "when you were"
	line "little!"
	done
