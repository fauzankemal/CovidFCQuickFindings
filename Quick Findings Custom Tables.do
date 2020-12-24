clear all
set more off
cap log close
*set trace on
	
/*------------------------------------------------------------------------------
The SMERU Research Institute
--------------------------------------------------------------------------------
Author          : Fauzan Kemal Musthofa, Michelle A
Project         : 2020_UNDP_COVID
Email           : fkemal@smeru.or.id, mandrina@smeru.or.id
Date created	: 02/11/2020
Date modified	: 30/11/2020
--------------------------------------------------------------------------------
Simple tabulations and summary for Fullscale-survey's quick finding analysis
-------------------------------------------------------------------------------- */
/* code
a. all
a2. Male-headed
b. Female headed
c. children
d. disability
e. elder
f. children aged below 5 years old
g. Income group
h. pregnant
i. low income
j. rural-urban
*/

/*Kemal*/
use "G:\My Drive\Documents\SMERU\Kuestioner COVID (UNDP-UNICEF)\Full Scale Questionnaire\Quick Findings\datasurvei_21dec_grouped.dta"

cd "G:\My Drive\Documents\SMERU\Kuestioner COVID (UNDP-UNICEF)\Full Scale Questionnaire\Quick Findings\Donor Request Tabulation"

*Modify label value i1*
la de i1 1 "Yes, a male member of the household" 2 "Yes, a female member of the household" 3 "Yes, operating it together" 4 "Yes, operated by someone else not a member of this household" 5 "No", modify
la val i1 i1

tempfile appended
save `appended', replace



/*------------------------------------------------------------------------------
PROSPERA
-------------------------------------------------------------------------------- */

foreach no in PROSPERA {
		/*
		local b "MB_ind"
		tabout h10 using "`b'.csv" if hc16==0 [fweight=sampling_weight_q], c(freq col) clab(n pct) format(2) replace botf(tes.txt) botstr("Tabulation of MB industry if no income")
		import delimited using "`b'.csv", varnames(1) clear
		export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'") cell(C1) sheetmodify firstrow(varlabels)
		rm "`b'.csv"
		use `appended', clear
		*/

		local b "inc_gvt"
		tabout d9 hc23 using "`b'.csv" [fweight=sampling_weight_q], c(freq col) clab(n pct) format(2) replace botf(tes.txt) botstr("Tabulation of Income reduction and receive gvt support")
		import delimited using "`b'.csv", varnames(1) clear
		export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'") cell(C1) sheetmodify firstrow(varlabels)
		rm "`b'.csv"
		use `appended', clear

		local b "inc_ex"
		tabout d9 d5 using "`b'.csv" [fweight=sampling_weight_q], c(freq col) clab(n pct) format(2) replace botf(tes.txt) botstr("Tabulation of Income reduction and receive gvt support")
		import delimited using "`b'.csv", varnames(1) clear
		export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'") cell(C1) sheetmodify firstrow(varlabels)
		rm "`b'.csv"
		use `appended', clear

		local b "MB_Gen"
		tabout hc24 using "`b'.csv" [fweight=sampling_weight_q], c(freq col) clab(n pct) format(2) replace botf(tes.txt) botstr("Tabulation of MB Gender")
		import delimited using "`b'.csv", varnames(1) clear
		export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'") cell(C1) sheetmodify firstrow(varlabels)
		rm "`b'.csv"
		use `appended', clear

		foreach x in i5 i13 i14  {
			local b "`x'_by_i1"
			tabout `x' i1 using "`b'.csv" [fweight=sampling_weight_q], c(freq col) clab(n pct) format(2) replace botf(tes.txt) botstr("Tabulation of Business")
			import delimited using "`b'.csv", varnames(1) clear
			export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'") cell(C1) sheetmodify firstrow(varlabels)
			rm "`b'.csv"
			use `appended', clear
			}


		foreach group in i1 {
			foreach a in i7 i12 i8 i15 {
				local b "i1_n_`a'"
				#delimit ;
				eststo clear;
				bys `group':eststo: qui: estpost summ `a'_* [fweight=sampling_weight_q];
				esttab using "`b'`group'.csv", c("mean(f(%20.2f)) count") bracket
				addnotes("Tabulation of `:var l `a'' by `:var l `group''") label nodepvars noobs replace plain;
				#delimit cr
				import delimited using "`b'`group'.csv", varnames(1) clear
				export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'`group'") cell(C1) sheetmodify firstrow(varlabels)
				sleep 100
				rm "`b'`group'.csv"
				use `appended', clear	
				}
			}

		foreach group in hc23 {
			foreach a in d12 {
				local b "hc23_n_`a'"
				#delimit ;
				eststo clear;
				bys `group':eststo: qui: estpost summ `a'_* [fweight=sampling_weight_q];
				esttab using "`b'`group'.csv", c("mean(f(%20.2f)) count") bracket
				addnotes("Tabulation of `:var l `a'' by `:var l `group''") label nodepvars noobs replace plain;
				#delimit cr
				import delimited using "`b'`group'.csv", varnames(1) clear
				export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'`group'") cell(C1) sheetmodify firstrow(varlabels)
				sleep 100
				rm "`b'`group'.csv"
				use `appended', clear	
				}
			}

		local b "debt"
		tabout d17 d18 using "`b'.csv" [fweight=sampling_weight_q], c(freq col) clab(n pct) format(2) replace botf(tes.txt) botstr("Tabulation of Debt before and after april 2020")
		import delimited using "`b'.csv", varnames(1) clear
		export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'") cell(C1) sheetmodify firstrow(varlabels)
		rm "`b'.csv"
		use `appended', clear
*set trace on
		foreach x in d17 d18  {
			local b "`x'_assistance"
			tabout `x' hc23 using "`b'.csv" [fweight=sampling_weight_q], c(freq col) clab(n pct) format(2) replace botf(tes.txt) botstr("Tabulation `x' by receive assistance")
			import delimited using "`b'.csv", varnames(1) clear
			export excel using "weighted_undp20_quickfinding_`no'.xlsx", sheet("`b'") cell(C1) sheetmodify firstrow(varlabels)
			rm "`b'.csv"
			use `appended', clear
			
			}
		
	}
/*

***Venn Diagram PROSPERA***
*D8
/*
local i A B C D E F G H I W
foreach x of local i{
replace d8_`x'=d8_`x'/100
}
*/

gen d8_Job = regexm(d8,"[AB]")
la var d8_Job "Wage/Business"

gen d8_Gvt = regexm(d8,"[E]")
la var d8_Gvt "Government support"

gen d8_Other = regexm(d8,"[CDFGHVW]")
la var d8_Other "Other Source of Income"

preserve
keep d8_Gvt  d8_Other  d8_Job sampling_weight_q
expand sampling_weight_q
venndiag d8_Gvt  d8_Other  d8_Job


