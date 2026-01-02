TrainerDataPointers:
	dw YoungsterData
	dw BugCatcherData
	dw LassData
	dw SailorData
	dw JrTrainerMData
	dw JrTrainerFData
	dw PokemaniacData
	dw SuperNerdData
	dw HikerData
	dw BikerData
	dw BurglarData
	dw EngineerData
	dw UnusedJugglerData
	dw FisherData
	dw SwimmerData
	dw CueBallData
	dw GamblerData
	dw BeautyData
	dw PsychicData
	dw RockerData
	dw JugglerData
	dw TamerData
	dw BirdKeeperData
	dw BlackbeltData
	dw Green1Data
	dw ProfOakData
	dw ChiefData
	dw ScientistData
	dw GiovanniData
	dw RocketData
	dw CooltrainerMData
	dw CooltrainerFData
	dw YujiroData
	dw BrockData
	dw MistyData
	dw LtSurgeData
	dw ErikaData
	dw KogaData
	dw BlaineData
	dw SabrinaData
	dw GentlemanData
	dw Green2Data
	dw Green3Data
	dw LoreleiData
	dw ChannelerData
	dw AgathaData
	dw LanceData

; if first byte != $FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == $FF, then
	; first byte is $FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData:
; Route 3
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Mt. Moon 1F
	db 5, OMEGA, 0
; Route 24
	db 5, OMEGA, 0
; Route 25
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; SS Anne 1F Rooms
	db 5, OMEGA, 0
; Route 11
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0

BugCatcherData:
; Viridian Forest
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 3
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Mt. Moon 1F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 24
	db 5, OMEGA, 0
; Route 6
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Route 9
	db 5, OMEGA, 0
	db 5, OMEGA, 0

LassData:
; Route 3
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 4
	db 5, OMEGA, 0
; Mt. Moon 1F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 24
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 25
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; SS Anne 1F Rooms
	db 5, OMEGA, 0
; SS Anne 2F Rooms
	db 5, OMEGA, 0
; Route 8
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Celadon Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0

SailorData:
; SS Anne Stern
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; SS Anne B1F Rooms
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Vermilion Gym
	db 5, OMEGA, 0

JrTrainerMData:
; Pewter Gym
	db 5, OMEGA, 0
; Route 24/Route 25
	db 5, OMEGA, 0
; Route 24
	db 5, OMEGA, 0
; Route 6
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Route 9
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 12
	db 5, OMEGA, 0

JrTrainerFData:
; Cerulean Gym
	db 5, OMEGA, 0
; Route 6
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Route 9
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 10
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Rock Tunnel B1F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Celadon Gym
	db 5, OMEGA, 0
; Route 13
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 20
	db 5, OMEGA, 0
; Rock Tunnel 1F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 15
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 20
	db 5, OMEGA, 0

PokemaniacData:
; Route 10
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Rock Tunnel B1F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Victory Road 2F
	db 5, OMEGA, 0
; Rock Tunnel 1F
	db 5, OMEGA, 0

SuperNerdData:
; Mt. Moon 1F
	db 5, OMEGA, 0
; Mt. Moon B2F
	db 5, OMEGA, 0
; Route 8
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Cinnabar Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

HikerData:
; Mt. Moon 1F
	db 5, OMEGA, 0
; Route 25
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 9
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 10
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Rock Tunnel B1F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 9/Rock Tunnel B1F
	db 5, OMEGA, 0
; Rock Tunnel 1F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

BikerData:
; Route 13
	db 5, OMEGA, 0
; Route 14
	db 5, OMEGA, 0
; Route 15
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 16
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 17
	; From https://www.smogon.com/smog/issue27/glitch:
	; 0E:5FC2 is offset of the ending 0 for this first Biker on Route 17.
	; BaseStats + (BASE_DATA_SIZE) * (000 - 1) = $5FC2;
	; that's the formula from GetMonHeader for the base stats of mon #000.
	; (BaseStats = $43DE and BANK(BaseStats) = $0E.)
	; Finally, PokedexOrder lists 0 as the dex ID for every MissingNo.
	; The result is that this data gets interpreted as the base stats
	; for MissingNo: 0, 33, MUK, 0, 29, VOLTORB, VOLTORB, 0, ..., 28, GRIMER, GRIMER.
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 14
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

BurglarData:
; Unused
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Cinnabar Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Mansion 2F
	db 5, OMEGA, 0
; Mansion 3F
	db 5, OMEGA, 0
; Mansion B1F
	db 5, OMEGA, 0

EngineerData:
; Unused
	db 5, OMEGA, 0
; Route 11
	db 5, OMEGA, 0
	db 5, OMEGA, 0

UnusedJugglerData:
; none

