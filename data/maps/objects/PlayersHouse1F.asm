PlayersHouse1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  7,  1, PLAYERS_HOUSE_2F, 1

	def_bg_events
	bg_event  4,  1, 3 ; PlayersHouse1FTVText

	def_object_events
	object_event  5,  4, SPRITE_MOM, STAY, LEFT, 1
	object_event  2,  4, SPRITE_BALDING_GUY, STAY, RIGHT, 2

	def_warps_to PLAYERS_HOUSE_1F
