PewterCity_Object:
	db $27 ; border block

	def_warp_events
	warp_event 16,  5, MUSEUM_1F, 1
	warp_event  0,  0, MUSEUM_1F, 3
	warp_event 32, 19, PEWTER_GYM, 1
	warp_event 20, 21, PEWTER_NIDORAN_HOUSE, 1
	warp_event 12, 15, PEWTER_MART, 1
	warp_event 22, 15, PEWTER_SPEECH_HOUSE, 1
	warp_event 14, 23, PEWTER_POKECENTER, 1

	def_bg_events
	bg_event 11, 15,  6 ; MartSignText
	bg_event 13, 23,  7 ; PokeCenterSignText
	bg_event 19, 27,  8 ; NibiCityText
	bg_event 31, 19,  9 ; NibiChampCupText
	bg_event 15,  5, 10 ; NibiMuseumText
	bg_event 25, 15, 11 ; NibiRocketText
	bg_event 21, 15, 12 ; NibiPoliceText

	def_object_events
	object_event  9, 17, SPRITE_GIRL, STAY, NONE, 1 ; person
	object_event 26, 19, SPRITE_LITTLE_BOY, STAY, NONE, 2 ; person
	object_event 15,  8, SPRITE_FISHER, STAY, NONE, 3 ; person
	object_event 15, 26, SPRITE_FISHER, WALK, LEFT_RIGHT, 4 ; person
	object_event 35, 16, SPRITE_COOLTRAINER_M, STAY, DOWN, 5 ; person

	def_warps_to PEWTER_CITY
