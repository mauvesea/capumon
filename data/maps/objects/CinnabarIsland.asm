CinnabarIsland_Object:
	db $43 ; border block

	def_warp_events
	warp_event  6,  7, POKEMON_MANSION_1F, 2
	warp_event 14,  7, CINNABAR_GYM, 1
	warp_event  2,  2, CINNABAR_LAB, 1
	warp_event  8, 13, CINNABAR_POKECENTER, 1
	warp_event 14, 13, CINNABAR_MART, 1

	def_bg_events
	bg_event  2,  2, 3 ; CinnabarIslandText3
	bg_event 13, 13, 4 ; MartSignText
	bg_event  7, 13, 5 ; PokeCenterSignText
	bg_event  2,  2, 6 ; CinnabarIslandText6
	bg_event  2,  2, 7 ; CinnabarIslandText7

	def_object_events
	object_event 10, 14, SPRITE_GIRL, WALK, LEFT_RIGHT, 1 ; person
	object_event 15,  8, SPRITE_GAMBLER, STAY, NONE, 2 ; person

	def_warps_to CINNABAR_ISLAND
