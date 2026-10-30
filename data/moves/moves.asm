MACRO move
	db \1 ; animation (interchangeable with move id)
	db \2 ; effect
	db \3 ; power
	db \4 ; move class
	db \5 percent ; accuracy
	db \6 ; TP cost
ENDM

Moves::
	table_width MOVE_LENGTH, Moves
	move ATTACK       , NO_ADDITIONAL_EFFECT          ,  15, MOVE_REGULAR,  95,   0 ; ATTACK
	move DEFEND       , EFFECT_1E                     ,   0, MOVE_REGULAR, 100,   0 ; DEFEND
	move POUND        , NO_ADDITIONAL_EFFECT          ,  20, MOVE_REGULAR,  95,   5 ; POUND
	move PUNCH        , NO_ADDITIONAL_EFFECT          ,  25, MOVE_REGULAR,  95,   7 ; PUNCH
	move KARATE       , NO_ADDITIONAL_EFFECT          ,  30, MOVE_REGULAR,  90,  10 ; KARATE
	move DBL_SLAP     , ATTACK_TWICE_EFFECT           ,  20, MOVE_REGULAR,  90,  15 ; DBL-SLAP
	move COMET_P      , TWO_TO_FIVE_ATTACKS_EFFECT    ,  15, MOVE_REGULAR,  80,  30 ; COMET P.
	move MEGA_P       , NO_ADDITIONAL_EFFECT          ,  85, MOVE_REGULAR,  70,  45 ; MEGA P.
	move UPPERCUT     , NO_ADDITIONAL_EFFECT          ,  50, MOVE_REGULAR,  85,  40 ; UPPERCUT
	move BYEBYEP      , OHKO_EFFECT                   ,   0, MOVE_REGULAR,  30,  45 ; BYEBYEP.
	move FIRE_P       , BURN_SIDE_EFFECT1             ,  30, MOVE_REGULAR,  90,  20 ; FIRE P.
	move ICE_P        , FREEZE_SIDE_EFFECT            ,  30, MOVE_REGULAR,  90,  20 ; ICE P.
	move THNDR_P      , PARALYZE_SIDE_EFFECT1         ,  30, MOVE_REGULAR,  90,  20 ; THNDR P.
	move SCRATCH      , NO_ADDITIONAL_EFFECT          ,  25, MOVE_REGULAR,  95,   5 ; SCRATCH
	move VICEGRIP     , NO_ADDITIONAL_EFFECT          ,  30, MOVE_REGULAR,  95,   7 ; VICEGRIP
	move SLASH        , NO_ADDITIONAL_EFFECT          ,  60, MOVE_REGULAR,  95,  35 ; SLASH
	move GUILLOT      , OHKO_EFFECT                   ,   0, MOVE_REGULAR,  30,  45 ; GUILLOT.
	move PARASTRK     , PARALYZE_SIDE_EFFECT1         ,  30, MOVE_REGULAR,  95,  25 ; PARASTRK
	move KICK         , NO_ADDITIONAL_EFFECT          ,  25, MOVE_REGULAR, 100,   8 ; KICK
	move MEGA_K       , NO_ADDITIONAL_EFFECT          ,  95, MOVE_REGULAR,  85,  55 ; MEGA K.
	move FIRE_K       , BURN_SIDE_EFFECT1             ,  35, MOVE_REGULAR,  95,  27 ; FIRE K.
	move ICE_K        , FREEZE_SIDE_EFFECT            ,  35, MOVE_REGULAR,  95,  27 ; ICE K.
	move THNDR_K      , PARALYZE_SIDE_EFFECT1         ,  35, MOVE_REGULAR,  95,  27 ; THNDR K.
	move TAILSTRK     , NO_ADDITIONAL_EFFECT          ,  28, MOVE_REGULAR,  85,  10 ; TAILSTRK
	move TAILSLAM     , NO_ADDITIONAL_EFFECT          ,  48, MOVE_REGULAR,  85,  30 ; TAILSLAM
	move BODYTCKL     , NO_ADDITIONAL_EFFECT          ,  38, MOVE_REGULAR,  95,  14 ; BODYTCKL
	move BODYSLAM     , NO_ADDITIONAL_EFFECT          ,  58, MOVE_REGULAR,  95,  37 ; BODYSLAM
	move HEADBUTT     , NO_ADDITIONAL_EFFECT          ,  45, MOVE_REGULAR,  85,  27 ; HEADBUTT
	move EMBER        , BURN_SIDE_EFFECT1             ,  30, MOVE_SPECIAL,  90,  30 ; EMBER
	move FIREBALL     , BURN_SIDE_EFFECT1             ,  45, MOVE_SPECIAL,  90,  37 ; FIREBALL
	move MEGAFIRE     , BURN_SIDE_EFFECT1             ,  75, MOVE_SPECIAL,  90,  42 ; MEGAFIRE
	move FLMTHRWR     , BURN_SIDE_EFFECT1             ,  50, MOVE_SPECIAL,  95,  47 ; FLMTHRWR
	move PWDRSNOW     , FREEZE_SIDE_EFFECT            ,  30, MOVE_SPECIAL,  90,  30 ; PWDRSNOW
	move SNOWSTRM     , FREEZE_SIDE_EFFECT            ,  45, MOVE_SPECIAL,  90,  37 ; SNOWSTRM
	move BLIZZARD     , FREEZE_SIDE_EFFECT            ,  75, MOVE_SPECIAL,  90,  42 ; BLIZZARD
	move ICE_BEAM     , FREEZE_SIDE_EFFECT            ,  50, MOVE_SPECIAL,  95,  47 ; ICE BEAM
	move E_SHOCK      , PARALYZE_SIDE_EFFECT1         ,  30, MOVE_SPECIAL,  90,  30 ; E. SHOCK
	move ELEKITEL     , PARALYZE_SIDE_EFFECT1         ,  45, MOVE_SPECIAL,  90,  37 ; ELEKITEL
	move VOLT_50K     , PARALYZE_SIDE_EFFECT1         ,  75, MOVE_SPECIAL,  90,  42 ; 50K VOLT
	move THNDBOLT     , PARALYZE_SIDE_EFFECT1         ,  50, MOVE_SPECIAL,  95,  47 ; THNDBOLT
	move BUBBLE       , EFFECT_01                     ,  32, MOVE_SPECIAL,  90,  27 ; BUBBLE
	move WATERGUN     , EFFECT_01                     ,  78, MOVE_SPECIAL,  90,  39 ; WATERGUN
	move HYDROJET     , EFFECT_01                     ,  78, MOVE_SPECIAL,  90,  39 ; HYDROJET
	move GSTRACID     , POISON_SIDE_EFFECT1           ,  28, MOVE_REGULAR,  85,  25 ; GSTRACID
	move ACID         , POISON_SIDE_EFFECT1           ,  35, MOVE_REGULAR,  85,  28 ; ACID
	move BITE         , POISON_SIDE_EFFECT1           ,  37, MOVE_REGULAR,  90,  32 ; BITE
	move PECK         , NO_ADDITIONAL_EFFECT          ,  18, MOVE_REGULAR,  85,  10 ; PECK
	move LUNGE        , TWO_TO_FIVE_ATTACKS_EFFECT    ,   5, MOVE_REGULAR,  85,   7 ; LUNGE
	move LICK         , EFFECT_01                     ,  10, MOVE_REGULAR,  90,   8 ; LICK
	move BARK         , ATTACK_UP1_EFFECT             ,   0, MOVE_REGULAR, 100,  13 ; BARK
	move WALL         , DEFENSE_UP1_EFFECT            ,   0, MOVE_REGULAR, 100,  14 ; WALL
	move RUSH         , SPEED_UP1_EFFECT              ,   0, MOVE_REGULAR, 100,  12 ; RUSH
	move MEDITATE     , SPECIAL_UP1_EFFECT            ,   0, MOVE_REGULAR, 100,  13 ; MEDITATE
	move CHARM        , ATTACK_DOWN1_EFFECT           ,   0, MOVE_REGULAR,  75,  13 ; CHARM
	move GLARE        , DEFENSE_DOWN1_EFFECT          ,   0, MOVE_REGULAR,  75,  14 ; GLARE
	move STRNSHOT     , SPEED_DOWN1_EFFECT            ,   0, MOVE_REGULAR,  75,  12 ; STRNSHOT
	move SCARE        , SPECIAL_DOWN1_EFFECT          ,   0, MOVE_REGULAR,  75,  13 ; SCARE
	move METRNOME     , METRONOME_EFFECT              ,   0, MOVE_REGULAR, 100,  20 ; METRNOME
	move NEEDLEATK    , POISON_SIDE_EFFECT1           ,  12, MOVE_REGULAR,  95,   8 ; NEEDLEATK
	move HYPRBEAM     , HYPER_BEAM_EFFECT             , 100, MOVE_SPECIAL, 100,  50 ; HYPRBEAM
	move SANDATTK     , ACCURACY_DOWN1_EFFECT         ,   0, MOVE_REGULAR,  75,  15 ; SANDATTK
	move SANDSTRM     , ACCURACY_DOWN_SIDE_EFFECT     ,  25, MOVE_REGULAR,  95,  12 ; SANDSTRM
	move EARTHQK      , ACCURACY_DOWN_SIDE_EFFECT     ,  48, MOVE_REGULAR, 100,  27 ; EARTHQK
	move FOCUS        , ACCURACY_UP1_EFFECT           ,   0, MOVE_REGULAR, 100,  15 ; FOCUS
	move WHIRLWIND    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move FLY          , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move BIND         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move VINE_WHIP    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DOUBLE_KICK  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SAND_ATTACK  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move WRAP         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move TAKE_DOWN    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DOUBLE_EDGE  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move TAIL_WHIP    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move TWINEEDLE    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move PIN_MISSILE  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move LEER         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move ROAR         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SING         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SUPERSONIC   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SONICBOOM    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DISABLE      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move MIST         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SURF         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move PSYBEAM      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DRILL_PECK   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SUBMISSION   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move COUNTER      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SEISMIC_TOSS , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move STRENGTH     , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move ABSORB       , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move MEGA_DRAIN   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move LEECH_SEED   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move GROWTH       , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move RAZOR_LEAF   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SOLARBEAM    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move POISONPOWDER , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move STUN_SPORE   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SLEEP_POWDER , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move PETAL_DANCE  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DRAGON_RAGE  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move ROCK_THROW   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move EARTHQUAKE   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move FISSURE      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DIG          , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move TOXIC        , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move CONFUSION    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move PSYCHIC_M    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move HYPNOSIS     , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move QUICK_ATTACK , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move RAGE         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move TELEPORT     , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move NIGHT_SHADE  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move MIMIC        , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DOUBLE_TEAM  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move RECOVER      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move MINIMIZE     , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SMOKESCREEN  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move CONFUSE_RAY  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move WITHDRAW     , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DEFENSE_CURL , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move BARRIER      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move LIGHT_SCREEN , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move HAZE         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move REFLECT      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move FOCUS_ENERGY , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move BIDE         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move MIRROR_MOVE  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SELFDESTRUCT , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move EGG_BOMB     , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SLUDGE       , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move BONE_CLUB    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move WATERFALL    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move CLAMP        , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SKULL_BASH   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SPIKE_CANNON , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move CONSTRICT    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move AMNESIA      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SOFTBOILED   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DREAM_EATER  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move POISON_GAS   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move BARRAGE      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move LEECH_LIFE   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move LOVELY_KISS  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SKY_ATTACK   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move TRANSFORM    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move DIZZY_PUNCH  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SPORE        , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move FLASH        , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move PSYWAVE      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SPLASH       , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move ACID_ARMOR   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move CRABHAMMER   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move EXPLOSION    , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move FURY_SWIPES  , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move BONEMERANG   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move REST         , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move ROCK_SLIDE   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move HYPER_FANG   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SHARPEN      , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move CONVERSION   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move TRI_ATTACK   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SUPER_FANG   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move SUBSTITUTE   , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	move STRUGGLE     , NO_ADDITIONAL_EFFECT,             0, MOVE_REGULAR, 100, 0 ; unused
	assert_table_length NUM_ATTACKS
