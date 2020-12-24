clear all
set more off
cap log close

use "G:\My Drive\Documents\SMERU\Kuestioner COVID (UNDP-UNICEF)\Full Scale Questionnaire\Data\Final\FIXXX\DATA SURVEI COVID19_REV (CEK SMERU)_WEIGHT_REV__Adjusted.dta"

*Prepare variables for FIES*

local var d2a d2b d2c d2d d2e d2f d2g d2h
local lev WORRIED HEALTHY FEWFOOD SKIPPED ATELESS RUNOUT HUNGRY WHLDAY

forv n=1/8 {
	local a: word `n' of `var'
	local b: word `n' of `lev'

	gen `b' = inrange(`a',1,2)
}

*Adjust Weight for Some Commands*
gen sampling_weight_q = int(sampling_weight)
recast long sampling_weight_q

*PCA for wealth Index*
foreach var of varlist d15* {
	replace `var'=0 if `var'==2
}

pca d15a-d15l [fw=sampling_weight_q]


predict pca1_index

xtile wealth_index = pca1_index [fw=sampling_weight_q], nq(5)
la var wealth_index "Quintiles of Wealth Index"
la de wealth_index 1 "1 (Poorest)" 2 "2" 3 "3" 4 "4" 5 "5 (Wealthiest)"
la val wealth_index wealth_index

*gen id dummy*
drop id
gen id = _n
*Sample for FAO*
keep id id1_cd id1 id5 b2 b4 b6 wealth_index WORRIED HEALTHY FEWFOOD SKIPPED ATELESS RUNOUT HUNGRY WHLDAY sampling_weight


sample 12.1, by(id1_cd id1 id5 b2 b4 b6 wealth_index)

=
*RASCH TEST

raschtest WORRIED HEALTHY FEWFOOD SKIPPED ATELESS RUNOUT HUNGRY WHLDAY, id(id) graph
return list
*predict rasch
