PewterCity_Object:
	db $a ; border block

	def_warp_events
	warp_event 16,  5, MUSEUM_1F, 1
	warp_event  0,  0, MUSEUM_1F, 3
	warp_event 10, 15, PEWTER_GYM, 1
	warp_event  0,  0, PEWTER_NIDORAN_HOUSE, 1
	warp_event 24, 21, PEWTER_MART, 1
	warp_event  0,  0, PEWTER_SPEECH_HOUSE, 1
	warp_event 14, 23, PEWTER_POKECENTER, 1

	def_bg_events
	bg_event  0,  1,  6 ; PewterCityText6
	bg_event  0,  1,  7 ; PewterCityText7
	bg_event 23, 21,  8 ; MartSignText
	bg_event 13, 23,  9 ; PokeCenterSignText
	bg_event  0,  1, 10 ; PewterCityText10
	bg_event  0,  1, 11 ; PewterCityText11
	bg_event  0,  1, 12 ; PewterCityText12

	def_object_events
	object_event  8, 15, SPRITE_COOLTRAINER_F, STAY, NONE, 1 ; person
	object_event 17, 25, SPRITE_COOLTRAINER_M, STAY, NONE, 2 ; person
	object_event 27, 17, SPRITE_SUPER_NERD, STAY, NONE, 3 ; person
	object_event 26, 25, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, 4 ; person
	object_event 35, 16, SPRITE_YOUNGSTER, STAY, DOWN, 5 ; person

	def_warps_to PEWTER_CITY
