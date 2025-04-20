PewterMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 5
	warp_event  3,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_CLERK, STAY, RIGHT, 1 ; person
	object_event  0,  5, SPRITE_YOUNGSTER, WALK, UP_DOWN, 2 ; person
	object_event  7,  2, SPRITE_SUPER_NERD, STAY, NONE, 3 ; person

	def_warps_to PEWTER_MART
