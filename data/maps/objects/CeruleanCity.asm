CeruleanCity_Object:
	db $f ; border block

	def_warp_events
	warp_event  0,  0, CERULEAN_TRASHED_HOUSE, 1
	warp_event  0,  0, CERULEAN_TRADE_HOUSE, 1
	warp_event 22, 29, CERULEAN_POKECENTER, 1
	warp_event 10, 29, CERULEAN_GYM, 1
	warp_event  0,  0, BIKE_SHOP, 1
	warp_event  6,  9, CERULEAN_MART, 1
	warp_event 35,  5, CERULEAN_CAVE_1F, 1
	warp_event  0,  0, CERULEAN_TRASHED_HOUSE, 3
	warp_event  0,  0, CERULEAN_BADGE_HOUSE, 2
	warp_event  0,  0, CERULEAN_BADGE_HOUSE, 1

	def_bg_events
	bg_event  0,  1, 12 ; CeruleanCityText12
	bg_event  0,  1, 13 ; CeruleanCityText13
	bg_event  5,  9, 14 ; MartSignText
	bg_event 21, 29, 15 ; PokeCenterSignText
	bg_event  0,  1, 16 ; CeruleanCityText16
	bg_event  0,  1, 17 ; CeruleanCityText17

	def_object_events
	object_event  0,  2, SPRITE_BLUE, STAY, DOWN, 1 ; person
	object_event  0,  2, SPRITE_ROCKET, STAY, NONE, 2, OPP_ROCKET, 5
	object_event  0,  2, SPRITE_COOLTRAINER_M, STAY, DOWN, 3 ; person
	object_event  0,  2, SPRITE_SUPER_NERD, WALK, UP_DOWN, 4 ; person
	object_event  0,  2, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, 5 ; person
	object_event  0,  2, SPRITE_GUARD, STAY, DOWN, 6 ; person
	object_event  0,  2, SPRITE_COOLTRAINER_F, STAY, LEFT, 7 ; person
	object_event  0,  2, SPRITE_MONSTER, STAY, DOWN, 8 ; person
	object_event  0,  2, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, 9 ; person
	object_event  0,  2, SPRITE_SUPER_NERD, STAY, DOWN, 10 ; person
	object_event  0,  2, SPRITE_GUARD, STAY, DOWN, 11 ; person

	def_warps_to CERULEAN_CITY
