DEF TILE_WIDTH EQU 8 ; pixels
DEF LEN_1BPP_TILE EQU 1 * TILE_WIDTH ; bytes
DEF LEN_2BPP_TILE EQU 2 * TILE_WIDTH ; bytes

DEF SCREEN_WIDTH  EQU 20
DEF SCREEN_HEIGHT EQU 18
DEF SCREEN_WIDTH_PX  EQU SCREEN_WIDTH  * TILE_WIDTH ; pixels
DEF SCREEN_HEIGHT_PX EQU SCREEN_HEIGHT * TILE_WIDTH ; pixels

DEF BG_MAP_WIDTH  EQU 32 ; tiles
DEF BG_MAP_HEIGHT EQU 32 ; tiles

DEF SPRITEBUFFERSIZE EQU 8 * 8 * LEN_1BPP_TILE

; HP bar
DEF HP_BAR_GREEN  EQU 0
DEF HP_BAR_YELLOW EQU 1
DEF HP_BAR_RED    EQU 2

; wShadowOAM
DEF NUM_SPRITE_OAM_STRUCTS EQU 40

; hAutoBGTransferEnabled
DEF TRANSFERTOP    EQU 0
DEF TRANSFERMIDDLE EQU 1
DEF TRANSFERBOTTOM EQU 2

; hRedrawRowOrColumnMode
DEF REDRAW_COL EQU 1
DEF REDRAW_ROW EQU 2

; tile list ids
; TileIDListPointerTable indexes (see data/tilemaps.asm)
	const_def
	const TILEMAP_MON_PIC
	const TILEMAP_SLIDE_DOWN_MON_PIC_7X5
	const TILEMAP_SLIDE_DOWN_MON_PIC_7X3
	const TILEMAP_GENGAR_INTRO_1
	const TILEMAP_GENGAR_INTRO_2
	const TILEMAP_GENGAR_INTRO_3
	const TILEMAP_GAME_BOY
	const TILEMAP_LINK_CABLE
DEF NUM_TILEMAPS EQU const_value
