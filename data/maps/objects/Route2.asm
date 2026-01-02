Route2_Object:
	db $5 ; border block

	def_warp_events
	warp_event 14, 21, DIGLETTS_CAVE_ROUTE_2, 1
	warp_event 15, 21, DIGLETTS_CAVE_ROUTE_2, 2

	def_bg_events
	bg_event 13, 57, 13 ; Route2Text3
	bg_event  9, 43, 14 ; Route2Text4
	bg_event  3, 55, 15 ; Route2Text5

	def_object_events
	object_event  6, 39, SPRITE_COOLTRAINER_M, STAY, DOWN, 1, OPP_BUG_CATCHER, 4
	object_event 13, 38, SPRITE_COOLTRAINER_M, STAY, NONE, 2, OPP_YOUNGSTER, 1
	object_event 12, 32, SPRITE_COOLTRAINER_F, STAY, NONE, 3, OPP_LASS, 1
	object_event  7, 30, SPRITE_COOLTRAINER_M, STAY, NONE, 4, OPP_BUG_CATCHER, 5
	object_event 10, 35, SPRITE_COOLTRAINER_F, STAY, NONE, 5, OPP_LASS, 2
	object_event  5, 26, SPRITE_COOLTRAINER_F, STAY, LEFT, 6, OPP_LASS, 2
	object_event 14, 26, SPRITE_COOLTRAINER_F, STAY, RIGHT, 7, OPP_LASS, 2
	object_event 10, 24, SPRITE_COOLTRAINER_F, STAY, RIGHT, 8, OPP_LASS, 2
	object_event 10, 41, SPRITE_COOLTRAINER_F, STAY, RIGHT, 9, OPP_LASS, 2

	object_event 12, 22, SPRITE_FISHER, STAY, LEFT, 10 ; person

	object_event 17, 22, SPRITE_POKE_BALL, STAY, NONE, 11, MOON_STONE
	object_event 15,  5, SPRITE_POKE_BALL, STAY, NONE, 12, POTION

	def_warps_to ROUTE_2

