	db DEX_CYHORN ; pokedex id

	db  25, 100,  20,  15,  90, 105
	;   hp   tp  atk  def  spd  spc

	db NORMAL, NORMAL ; unused monster type fields
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/monsters/cyhorn.pic", 0, 1 ; sprite dimensions
	dw CyhornPicFront, CyhornPicBack

	db ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_P,   MEGA_K,    TOXIC,        BODYSLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         METRNOME,    SKULL_BASH,   REST,         VOLT_50K, \
	     PSYWAVE,      TRI_ATTACK,   SUBSTITUTE,   FLASH
	; end

	db BANK(CyhornPicFront)
	assert BANK(CyhornPicFront) == BANK(CyhornPicBack)
