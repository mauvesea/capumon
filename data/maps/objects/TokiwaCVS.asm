TokiwaCVS_Object:
	db $0 ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_CLERK, STAY, DOWN, 1 ; person
	object_event  1,  1, SPRITE_CLERK, STAY, DOWN, 2 ; person
	object_event  5,  3, SPRITE_YOUNGSTER, WALK, UP_DOWN, 3 ; person
	object_event  0,  6, SPRITE_COOLTRAINER_M, STAY, NONE, 4 ; person

	def_warps_to TOKIWA_CVS
