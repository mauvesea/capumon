OaksLab_Object:
	db $3 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_OAK, STAY, DOWN, 1
	object_event  2,  1, SPRITE_POKEDEX, STAY, NONE, 2 ; person
	object_event  3,  1, SPRITE_POKEDEX, STAY, NONE, 3 ; person
	object_event  6,  6, SPRITE_GIRL, STAY, NONE, 5 ; person
	object_event  0,  2, SPRITE_SCIENTIST, STAY, UP, 4 ; person

	def_warps_to OAKS_LAB
