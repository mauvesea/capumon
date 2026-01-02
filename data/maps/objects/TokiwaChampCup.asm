TokiwaChampCup_Object:
	db $3 ; border block

	def_warp_events
	warp_event 12,  7, LAST_MAP, 5
	warp_event 13,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_COOLTRAINER_M, STAY, DOWN, 1, OPP_YUJIRO, 1 ; Yujiro
	object_event  7,  6, SPRITE_COOLTRAINER_M, STAY, DOWN, 3, OPP_COOLTRAINER_M, 9
	object_event 12,  1, SPRITE_GYM_GUIDE, STAY, DOWN, 4 ; person

;	object_event 10,  1, SPRITE_POKE_BALL, STAY, NONE, 11, REVIVE

	def_warps_to TOKIWA_CHAMP_CUP
