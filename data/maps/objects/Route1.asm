Route1_Object:
	db $5 ; border block

	def_warp_events

	def_bg_events
	bg_event  9, 31, 3 ; Route1Text3
	bg_event 13, 23, 4 ; Route1Text4

	def_object_events
	object_event  4, 18, SPRITE_SCIENTIST, WALK, UP_DOWN, 1 ; person
	object_event 11, 22, SPRITE_FISHER, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to ROUTE_1

