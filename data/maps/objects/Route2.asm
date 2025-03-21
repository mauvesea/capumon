Route2_Object:
	db $5 ; border block

	def_warp_events
	warp_event 14, 21, DIGLETTS_CAVE_ROUTE_2, 1
	warp_event 15, 21, DIGLETTS_CAVE_ROUTE_2, 2

	def_bg_events
	bg_event 13, 57, 3 ; Route2Text3
	bg_event  9, 43, 4 ; Route2Text4
	bg_event  3, 55, 5 ; Route2Text5

	def_object_events
	object_event 17, 22, SPRITE_POKE_BALL, STAY, NONE, 1, MOON_STONE
	object_event 15,  5, SPRITE_POKE_BALL, STAY, NONE, 2, POTION

	def_warps_to ROUTE_2

