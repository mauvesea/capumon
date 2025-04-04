PlayersHouse2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  1, PLAYERS_HOUSE_1F, 3

	def_bg_events

	def_object_events

	def_warps_to PLAYERS_HOUSE_2F
