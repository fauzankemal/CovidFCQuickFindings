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


*RASCH TEST

raschtest WORRIED HEALTHY FEWFOOD SKIPPED ATELESS RUNOUT HUNGRY WHLDAY, id(id) graph
return list
*predict rasch
