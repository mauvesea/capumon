ViridianCity_Object:
	db $f ; border block

	def_warp_events
	warp_event 18, 27, VIRIDIAN_POKECENTER, 1
	warp_event 28, 27, VIRIDIAN_MART, 1
	warp_event 28, 19, OAKS_LAB, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_HOUSE, 1
	warp_event 32,  7, VIRIDIAN_GYM, 1

	def_bg_events
	bg_event 17, 17,  8 ; ViridianCityText8
	bg_event 19,  1,  9 ; ViridianCityText9
	bg_event 21, 29, 10 ; ViridianCityText10
	bg_event 27, 27, 11 ; MartSignText
	bg_event 17, 27, 12 ; PokeCenterSignText
	bg_event 27,  7, 13 ; ViridianCityText13

	def_object_events
	object_event 13, 28, SPRITE_LITTLE_BOY, WALK, ANY_DIR, 1 ; person
	object_event 32, 20, SPRITE_SCIENTIST, STAY, NONE, 2 ; person
	object_event 23, 25, SPRITE_LITTLE_GIRL, WALK, ANY_DIR, 3 ; person
	object_event 20, 12, SPRITE_GIRL, STAY, RIGHT, 4 ; person
	object_event 14,  7, SPRITE_SCIENTIST, STAY, NONE, 5 ; person
	object_event 19, 20, SPRITE_FISHER, STAY, DOWN, 6 ; person
	object_event 11, 19, SPRITE_SCIENTIST, WALK, LEFT_RIGHT, 7 ; person

	def_warps_to VIRIDIAN_CITY
