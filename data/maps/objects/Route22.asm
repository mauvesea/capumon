Route22_Object:
	db $5 ; border block

	def_warp_events

	def_bg_events
	bg_event 11,  7, 10 ; Route22Text10

	def_object_events
	object_event 34,  8, SPRITE_FISHER, STAY, NONE, 1 ; person
	object_event 29, 10, SPRITE_COOLTRAINER_M, STAY, DOWN, 2, OPP_BUG_CATCHER, 4
	object_event 27, 13, SPRITE_COOLTRAINER_M, STAY, UP, 3, OPP_YOUNGSTER, 1
	object_event 22,  9, SPRITE_COOLTRAINER_F, STAY, RIGHT, 4, OPP_LASS, 1
	object_event 20,  4, SPRITE_COOLTRAINER_M, STAY, DOWN, 5, OPP_BUG_CATCHER, 5
	object_event 19,  7, SPRITE_COOLTRAINER_F, STAY, UP, 6, OPP_LASS, 2
	object_event  7,  5, SPRITE_COOLTRAINER_M, STAY, DOWN, 7, OPP_YOUNGSTER, 2
	object_event 17,  8, SPRITE_COOLTRAINER_M, STAY, LEFT, 8, OPP_BUG_CATCHER, 6
	object_event 11, 11, SPRITE_COOLTRAINER_F, STAY, NONE, 9, OPP_LASS, 3

	def_warps_to ROUTE_22
