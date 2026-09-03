_TokiwaCVSText1::
	text "This shop sells"
	line "many ANTIDOTEs."
	cont "They come in"
	cont "handy when"
	cont "facing BETBETER."
	done

_TokiwaCVSText2::
	text "That's bad..."
	line "POTIONs are all"
	cont "sold out."
	done

_TokiwaCVSMonsterSellerText1::
	text "Hi there!"
	line "We have a strong"
	cont "CAPMON in stock."

	para "It's CYHORN!"

	para "It can be yours"
	line "for 2000¥."
	cont "What do you say?"
	done

_TokiwaCVSMonsterSellerTextNotBuying::
	text "Come back any"
	line "time!"
	done

_TokiwaCVSMonsterSellerTextNoMoney::
	text "Oh... You need"
	line "more money."
	done

_TokiwaCVSMonsterSellerLowRank::
	text "Wait a minute..."

	para "Your CHARISMA is"
	line "too low!"

	para "There's not way"
	line "you can actually"
	cont "raise a CAPMON"
	cont "like this one."

	para "Come back when"
	line "you raise your"
	cont "CHARISMA a bit."
	done

_TokiwaCVSMonsterBuyerAskText::
	text "Welcome! I buy"
	line "CAPMON off"
	cont "trainers."

	para "Care to sell me"
	line "one of yours?"
	done

_TokiwaCVSMonsterBuyerWhichMonText::
	text "Which one are"
	line "you selling?"
	done

_TokiwaCVSMonsterBuyerOfferText::
	text "I can buy"
	line "@"
	text_ram wcd6d
	text " for @"
	text_bcd wMonValueBCD, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "G."

	para "Is that okay?"
	done

_TokiwaCVSMonsterBuyerThanksText::
	text "Thanks! It's in"
	line "good hands."
	done

_TokiwaCVSMonsterBuyerOnlyOneMonText::
	text "Hold on! That's"
	line "your last CAPMON."

	para "You'd have"
	line "nothing left to"
	cont "battle with!"
	done

_TokiwaCVSMonsterBuyerComeAgainText::
	text "Come back any"
	line "time!"
	done
