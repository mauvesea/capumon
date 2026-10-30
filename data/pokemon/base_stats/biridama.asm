	db DEX_BIRIDAMA ; pokedex id

	db  25, 100,  20,  15,  90, 105
	;   hp   tp  atk  def  spd  spc

	db NORMAL, NORMAL ; unused monster type fields
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/monsters/biridama.pic", 0, 1 ; sprite dimensions
	dw BiridamaPicFront, BiridamaPicBack

	db ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_P,   MEGA_K,    TOXIC,        BODYSLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         METRNOME,    SKULL_BASH,   REST,         VOLT_50K, \
	     PSYWAVE,      TRI_ATTACK,   SUBSTITUTE,   FLASH
	; end

	db BANK(BiridamaPicFront)
	assert BANK(BiridamaPicFront) == BANK(BiridamaPicBack)
