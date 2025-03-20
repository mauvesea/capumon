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
	db 10
	dw 1000
	text_far _HariusaMDexEntry
	text_end

HariusaFDexEntry:
	db "HARIUSA♀@"
	db 10
	dw 1000
	text_far _HariusaFDexEntry
	text_end

YaddonDexEntry:
	db "YADDON@"
	db 10
	dw 1000
	text_far _YaddonDexEntry
	text_end

GaruraDexEntry:
	db "GARURA@"
	db 10
	dw 1000
	text_far _GaruraDexEntry
	text_end

CyhornDexEntry:
	db "CYHORN@"
	db 10
	dw 1000
	text_far _CyhornDexEntry
	text_end

BetbeterDexEntry:
	db "BETBETER@"
	db 10
	dw 1000
	text_far _BetbeterDexEntry
	text_end

BiridamaDexEntry:
	db "BIRIDAMA@"
	db 10
	dw 1000
	text_far _BiridamaDexEntry
	text_end

GengarDexEntry:
	db "GENGAR@"
	db 10
	dw 1000
	text_far _GengarDexEntry
	text_end

FusigisoDexEntry:
	db "FUSIGISO@"
	db 10
	dw 1000
	text_far _FusigisoDexEntry
	text_end

MycorMDexEntry:
	db "MYCOR♂@"
	db 10
	dw 1000
	text_far _MycorMDexEntry
	text_end

MycorFDexEntry:
	db "MYCOR♀@"
	db 10
	dw 1000
	text_far _MycorFDexEntry
	text_end

TamatamaDexEntry:
	db "TAMATAMA@"
	db 10
	dw 1000
	text_far _TamatamaDexEntry
	text_end

BelingaDexEntry:
	db "BELINGA@"
	db 10
	dw 1000
	text_far _BelingaDexEntry
	text_end

NassyDexEntry:
	db "NASSY@"
	db 10
	dw 1000
	text_far _NassyDexEntry
	text_end

PipDexEntry:
	db "PIP@"
	db 10
	dw 1000
	text_far _PipDexEntry
	text_end

GyaceDexEntry:
	db "GYACE@"
	db 10
	dw 1000
	text_far _GyaceDexEntry
	text_end

OmomDexEntry:
	db "OMOM@"
	db 10
	dw 1000
	text_far _OmomDexEntry
	text_end

GagarthDexEntry:
	db "GAGARTH@"
	db 10
	dw 1000
	text_far _GagarthDexEntry
	text_end

MonjaraDexEntry:
	db "MONJARA@"
	db 10
	dw 1000
	text_far _MonjaraDexEntry
	text_end

OmegaDexEntry:
	db "OMEGA@"
	db 10
	dw 1000
	text_far _OmegaDexEntry
	text_end

CairossDexEntry:
	db "CAIROSS@"
	db 10
	dw 1000
	text_far _CairossDexEntry
	text_end

WingDexEntry:
	db "WING@"
	db 10
	dw 1000
	text_far _WingDexEntry
	text_end

StrikeDexEntry:
	db "STRIKE@"
	db 10
	dw 1000
	text_far _StrikeDexEntry
	text_end

GyaradosDexEntry:
	db "GYARADOS@"
	db 10
	dw 1000
	text_far _GyaradosDexEntry
	text_end

ShellderDexEntry:
	db "SHELLDER@"
	db 10
	dw 1000
	text_far _ShellderDexEntry
	text_end

KarakaraDexEntry:
	db "KARAKARA@"
	db 10
	dw 1000
	text_far _KarakaraDexEntry
	text_end

AmblerDexEntry:
	db "AMBLER@"
	db 10
	dw 1000
	text_far _AmblerDexEntry
	text_end

RapruthDexEntry:
	db "RAPRUTH@"
	db 10
	dw 1000
	text_far _RapruthDexEntry
	text_end

GouthDexEntry:
	db "GOUTH@"
	db 10
	dw 1000
	text_far _GouthDexEntry
	text_end

KarabathDexEntry:
	db "KARABATH@"
	db 10
	dw 1000
	text_far _KarabathDexEntry
	text_end

MimiDexEntry:
	db "MIMI@"
	db 10
	dw 1000
	text_far _MimiDexEntry
	text_end

NoneDexEntry:
	db "???@"
	db 10
	dw 1000
	text_far _NoneDexEntry
	text_end
