TokiwaCity_Object:
	db $f ; border block

	def_warp_events
	warp_event 18, 27, TOKIWA_INN, 1
	warp_event 28, 27, TOKIWA_CVS, 1
	warp_event 28, 19, OAKS_LAB, 1
	warp_event 18, 19, TOKIWA_HOUSE1, 1
	warp_event 18, 11, TOKIWA_CHAMP_CUP, 1

	def_bg_events
	bg_event 15, 25,  8 ; ViridianCityText8
	bg_event  0,  0,  9 ; ViridianCityText9
	bg_event 25, 19, 10 ; ViridianCityText10
	bg_event 27, 27, 11 ; MartSignText
	bg_event 17, 27, 12 ; PokeCenterSignText
	bg_event 17, 11, 13 ; ViridianCityText13

	def_object_events
	object_event 13, 28, SPRITE_LITTLE_BOY, WALK, ANY_DIR, 1 ; person
	object_event 32, 20, SPRITE_SCIENTIST, STAY, DOWN, 2 ; person
	object_event 23, 25, SPRITE_LITTLE_GIRL, WALK, ANY_DIR, 3 ; person
	object_event 20, 12, SPRITE_GIRL, STAY, UP, 4 ; person
	object_event 14,  7, SPRITE_SCIENTIST, STAY, NONE, 5 ; person
	object_event 16, 20, SPRITE_FISHER, WALK, ANY_DIR, 6 ; person
	object_event 11, 19, SPRITE_GIRL, WALK, LEFT_RIGHT, 7 ; person

	def_warps_to TOKIWA_CITY
