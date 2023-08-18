OaksLab_Object:
	db $3 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_BLUE, STAY, NONE, 1, OPP_RIVAL1, 1
	object_event  6,  3, SPRITE_POKE_BALL, STAY, NONE, 2 ; person
	object_event  7,  3, SPRITE_POKE_BALL, STAY, NONE, 3 ; person
	object_event  8,  3, SPRITE_POKE_BALL, STAY, NONE, 4 ; person
	object_event  5,  2, SPRITE_OAK, STAY, DOWN, 5 ; person
	object_event  2,  1, SPRITE_POKEDEX, STAY, NONE, 6 ; person
	object_event  3,  1, SPRITE_POKEDEX, STAY, NONE, 7 ; person
	object_event  3,  6, SPRITE_OAK, STAY, UP, 8 ; person
	object_event  1,  6, SPRITE_GIRL, WALK, UP_DOWN, 9 ; person
	object_event  1,  7, SPRITE_SCIENTIST, STAY, NONE, 10 ; person
	object_event  5,  7, SPRITE_SCIENTIST, STAY, NONE, 11 ; person

	def_warps_to OAKS_LAB
