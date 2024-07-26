ViridianGym_Object:
	db $3 ; border block

	def_warp_events
	warp_event 12,  7, LAST_MAP, 5
	warp_event 13,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event -2, -6, SPRITE_GIOVANNI, STAY, DOWN, 1, OPP_GIOVANNI, 3
	object_event  8, -3, SPRITE_COOLTRAINER_M, STAY, DOWN, 2, OPP_COOLTRAINER_M, 9
	object_event  7,  1, SPRITE_HIKER, STAY, UP, 3, OPP_BLACKBELT, 6
	object_event  6, -3, SPRITE_ROCKER, STAY, DOWN, 4, OPP_TAMER, 3
	object_event -1, -3, SPRITE_HIKER, STAY, LEFT, 5, OPP_BLACKBELT, 7
	object_event  9, -5, SPRITE_COOLTRAINER_M, STAY, RIGHT, 6, OPP_COOLTRAINER_M, 10
	object_event  6, -6, SPRITE_HIKER, STAY, DOWN, 7, OPP_BLACKBELT, 8
	object_event -2,  6, SPRITE_ROCKER, STAY, RIGHT, 8, OPP_TAMER, 4
	object_event  2, -5, SPRITE_COOLTRAINER_M, STAY, DOWN, 9, OPP_COOLTRAINER_M, 1
	object_event 12,  5, SPRITE_GYM_GUIDE, STAY, DOWN, 10 ; person
	object_event 12, -1, SPRITE_POKE_BALL, STAY, NONE, 11, REVIVE

	def_warps_to VIRIDIAN_GYM
