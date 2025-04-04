MasaraTown_Object:
	db $6 ; border block

	def_warp_events
	warp_event  6,  5, PLAYERS_HOUSE_1F, 1
	warp_event 14,  5, BLUES_HOUSE, 1

	def_bg_events
	bg_event 11, 13, 3 ; MasaraTownText
	bg_event  7,  7, 4 ; MasaraPlayerHouseText
	bg_event 13,  7, 5 ; MasaraJuniorHouseText

	def_object_events
	object_event  6,  8, SPRITE_GIRL, WALK, ANY_DIR, 1 ; person
	object_event 13, 12, SPRITE_FISHER, WALK, ANY_DIR, 2 ; person

	def_warps_to MASARA_TOWN
