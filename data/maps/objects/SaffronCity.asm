SaffronCity_Object:
	db $f ; border block

	def_warp_events
	warp_event  7, 29, COPYCATS_HOUSE_1F, 1
	warp_event  0,  0, FIGHTING_DOJO, 1
	warp_event 30, 27, SAFFRON_GYM, 1
	warp_event  0,  0, SAFFRON_PIDGEY_HOUSE, 1
	warp_event 32,  9, SAFFRON_MART, 1
	warp_event 20, 19, SILPH_CO_1F, 1
	warp_event 12, 11, SAFFRON_POKECENTER, 1
	warp_event 15, 29, MR_PSYCHICS_HOUSE, 1

	def_bg_events
	bg_event  0,  2, 16 ; SaffronCityText16
	bg_event  0,  2, 17 ; SaffronCityText17
	bg_event  0,  2, 18 ; SaffronCityText18
	bg_event 31,  9, 19 ; MartSignText
	bg_event 39, 19, 20 ; SaffronCityText20
	bg_event  0,  2, 21 ; SaffronCityText21
	bg_event  0,  2, 22 ; SaffronCityText22
	bg_event 11, 11, 23 ; PokeCenterSignText
	bg_event 27, 29, 24 ; SaffronCityText24
	bg_event  0,  2, 25 ; SaffronCityText25

	def_object_events
	object_event  0,  1, SPRITE_ROCKET, STAY, NONE, 1 ; person
	object_event  0,  1, SPRITE_ROCKET, WALK, LEFT_RIGHT, 2 ; person
	object_event  0,  1, SPRITE_ROCKET, STAY, NONE, 3 ; person
	object_event  0,  1, SPRITE_ROCKET, STAY, NONE, 4 ; person
	object_event  0,  1, SPRITE_ROCKET, WALK, LEFT_RIGHT, 5 ; person
	object_event  0,  1, SPRITE_ROCKET, WALK, LEFT_RIGHT, 6 ; person
	object_event  0,  1, SPRITE_ROCKET, WALK, LEFT_RIGHT, 7 ; person
	object_event  0,  1, SPRITE_SCIENTIST, WALK, ANY_DIR, 8 ; person
	object_event  0,  1, SPRITE_SILPH_WORKER, STAY, NONE, 9 ; person
	object_event  0,  1, SPRITE_ERIKA, WALK, LEFT_RIGHT, 10 ; person
	object_event  0,  1, SPRITE_GENTLEMAN, STAY, DOWN, 11 ; person
	object_event  0,  1, SPRITE_BIRD, STAY, DOWN, 12 ; person
	object_event  0,  1, SPRITE_ROCKER, STAY, UP, 13 ; person
	object_event  0,  1, SPRITE_ROCKET, STAY, DOWN, 14 ; person
	object_event  0,  1, SPRITE_ROCKET, STAY, DOWN, 15 ; person

	def_warps_to SAFFRON_CITY
