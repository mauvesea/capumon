	db DEX_WING ; pokedex id

	db  25,  20,  15,  90, 105
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/monsters/wing.pic", 0, 1 ; sprite dimensions
	dw WingPicFront, WingPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         METRONOME,    SKULL_BASH,   REST,         THUNDER_WAVE, \
	     PSYWAVE,      TRI_ATTACK,   SUBSTITUTE,   FLASH
	; end

	db BANK(WingPicFront)
	assert BANK(WingPicFront) == BANK(WingPicBack)
