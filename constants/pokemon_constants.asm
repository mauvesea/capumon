; pokemon ids
; indexes for:
; - MonsterNames (see data/pokemon/names.asm)
; - EvosMovesPointerTable (see data/pokemon/evos_moves.asm)
; - CryData (see data/pokemon/cries.asm)
; - PokedexOrder (see data/pokemon/dex_order.asm)
; - PokedexEntryPointers (see data/pokemon/dex_entries.asm)
	const_def
	const NO_MON             ; $00
	const HARIUSAM
	const HARIUSAF
	const YADDON
	const GARURA
	const CYHORN
	const BETBETER
	const BIRIDAMA
	const GENGAR
	const FUSIGISO
	const MYCORM
	const MYCORF
	const TAMATAMA
	const BELINGA
	const NASSY
	const PIP
	const GYACE
	const OMOM
	const GAGARTH
	const MONJARA
	const OMEGA
	const CAIROSS
	const WING
	const STRIKE
	const GYARADOS
	const SHELLDER
	const KARAKARA
	const AMBLER
	const RAPRUTH
	const GOUTH
	const KARABATH
	const MIMI

DEF NUM_POKEMON_INDEXES EQU const_value - 1

; starters
DEF STARTER1 EQU OMEGA
DEF STARTER2 EQU OMEGA
DEF STARTER3 EQU OMEGA

; ghost Marowak in Pokémon Tower
DEF RESTLESS_SOUL EQU OMEGA
