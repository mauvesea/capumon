; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - AttackAnimationPointers (see data/moves/animations.asm)
; - MoveSoundTable (see data/moves/sfx.asm)
	const_def
	const NO_MOVE       ; 00
	const ATTACK        ; 01
	const DEFEND        ; 02
	const POUND         ; 03
	const PUNCH         ; 04
	const KARATE        ; 05
	const DBL_SLAP      ; 06
	const COMET_P       ; 07
	const MEGA_P        ; 08
	const UPPERCUT      ; 09
	const BYEBYEP       ; 0a
	const FIRE_P        ; 0b
	const ICE_P         ; 0c
	const THNDR_P       ; 0d
	const SCRATCH       ; 0e
	const VICEGRIP      ; 0f
	const SLASH         ; 10
	const GUILLOT       ; 11
	const PARASTRK      ; 12
	const KICK          ; 13
	const MEGA_K        ; 14
	const FIRE_K        ; 15
	const ICE_K         ; 16
	const THNDR_K       ; 17
	const TAILSTRK      ; 18
	const TAILSLAM      ; 19
	const BODYTCKL      ; 1a
	const BODYSLAM      ; 1b
	const HEADBUTT      ; 1c
	const EMBER         ; 1d
	const FIREBALL      ; 1e
	const MEGAFIRE      ; 1f
	const FLMTHRWR      ; 20
	const PWDRSNOW      ; 21
	const SNOWSTRM      ; 22
	const BLIZZARD      ; 23
	const ICE_BEAM      ; 24
	const E_SHOCK       ; 25
	const ELEKITEL      ; 26
	const VOLT_50K      ; 27
	const THNDBOLT      ; 28
	const BUBBLE        ; 29
	const WATERGUN      ; 2a
	const HYDROJET      ; 2b
	const GSTRACID      ; 2c
	const ACID          ; 2d
	const BITE          ; 2e
	const PECK          ; 2f
	const LUNGE         ; 30
	const LICK          ; 31
	const BARK          ; 32
	const WALL          ; 33
	const RUSH          ; 34
	const MEDITATE      ; 35
	const CHARM         ; 36
	const GLARE         ; 37
	const STRNSHOT      ; 38
	const SCARE         ; 39
	const METRNOME      ; 3a
	const NEEDLEATK     ; 3b
	const HYPRBEAM      ; 3c
	const SANDATTK      ; 3d
	const SANDSTRM      ; 3e
	const EARTHQK       ; 3f
	const FOCUS         ; 40
	const WHIRLWIND     ; 41
	const FLY           ; 42
	const BIND          ; 43
	const VINE_WHIP     ; 44
	const DOUBLE_KICK   ; 45
	const SAND_ATTACK   ; 46
	const WRAP          ; 47
	const TAKE_DOWN     ; 48
	const DOUBLE_EDGE   ; 49
	const TAIL_WHIP     ; 4a
	const TWINEEDLE     ; 4b
	const PIN_MISSILE   ; 4c
	const LEER          ; 4d
	const ROAR          ; 4e
	const SING          ; 4f
	const SUPERSONIC    ; 50
	const SONICBOOM     ; 51
	const DISABLE       ; 52
	const MIST          ; 53
	const SURF          ; 54
	const PSYBEAM       ; 55
	const DRILL_PECK    ; 56
	const SUBMISSION    ; 57
	const COUNTER       ; 58
	const SEISMIC_TOSS  ; 59
	const STRENGTH      ; 5a
	const ABSORB        ; 5b
	const MEGA_DRAIN    ; 5c
	const LEECH_SEED    ; 5d
	const GROWTH        ; 5e
	const RAZOR_LEAF    ; 5f
	const SOLARBEAM     ; 60
	const POISONPOWDER  ; 61
	const STUN_SPORE    ; 62
	const SLEEP_POWDER  ; 63
	const PETAL_DANCE   ; 64
	const DRAGON_RAGE   ; 65
	const ROCK_THROW    ; 66
	const EARTHQUAKE    ; 67
	const FISSURE       ; 68
	const DIG           ; 69
	const TOXIC         ; 6a
	const CONFUSION     ; 6b
	const PSYCHIC_M     ; 6c
	const HYPNOSIS      ; 6d
	const QUICK_ATTACK  ; 6e
	const RAGE          ; 6f
	const TELEPORT      ; 70
	const NIGHT_SHADE   ; 71
	const MIMIC         ; 72
	const DOUBLE_TEAM   ; 73
	const RECOVER       ; 74
	const MINIMIZE      ; 75
	const SMOKESCREEN   ; 76
	const CONFUSE_RAY   ; 77
	const WITHDRAW      ; 78
	const DEFENSE_CURL  ; 79
	const BARRIER       ; 7a
	const LIGHT_SCREEN  ; 7b
	const HAZE          ; 7c
	const REFLECT       ; 7d
	const FOCUS_ENERGY  ; 7e
	const BIDE          ; 7f
	const MIRROR_MOVE   ; 80
	const SELFDESTRUCT  ; 81
	const EGG_BOMB      ; 82
	const SLUDGE        ; 83
	const BONE_CLUB     ; 84
	const WATERFALL     ; 85
	const CLAMP         ; 86
	const SKULL_BASH    ; 87
	const SPIKE_CANNON  ; 88
	const CONSTRICT     ; 89
	const AMNESIA       ; 8a
	const SOFTBOILED    ; 8b
	const DREAM_EATER   ; 8c
	const POISON_GAS    ; 8d
	const BARRAGE       ; 8e
	const LEECH_LIFE    ; 8f
	const LOVELY_KISS   ; 90
	const SKY_ATTACK    ; 91
	const TRANSFORM     ; 92
	const DIZZY_PUNCH   ; 93
	const SPORE         ; 94
	const FLASH         ; 95
	const PSYWAVE       ; 96
	const SPLASH        ; 97
	const ACID_ARMOR    ; 98
	const CRABHAMMER    ; 99
	const EXPLOSION     ; 9a
	const FURY_SWIPES   ; 9b
	const BONEMERANG    ; 9c
	const REST          ; 9d
	const ROCK_SLIDE    ; 9e
	const HYPER_FANG    ; 9f
	const SHARPEN       ; a0
	const CONVERSION    ; a1
	const TRI_ATTACK    ; a2
	const SUPER_FANG    ; a3
	const SUBSTITUTE    ; a4
	const STRUGGLE      ; a5
