Route4_Object:
	db $2c ; border block

	def_warp_events
	warp_event 10,  3, MT_MOON_POKECENTER, 1
	warp_event 18,  5, MT_MOON_1F, 1
	warp_event 19,  5, MT_MOON_1F, 2
	warp_event 30,  5, MT_MOON_B1F, 8
	warp_event 31,  5, MT_MOON_B1F, 8

	def_bg_events
	bg_event 10,  3, 4 ; PokeCenterSignText
	bg_event 17,  7, 5 ; Route4Text5
	bg_event 33,  7, 6 ; Route4Text6

	def_object_events
	object_event 15,  9, SPRITE_COOLTRAINER_F, WALK, ANY_DIR, 1 ; person
	object_event 63,  3, SPRITE_COOLTRAINER_F, STAY, RIGHT, 2, OPP_LASS, 4
	object_event 57,  3, SPRITE_POKE_BALL, STAY, NONE, 3, TM_WHIRLWIND

	def_warps_to ROUTE_4
