CeruleanMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 6
	warp_event  3,  7, LAST_MAP, 6

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_CLERK, STAY, RIGHT, 1 ; person
	object_event  4,  5, SPRITE_COOLTRAINER_M, WALK, UP_DOWN, 2 ; person
	object_event  1,  4, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to CERULEAN_MART
