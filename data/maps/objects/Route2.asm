Route2_Object:
	db $5 ; border block

	def_warp_events
	warp_event 14, 21, DIGLETTS_CAVE_ROUTE_2, 1
	warp_event 15, 21, DIGLETTS_CAVE_ROUTE_2, 2
	warp_event  4, 29, VIRIDIAN_FOREST, 1
	warp_event  5, 29, VIRIDIAN_FOREST, 2
	warp_event  8, 40, VIRIDIAN_FOREST, 3
	warp_event  9, 40, VIRIDIAN_FOREST, 4

	def_bg_events
	bg_event 13, 57, 3 ; Route2Text3
	bg_event  9, 43, 4 ; Route2Text4

	def_object_events
	object_event 13, 54, SPRITE_POKE_BALL, STAY, NONE, 1, MOON_STONE
	object_event 13, 45, SPRITE_POKE_BALL, STAY, NONE, 2, HP_UP

	def_warps_to ROUTE_2

