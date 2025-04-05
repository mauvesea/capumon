PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db OMEGA
	db OMEGA
	db OMEGA
	db "@"

PrizeMenuMon1Cost:
	bcd2 180
	bcd2 500
	bcd2 1200
	db "@"

PrizeMenuMon2Entries:
	db OMEGA
	db OMEGA
	db OMEGA
	db "@"

PrizeMenuMon2Cost:
	bcd2 2800
	bcd2 5500
	bcd2 9999
	db "@"

PrizeMenuTMsEntries:
	db TM_DRAGON_RAGE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 3300
	bcd2 5500
	bcd2 7700
	db "@"
