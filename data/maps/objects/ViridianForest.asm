ViridianForest_Object:
	db $5 ; border block

	def_warp_events
	warp_event  2,  0, ROUTE_2, 3
	warp_event  3,  0, ROUTE_2, 4
	warp_event 16, 47, ROUTE_2, 5
	warp_event 17, 47, ROUTE_2, 6

	def_bg_events
	bg_event 25, 41,  9 ; ViridianForestText9
	bg_event 17, 33, 10 ; ViridianForestText10
	bg_event 27, 17, 11 ; ViridianForestText11
	bg_event  5, 25, 12 ; ViridianForestText12
	bg_event 18, 45, 13 ; ViridianForestText13
	bg_event  0,  0, 14 ; ViridianForestText14

	def_object_events
	object_event 16, 43, SPRITE_YOUNGSTER, STAY, NONE, 1 ; person
	object_event 30, 33, SPRITE_YOUNGSTER, STAY, LEFT, 2, OPP_BUG_CATCHER, 1
	object_event 30, 19, SPRITE_YOUNGSTER, STAY, LEFT, 3, OPP_BUG_CATCHER, 2
	object_event  2, 18, SPRITE_YOUNGSTER, STAY, LEFT, 4, OPP_BUG_CATCHER, 3
	object_event 25, 11, SPRITE_POKE_BALL, STAY, NONE, 5, ANTIDOTE
	object_event 12, 29, SPRITE_POKE_BALL, STAY, NONE, 6, POTION
	object_event  1, 31, SPRITE_POKE_BALL, STAY, NONE, 7, POKE_BALL
	object_event 27, 40, SPRITE_YOUNGSTER, STAY, NONE, 8 ; person

	def_warps_to VIRIDIAN_FOREST
