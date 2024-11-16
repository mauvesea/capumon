; TypeNames indexes (see data/types/names.asm)
	const_def

DEF PHYSICAL EQU const_value
	const NORMAL       ; $00
	const FIGHTING     ; $01
	const FLYING       ; $02
	const POISON       ; $03
	const GROUND       ; $04
	const ROCK         ; $05
	const BIRD         ; $06
	const BUG          ; $07
	const GHOST        ; $08

DEF UNUSED_TYPES EQU const_value
	const_next 20
DEF UNUSED_TYPES_END EQU const_value

DEF SPECIAL EQU const_value
	const FIRE         ; $14
	const WATER        ; $15
	const GRASS        ; $16
	const ELECTRIC     ; $17
	const PSYCHIC_TYPE ; $18
	const ICE          ; $19
	const DRAGON       ; $1A
	const HARIUSAGIM_TYPE
	const HARIUSAGIF_TYPE
	const YADDON_TYPE
	const GARURA_TYPE
	const CYHORN_TYPE
	const BETTOBETER_TYPE
	const BIRIRIDAMA_TYPE
	const GENGAR_TYPE
	const FUSHIGISO_TYPE
	const MYCORM_TYPE
	const MYCORF_TYPE
	const TAMATAMA_TYPE
	const BELORINGA_TYPE
	const NASSHII_TYPE
	const PIP_TYPE
	const GYACE_TYPE
	const OMOM_TYPE
	const GAGARTH_TYPE
	const MONJARA_TYPE
	const OMEGA_TYPE
	const CAIROSS_TYPE
	const WING_TYPE
	const STRIKE_TYPE
	const GYARADOSS_TYPE
	const SHELLDER_TYPE
	const KARAKARA_TYPE
	const AMBLER_TYPE
	const RAPRUTH_TYPE
	const GOUTH_TYPE
	const KARABATHEO_TYPE
	const MIMI_TYPE

DEF NUM_TYPES EQU const_value
