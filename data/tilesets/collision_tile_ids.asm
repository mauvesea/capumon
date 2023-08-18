MACRO coll_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db -1 ; end
ENDM

Underground_Coll::
	coll_tiles $0b, $0c, $13, $15, $18

Overworld_Coll::
	coll_tiles $02, $0B, $0C, $0D, $0E, $13, $18, $1B, $1C, $20, $21, $28, $48, $49, $58, $59

RedsHouse1_Coll::
RedsHouse2_Coll::
	coll_tiles $01, $02, $03, $11, $12, $13, $14, $1c, $1a, $55, $57

Mart_Coll::
Pokecenter_Coll::
	coll_tiles $00, $08, $10, $11, $18, $20, $21, $2d, $30, $31, $40, $41, $42, $43, $48, $49, $4a, $50, $51, $52, $53, $58, $59, $5a

Dojo_Coll::
Gym_Coll::
	coll_tiles $11, $16, $19, $2b, $3c, $3d, $3f, $4a, $4c, $4d, $03

Forest_Coll::
	coll_tiles $1e, $20, $2e, $30, $34, $37, $39, $3a, $40, $51, $52, $5a, $5c, $5e, $5f

House_Coll::
	coll_tiles $01, $12, $14, $28, $32, $37, $44, $54, $5c

ForestGate_Coll::
Museum_Coll::
Gate_Coll::
	coll_tiles $01, $12, $14, $1a, $1c, $37, $38, $3b, $3c, $5e

Ship_Coll::
	coll_tiles $04, $0d, $17, $1d, $1e, $23, $34, $37, $39, $4a

ShipPort_Coll::
	coll_tiles $0a, $1a, $32, $3b

Cemetery_Coll::
	coll_tiles $01, $10, $13, $1b, $22, $42, $52

Interior_Coll::
	coll_tiles $04, $0f, $15, $1f, $3b, $45, $47, $55, $56

Cavern_Coll::
	coll_tiles $05, $15, $18, $1a, $20, $21, $22, $2a, $2d, $30

	coll_tiles ; unused

Lobby_Coll::
	coll_tiles $14, $17, $1a, $1c, $20, $38, $45

Mansion_Coll::
	coll_tiles $01, $05, $11, $12, $14, $1a, $1c, $2c, $53

Lab_Coll::
	coll_tiles $0c, $26, $16, $1e, $34, $37

Club_Coll::
	coll_tiles $0f, $1a, $1f, $26, $28, $29, $2c, $2d, $2e, $2f, $41

Facility_Coll::
	coll_tiles $01, $10, $11, $13, $1b, $20, $21, $22, $30, $31, $32, $42, $43, $48, $52, $55, $58, $5e

Plateau_Coll::
	coll_tiles $1b, $23, $2c, $2d, $3b, $45
