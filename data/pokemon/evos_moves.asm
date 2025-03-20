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
HariusaFEvosMoves:
YaddonEvosMoves:
GaruraEvosMoves:
CyhornEvosMoves:
BetbeterEvosMoves:
BiridamaEvosMoves:
GengarEvosMoves:
FusigisoEvosMoves:
MycorMEvosMoves:
MycorFEvosMoves:
TamatamaEvosMoves:
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
KarabathEvosMoves:
MimiEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, ROAR
	db 32, MEGA_PUNCH
	db 0
