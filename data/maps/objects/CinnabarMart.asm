CinnabarMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 5
	warp_event  3,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_CLERK, STAY, RIGHT, 1 ; person
	object_event  0,  3, SPRITE_ERIKA, STAY, NONE, 2 ; person
	object_event  4,  5, SPRITE_SCIENTIST, STAY, NONE, 3 ; person

	def_warps_to CINNABAR_MART
