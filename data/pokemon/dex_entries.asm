PokedexEntryPointers:
	table_width 2, PokedexEntryPointers
	dw HariusaMDexEntry
	dw HariusaFDexEntry
	dw YaddonDexEntry
	dw GaruraDexEntry
	dw CyhornDexEntry
	dw BetbeterDexEntry
	dw BiridamaDexEntry
	dw GengarDexEntry
	dw FusigisoDexEntry
	dw MycorMDexEntry
	dw MycorFDexEntry
	dw TamatamaDexEntry
	dw BelingaDexEntry
	dw NassyDexEntry
	dw PipDexEntry
	dw GyaceDexEntry
	dw OmomDexEntry
	dw GagarthDexEntry
	dw MonjaraDexEntry
	dw OmegaDexEntry
	dw CairossDexEntry
	dw WingDexEntry
	dw StrikeDexEntry
	dw GyaradosDexEntry
	dw ShellderDexEntry
	dw KarakaraDexEntry
	dw AmblerDexEntry
	dw RapruthDexEntry
	dw GouthDexEntry
	dw KarabathDexEntry
	dw MimiDexEntry

	assert_table_length NUM_POKEMON_INDEXES

; string: species name
; height in feet, inches
; weight in pounds
; text entry

HariusaMDexEntry:
	db "HARIUSA♂@"
	db 7
	dw 255
	text_far _HariusaMDexEntry
	text_end

HariusaFDexEntry:
	db "HARIUSA♀@"
	db 6
	dw 225
	text_far _HariusaFDexEntry
	text_end

YaddonDexEntry:
	db "YADDON@"
	db 13
	dw 1355
	text_far _YaddonDexEntry
	text_end

GaruraDexEntry:
	db "GARURA@"
	db 14
	dw 750
	text_far _GaruraDexEntry
	text_end

CyhornDexEntry:
	db "CYHORN@"
	db 19
	dw 2500
	text_far _CyhornDexEntry
	text_end

BetbeterDexEntry:
	db "BETBETER@"
	db 11
	dw 252
	text_far _BetbeterDexEntry
	text_end

BiridamaDexEntry:
	db "BIRIDAMA@"
	db 8
	dw 100
	text_far _BiridamaDexEntry
	text_end

GengarDexEntry:
	db "GENGAR@"
	db 14
	dw 900
	text_far _GengarDexEntry
	text_end

FusigisoDexEntry:
	db "FUSIGISO@"
	db 11
	dw 605
	text_far _FusigisoDexEntry
	text_end

MycorMDexEntry:
	db "MYCOR♂@"
	db 18
	dw 1300
	text_far _MycorMDexEntry
	text_end

MycorFDexEntry:
	db "MYCOR♀@"
	db 19
	dw 1275
	text_far _MycorFDexEntry
	text_end

TamatamaDexEntry:
	db "TAMATAMA@"
	db 3
	dw 75
	text_far _TamatamaDexEntry
	text_end

BelingaDexEntry:
	db "BELINGA@"
	db 10
	dw 800
	text_far _BelingaDexEntry
	text_end

NassyDexEntry:
	db "NASSY@"
	db 25
	dw 1605
	text_far _NassyDexEntry
	text_end

PipDexEntry:
	db "PIP@"
	db 7
	dw 20
	text_far _PipDexEntry
	text_end

GyaceDexEntry:
	db "GYACE@"
	db 21
	dw 2800
	text_far _GyaceDexEntry
	text_end

OmomDexEntry:
	db "OMOM@"
	db 6
	dw 15
	text_far _OmomDexEntry
	text_end

GagarthDexEntry:
	db "GAGARTH@"
	db 20
	dw 3100
	text_far _GagarthDexEntry
	text_end

MonjaraDexEntry:
	db "MONJARA@"
	db 8
	dw 25
	text_far _MonjaraDexEntry
	text_end

OmegaDexEntry:
	db "OMEGA@"
	db 23
	dw 5000
	text_far _OmegaDexEntry
	text_end

CairossDexEntry:
	db "CAIROSS@"
	db 14
	dw 885
	text_far _CairossDexEntry
	text_end

WingDexEntry:
	db "WING@"
	db 21
	dw 1400
	text_far _WingDexEntry
	text_end

StrikeDexEntry:
	db "STRIKE@"
	db 18
	dw 1705
	text_far _StrikeDexEntry
	text_end

GyaradosDexEntry:
	db "GYARADOS@"
	db 50
	dw 3850
	text_far _GyaradosDexEntry
	text_end

ShellderDexEntry:
	db "SHELLDER@"
	db 11
	dw 1950
	text_far _ShellderDexEntry
	text_end

KarakaraDexEntry:
	db "KARAKARA@"
	db 5
	dw 280
	text_far _KarakaraDexEntry
	text_end

AmblerDexEntry:
	db "AMBLER@"
	db 10
	dw 10
	text_far _AmblerDexEntry
	text_end

RapruthDexEntry:
	db "RAPRUTH@"
	db 25
	dw 3250
	text_far _RapruthDexEntry
	text_end

GouthDexEntry:
	db "GOUTH@"
	db 20
	dw 1
	text_far _GouthDexEntry
	text_end

KarabathDexEntry:
	db "KARABATH@"
	db 18
	dw 2950
	text_far _KarabathDexEntry
	text_end

MimiDexEntry:
	db "MIMI@"
	db 9
	dw 105
	text_far _MimiDexEntry
	text_end

NoneDexEntry:
	db "???@"
	db 10
	dw 1000
	text_far _NoneDexEntry
	text_end
