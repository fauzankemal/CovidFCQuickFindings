clear all
set more off
cap log close
*set trace on

use "G:\My Drive\Documents\SMERU\Kuestioner COVID (UNDP-UNICEF)\Full Scale Questionnaire\Data\Final\Survey Dampak Covid19 2020 1 DES FINAL NONAME_Adjusted.dta"

cd "G:\My Drive\Documents\SMERU\Kuestioner COVID (UNDP-UNICEF)\Full Scale Questionnaire\Quick Findings\Donor Request Tabulation"

*PCA for wealth Index*
foreach var of varlist d15* {
	replace `var'=0 if `var'==2
}

pca d15a-d15l

predict pca1_index

xtile qpca = pca1_index, nq(5)

