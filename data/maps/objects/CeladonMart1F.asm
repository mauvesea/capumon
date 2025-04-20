CeladonMart1F_Object:
	db $f ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  0, -1, LAST_MAP, 2
	warp_event  0, -1, LAST_MAP, 2
	warp_event  0, -1, CELADON_MART_2F, 1
	warp_event  0, -1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event  1, -1, 2 ; CeladonMart1Text2
	bg_event  1, -1, 3 ; CeladonMart1Text3

	def_object_events
	object_event  2, -1, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 1 ; person

	def_warps_to CELADON_MART_1F