FisherData:
; SS Anne 2F Rooms
	db 5, OMEGA, 0
; SS Anne B1F Rooms
	db 5, OMEGA, 0
; Route 12
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 21
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 12
	db 5, OMEGA, 0

SwimmerData:
; Cerulean Gym
	db 5, OMEGA, 0
; Route 19
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 20
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 21
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

CueBallData:
; Route 16
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 17
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 21
	db 5, OMEGA, 0

GamblerData:
; Route 11
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 8
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Route 8
	db 5, OMEGA, 0

BeautyData:
; Celadon Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 13
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 20
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 15
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Route 19
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 20
	db 5, OMEGA, 0

PsychicData:
; Saffron Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

RockerData:
; Vermilion Gym
	db 5, OMEGA, 0
; Route 12
	db 5, OMEGA, 0

JugglerData:
; Silph Co. 5F
	db 5, OMEGA, 0
; Victory Road 2F
	db 5, OMEGA, 0
; Fuchsia Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Victory Road 2F
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Fuchsia Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0

TamerData:
; Fuchsia Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Viridian Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Victory Road 2F
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0

BirdKeeperData:
; Route 13
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 14
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 15
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 18
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 20
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 14
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

BlackbeltData:
; Fighting Dojo
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Viridian Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Victory Road 2F
	db 5, OMEGA, 0

Green1Data:
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 22
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Cerulean City
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

ProfOakData:
; Unused
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

ChiefData:
; none

ScientistData:
; Unused
	db 5, OMEGA, 0
; Silph Co. 2F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 3F/Mansion 1F
	db 5, OMEGA, 0
; Silph Co. 4F
	db 5, OMEGA, 0
; Silph Co. 5F
	db 5, OMEGA, 0
; Silph Co. 6F
	db 5, OMEGA, 0
; Silph Co. 7F
	db 5, OMEGA, 0
; Silph Co. 8F
	db 5, OMEGA, 0
; Silph Co. 9F
	db 5, OMEGA, 0
; Silph Co. 10F
	db 5, OMEGA, 0
; Mansion 3F
	db 5, OMEGA, 0
; Mansion B1F
	db 5, OMEGA, 0

GiovanniData:
; Rocket Hideout B4F
	db 5, OMEGA, 0
; Silph Co. 11F
	db 5, OMEGA, 0
; Viridian Gym
	db 5, OMEGA, 0

RocketData:
; Mt. Moon B2F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Cerulean City
	db 5, OMEGA, 0
; Route 24
	db 5, OMEGA, 0
; Game Corner
	db 5, OMEGA, 0
; Rocket Hideout B1F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Rocket Hideout B2F
	db 5, OMEGA, 0
; Rocket Hideout B3F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Rocket Hideout B4F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Pokémon Tower 7F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Silph Co. 2F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 3F
	db 5, OMEGA, 0
; Silph Co. 4F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 5F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 6F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 7F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 8F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 9F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 10F
	db 5, OMEGA, 0
; Silph Co. 11F
	db 5, OMEGA, 0
	db 5, OMEGA, 0

CooltrainerMData:
; Viridian Gym
	db 5, OMEGA, 0
; Victory Road 3F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Victory Road 1F
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Viridian Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0

CooltrainerFData:
; Celadon Gym
	db 5, OMEGA, 0
; Victory Road 3F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Victory Road 1F
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

YujiroData:
	db $FF, 8, OMOM, 10, BELINGA, 0

BrockData:
	db 5, OMEGA, 0

MistyData:
	db 5, OMEGA, 0

LtSurgeData:
	db 5, OMEGA, 0

ErikaData:
	db 5, OMEGA, 0

KogaData:
	db 5, OMEGA, 0

BlaineData:
	db 5, OMEGA, 0

SabrinaData:
	db 5, OMEGA, 0

GentlemanData:
; SS Anne 1F Rooms
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; SS Anne 2F Rooms/Vermilion Gym
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; SS Anne 2F Rooms
	db 5, OMEGA, 0

Green2Data:
; SS Anne 2F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Pokémon Tower 2F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Silph Co. 7F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Route 22
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

Green3Data:
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

LoreleiData:
	db 5, OMEGA, 0

ChannelerData:
; Unused
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Pokémon Tower 3F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Pokémon Tower 3F
	db 5, OMEGA, 0
; Pokémon Tower 4F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Pokémon Tower 4F
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Pokémon Tower 5F
	db 5, OMEGA, 0
; Unused
	db 5, OMEGA, 0
; Pokémon Tower 5F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Pokémon Tower 6F
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0
; Saffron Gym
	db 5, OMEGA, 0
	db 5, OMEGA, 0
	db 5, OMEGA, 0

AgathaData:
	db 5, OMEGA, 0

LanceData:
	db 5, OMEGA, 0
