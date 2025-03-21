MACRO tile_ids
	dw \1
	dn \3, \2
ENDM

TileIDListPointerTable:
; entries correspond to TILEMAP_* constants (see constants/gfx_constants.asm)
	table_width 3, TileIDListPointerTable
	; tilemap pointer, width, height
	tile_ids MonTiles,               8,  8
	tile_ids SlideDownMonTiles_7x5,  8,  5
	tile_ids SlideDownMonTiles_7x3,  8,  3
	tile_ids GengarIntroTiles1,      7,  7
	tile_ids GengarIntroTiles2,      7,  7
	tile_ids GengarIntroTiles3,      7,  7
	tile_ids GameBoyTiles,           6,  8
	tile_ids LinkCableTiles,        12,  3
	tile_ids MonTilesFlipped,        8,  8
	assert_table_length NUM_TILEMAPS

DownscaledMonTiles_5x5:
	INCBIN "gfx/monsters/tilemaps/downscaled_5x5.tilemap"

DownscaledMonTiles_3x3:
	INCBIN "gfx/monsters/tilemaps/downscaled_3x3.tilemap"

MonTiles:
	INCBIN "gfx/monsters/tilemaps/front.tilemap"

MonTilesFlipped:
	INCBIN "gfx/monsters/tilemaps/flipped.tilemap"

SlideDownMonTiles_7x5:
	INCBIN "gfx/monsters/tilemaps/slide_down_7x5.tilemap"

SlideDownMonTiles_7x3:
	INCBIN "gfx/monsters/tilemaps/slide_down_7x3.tilemap"

GengarIntroTiles1:
	INCBIN "gfx/intro/gengar_1.tilemap"

GengarIntroTiles2:
	INCBIN "gfx/intro/gengar_2.tilemap"

GengarIntroTiles3:
	INCBIN "gfx/intro/gengar_3.tilemap"

GameBoyTiles:
	INCBIN "gfx/trade/game_boy.tilemap"

LinkCableTiles:
	INCBIN "gfx/trade/link_cable.tilemap"
