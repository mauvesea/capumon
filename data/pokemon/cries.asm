MACRO mon_cry
	db (\1 - CRY_SFX_START) / 3
	db \2, \3
ENDM

CryData::
	table_width 3, CryData
	; base cry, pitch, length
	mon_cry SFX_CRY_11, $00, $80 ; GAGARTH ;
	mon_cry SFX_CRY_03, $00, $80 ; GARURA ;
	mon_cry SFX_CRY_00, $00, $80 ; HARISAGI ;
	mon_cry SFX_CRY_0E, $00, $80 ; PIP ;
	mon_cry SFX_CRY_10, $00, $80 ; OMOM ;
	mon_cry SFX_CRY_06, $00, $80 ; BIRIDAMA ;
	mon_cry SFX_CRY_09, $00, $80 ; MYCOR ;
	mon_cry SFX_CRY_02, $00, $80 ; YADDON ;
	mon_cry SFX_CRY_08, $00, $80 ; FUSIGISO ;
	mon_cry SFX_CRY_0D, $00, $80 ; NASSY ;
	mon_cry SFX_CRY_0C, $00, $80 ; BELINGA ;
	mon_cry SFX_CRY_0B, $00, $80 ; TAMATAMA ;
	mon_cry SFX_CRY_05, $00, $80 ; BETBETER ;
	mon_cry SFX_CRY_07, $00, $80 ; GENGAR ;
	mon_cry SFX_CRY_01, $00, $80 ; HARISAGI ;
	mon_cry SFX_CRY_0A, $00, $80 ; MYCOR ;
	mon_cry SFX_CRY_19, $00, $80 ; KARAKARA ;
	mon_cry SFX_CRY_04, $00, $80 ; CYHORN ;
	mon_cry SFX_CRY_1B, $00, $80 ; RAPRUTH ;
	mon_cry SFX_CRY_15, $00, $80 ; WING ;
	mon_cry SFX_CRY_1E, $00, $80 ; UNKNOWN ????
	mon_cry SFX_CRY_17, $00, $80 ; GYARADOS ;
	mon_cry SFX_CRY_18, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1A, $00, $80 ; AMBLER ;
	mon_cry SFX_CRY_1C, $00, $80 ; GOUTH ;
	mon_cry SFX_CRY_16, $00, $80 ; STRIKE ;
	mon_cry SFX_CRY_1E, $00, $80 ; MIMI ;
	mon_cry SFX_CRY_1D, $00, $80 ; KARABATH ;
	mon_cry SFX_CRY_14, $00, $80 ; CAIROSS ;
	mon_cry SFX_CRY_12, $00, $80 ; MONJARA ;
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_17, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_18, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_02, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_24, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_14, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_20, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_12, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_17, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_21, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_12, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_04, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_06, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_12, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0B, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_10, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0B, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_09, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_09, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_18, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_19, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_20, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_22, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_24, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_24, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_09, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_16, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_18, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_19, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_19, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_17, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_15, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_13, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_13, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0B, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0B, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_16, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_16, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_11, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_21, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_05, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_17, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_07, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0F, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_20, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_18, $00, $80 ; SHELLDER
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_06, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_19, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_12, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_19, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_08, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_14, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_14, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1E, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_0F, $00, $80 ; GYACE
	mon_cry SFX_CRY_13, $00, $80 ; OMEGA
	mon_cry SFX_CRY_1A, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_16, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_16, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_25, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_25, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_22, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_22, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_01, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_24, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_25, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_23, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1C, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_04, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_04, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_04, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_1D, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_00, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_08, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_08, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_23, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_21, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_25, $00, $80 ; UNKNOWN
	mon_cry SFX_CRY_25, $00, $80 ; UNKNOWN
	assert_table_length NUM_POKEMON_INDEXES