DEF NUM_ATTACKS EQU const_value - 1

	; Moves do double duty as animation identifiers.

	const SHOWPIC_ANIM
	const STATUS_AFFECTED_ANIM
	const ANIM_A8
	const ANIM_A9
	const TRADE_BALL_DROP_ANIM
	const TRADE_BALL_SHAKE_ANIM
	const TRADE_BALL_TILT_ANIM
	const TRADE_BALL_POOF_ANIM
	const XSTATITEM_ANIM ; use X Attack/Defense/Speed/Special
	const ANIM_AF
	const ANIM_B0
	const ANIM_B1
	const ANIM_B2
	const ANIM_B3
	const ANIM_B4
	const ANIM_B5
	const ANIM_B6
	const ANIM_B7
	const ANIM_B8
	const ANIM_B9
	const BURN_PSN_ANIM ; Plays when a monster is burned or poisoned
	const ANIM_BB
	const ANIM_BC
	const SLP_ANIM ; sleeping monster
	const ANIM_BE
	const CONF_ANIM ; confused monster
	const ANIM_C0
	const TOSS_ANIM ; toss Poké Ball
	const SHAKE_ANIM ; shaking Poké Ball when catching monster
	const POOF_ANIM ; puff of smoke
	const BLOCKBALL_ANIM ; trainer knocks away Poké Ball
	const GREATTOSS_ANIM ; toss Great Ball
	const ULTRATOSS_ANIM ; toss Ultra Ball or Master Ball
	const ANIM_C7
	const HIDEPIC_ANIM ; monster disappears
	const ROCK_ANIM ; throw rock
	const BAIT_ANIM ; throw bait

DEF NUM_ATTACK_ANIMS EQU const_value - 1
