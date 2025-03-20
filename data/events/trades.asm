TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; Japanese Red and Green used TRADE_DIALOGSET_CASUAL, and had
	; the same species as English Red and Blue.
	db OMEGA,   OMEGA,  TRADE_DIALOGSET_CASUAL,    "TERRY@@@@@@"
	db OMEGA,       OMEGA,   TRADE_DIALOGSET_CASUAL,    "MARCEL@@@@@"
	db OMEGA, OMEGA,  TRADE_DIALOGSET_HAPPY,     "CHIKUCHIKU@" ; unused
	db OMEGA,     OMEGA,      TRADE_DIALOGSET_CASUAL,    "SAILOR@@@@@"
	db OMEGA,    OMEGA, TRADE_DIALOGSET_HAPPY,     "DUX@@@@@@@@"
	db OMEGA,    OMEGA, TRADE_DIALOGSET_CASUAL,    "MARC@@@@@@@"
	db OMEGA,  OMEGA,      TRADE_DIALOGSET_EVOLUTION, "LOLA@@@@@@@"
	db OMEGA,     OMEGA, TRADE_DIALOGSET_EVOLUTION, "DORIS@@@@@@"
	db OMEGA,    OMEGA,   TRADE_DIALOGSET_HAPPY,     "CRINKLES@@@"
	db OMEGA,  OMEGA, TRADE_DIALOGSET_HAPPY,     "SPOT@@@@@@@"
	assert_table_length NUM_NPC_TRADES
