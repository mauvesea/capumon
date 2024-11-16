TypeNames:
	table_width 2, TypeNames

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bird
	dw .Bug
	dw .Ghost

REPT UNUSED_TYPES_END - UNUSED_TYPES
	dw .Normal
ENDR

	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon

	dw .HariusagiM
	dw .HariusagiF
	dw .Yaddon
	dw .Garura
	dw .Cyhorn
	dw .Bettobeter
	dw .Biriridama
	dw .Gengar
	dw .Fushigiso
	dw .MycorM
	dw .MycorF
	dw .Tamatama
	dw .Beloringa
	dw .Nasshii
	dw .Pip
	dw .Gyace
	dw .Omom
	dw .Gagarth
	dw .Monjara
	dw .Omega
	dw .Caiross
	dw .Wing
	dw .Strike
	dw .Gyaradoss
	dw .Shellder
	dw .Karakara
	dw .Ambler
	dw .Rapruth
	dw .Gouth
	dw .Karabatheo
	dw .Mimi

	assert_table_length NUM_TYPES

.Normal:   db "NORMAL@"
.Fighting: db "FIGHTING@"
.Flying:   db "FLYING@"
.Poison:   db "POISON@"
.Fire:     db "FIRE@"
.Water:    db "WATER@"
.Grass:    db "GRASS@"
.Electric: db "ELECTRIC@"
.Psychic:  db "PSYCHIC@"
.Ice:      db "ICE@"
.Ground:   db "GROUND@"
.Rock:     db "ROCK@"
.Bird:     db "BIRD@"
.Bug:      db "BUG@"
.Ghost:    db "GHOST@"
.Dragon:   db "DRAGON@"

.HariusagiM: db "---@"
.HariusagiF: db "---@"
.Yaddon: db "OOO@"
.Garura: db "---@"
.Cyhorn: db "---@"
.Bettobeter: db "XXX@"
.Biriridama: db "XX-@"
.Gengar: db "XXX@"
.Fushigiso: db "X-X@"
.MycorM: db "---@"
.MycorF: db "---@"
.Tamatama: db "XOO@"
.Beloringa: db "---@"
.Nasshii: db "XOO@"
.Pip: db "-X-@"
.Gyace: db "XXX@"
.Omom: db "-XX@"
.Gagarth: db "XXX@"
.Monjara: db "X-X@"
.Omega: db "OOO@"
.Caiross: db "X--@"
.Wing: db "O--@"
.Strike: db "-O-@"
.Gyaradoss: db "--O@"
.Shellder: db "OXO@"
.Karakara: db "---@"
.Ambler: db "XXX@"
.Rapruth: db "XXO@"
.Gouth: db "X--@"
.Karabatheo: db "OXO@"
.Mimi: db "OXO@"
