; See constants/pokemon_data_constants.asm
; The max number of evolutions per monster is MAX_EVOLUTIONS

EvosMovesPointerTable:
	table_width 2, EvosMovesPointerTable
dw HariusaMEvosMoves
dw HariusaFEvosMoves
dw YaddonEvosMoves
dw GaruraEvosMoves
dw CyhornEvosMoves
dw BetbeterEvosMoves
dw BiridamaEvosMoves
dw GengarEvosMoves
dw FusigisoEvosMoves
dw MycorMEvosMoves
dw MycorFEvosMoves
dw TamatamaEvosMoves
dw BelingaEvosMoves
dw NassyEvosMoves
dw PipEvosMoves
dw GyaceEvosMoves
dw OmomEvosMoves
dw GagarthEvosMoves
dw MonjaraEvosMoves
dw OmegaEvosMoves
dw CairossEvosMoves
dw WingEvosMoves
dw StrikeEvosMoves
dw GyaradosEvosMoves
dw ShellderEvosMoves
dw KarakaraEvosMoves
dw AmblerEvosMoves
dw RapruthEvosMoves
dw GouthEvosMoves
dw KarabathEvosMoves
dw MimiEvosMoves
	assert_table_length NUM_POKEMON_INDEXES

HariusaMEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ATTACK
	db 1, DEFEND
	db 7, NEEDLEATK
	db 15, ROAR
	db 18, KICK
	db 24, SANDATTK
	db 27, BODYTCKL
	db 31, RUSH
	db 39, SLASH
	db 48, GUILLOT
	db 0

HariusaFEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ATTACK
	db 1, DEFEND
	db 7, NEEDLEATK
	db 15, ROAR
	db 18, KICK
	db 24, SANDATTK
	db 27, BODYTCKL
	db 31, RUSH
	db 39, SLASH
	db 48, GUILLOT
	db 0

YaddonEvosMoves:


GaruraEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ATTACK
	db 1, DEFEND
	db 7, PUNCH
	db 12, COMET_P
	db 20, FIRE_P
	db 21, ICE_P
	db 22, THNDR_P
	db 30, BODYSLAM
	db 34, MEGA_P
	db 38, UPPERCUT
	db 39, BARK
	db 44, TAILSTRK
	db 49, BYEBYEP
	db 0

CyhornEvosMoves:
BetbeterEvosMoves:
BiridamaEvosMoves:
GengarEvosMoves:
FusigisoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ATTACK
	db 1, DEFEND
	db 5, STRNSHOT
	db 9, ACID
	db 13, LICK
	db 20, FOCUS
	db 24, WALL
	db 28, E_SHOCK
	db 32, BODYSLAM
	db 37, GSTRACID
	db 40, HEADBUTT
	db 45, PARASTRK
	db 0

MycorMEvosMoves:
MycorFEvosMoves:
TamatamaEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ATTACK
	db 1, DEFEND
	db 6, LUNGE
	db 12, ACID
	db 19, GLARE
	db 25, BUBBLE
	db 34, WALL
	db 41, PWDRSNOW
	db 0

BelingaEvosMoves:
NassyEvosMoves:
PipEvosMoves:
GyaceEvosMoves:
OmomEvosMoves:
GagarthEvosMoves:
MonjaraEvosMoves:
OmegaEvosMoves:
CairossEvosMoves:
WingEvosMoves:
StrikeEvosMoves:
GyaradosEvosMoves:
ShellderEvosMoves:
KarakaraEvosMoves:
AmblerEvosMoves:
RapruthEvosMoves:
GouthEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ATTACK
	db 1, DEFEND
	db 8, ACID
	db 13, SCARE
	db 15, SANDATTK
	db 21, SANDSTRM
	db 30, ELEKITEL
	db 31, FIREBALL
	db 32, SNOWSTRM
	db 40, MEDITATE
	db 0

KarabathEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ATTACK
	db 1, DEFEND
	db 3, BUBBLE
	db 7, PWDRSNOW
	db 12, ACID
	db 15, BODYTCKL
	db 28, WATERGUN
	db 35, FOCUS
	db 41, BLIZZARD
	db 49, BODYSLAM
	db 0

MimiEvosMoves:
; Evolutions
	db 0
; Learnset
	db 1, ATTACK
	db 1, DEFEND
	db 3, BUBBLE
	db 7, PWDRSNOW
	db 12, ACID
	db 15, MEDITATE
	db 28, HYDROJET
	db 35, FOCUS
	db 41, BLIZZARD
	db 49, SLASH
	db 0
