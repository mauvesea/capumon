CinnabarPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 4
	warp_event  4,  7, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, 1 ; person
	object_event  6,  4, SPRITE_COOLTRAINER_F, WALK, ANY_DIR, 2 ; person
	object_event  2,  6, SPRITE_GENTLEMAN, STAY, NONE, 3 ; person
	object_event  6,  1, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 4 ; person

	def_warps_to CINNABAR_POKECENTER
