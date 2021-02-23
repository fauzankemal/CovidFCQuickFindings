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
Date modified	: 24/01/2021
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
g2. Low income group
h. pregnant
i. low income
j. rural-urban
k. Wealth index
k2. Wealth index 3 group
*/

/*Kemal*/
use "G:\My Drive\Documents\SMERU\Kuestioner COVID (UNDP-UNICEF)\Full Scale Questionnaire\Data\Final\FIXXX\DATA SURVEI COVID19_REV (CEK SMERU)_WEIGHT_REV__Adjusted_250121.dta"

cd "G:\My Drive\Documents\SMERU\Kuestioner COVID (UNDP-UNICEF)\Full Scale Questionnaire\Quick Findings"

/*------------------------------------------------------------------------------
Keep completed Observations only
-------------------------------------------------------------------------------- */
keep if j1==1

/*------------------------------------------------------------------------------
Creating dummy
-------------------------------------------------------------------------------- */
{
*C1a
local i A B C D W
foreach x of local i{
gen c1a_`x'=regexm(c1a,"`x'")
replace c1a_`x'= c1a_`x'*100
}

order c1a_A-c1a_W, after(c1a)

*C2
local i A B C D E F G H I J
foreach x of local i{
gen c2_`x'=regexm(c2,"`x'")
replace c2_`x'=c2_`x'*100
}

order c2_A-c2_J, after(c2)

*C6a
local i A B C D V
foreach x of local i{
gen c6a_`x'=regexm(c6a,"`x'") if inlist(c6,1,2)
replace c6a_`x'=c6a_`x'*100
}

order c6a_A-c6a_V, after(c6a)

*C6b
local i A B C D E F V
foreach x of local i{
gen c6b_`x'=regexm(c6b,"`x'") if inlist(c6,3,4)
replace c6b_`x'=c6b_`x'*100
}

order c6b_A-c6b_V, after(c6b)



*C9
local i A B C D W
foreach x of local i{
gen c9_`x'=regexm(c9,"`x'")
replace c9_`x'=c9_`x'*100
}

order c9_A-c9_W, after(c9)

*C10
local i A B C D E W
foreach x of local i{
gen c10_`x'=regexm(c10,"`x'")
replace c10_`x'=c10_`x'*100
}

order c10_A-c10_W, after(c10)

*D6
local i A B C D E F G H I J V
foreach x of local i{
gen d6_`x'=regexm(d6,"`x'") if d5==1
replace d6_`x'=d6_`x'*100 
}

order d6_A-d6_V, after(d6)

*D7
local i A B C D E F G H I J V
foreach x of local i{
gen d7_`x'=regexm(d7,"`x'") if d5==3
replace d7_`x'=d7_`x'*100
}

order d7_A-d7_V, after(d7)

*D8
local i A B C D E F G H V W
foreach x of local i{
gen d8_`x'=regexm(d8,"`x'")
replace d8_`x'=d8_`x'*100
}

order d8_A-d8_W, after(d8)

*D12
local i A B C D E F G H I J K L W
foreach x of local i{
gen d12_`x'=regexm(d12,"`x'")
replace d12_`x'=d12_`x'*100
}

order d12_A-d12_W, after(d12)

*E5
local i A B C D E F V
foreach x of local i{
gen e5_`x'=regexm(e5,"`x'") if e4==2
replace e5_`x'=e5_`x'*100
}

order e5_A-e5_V, after(e5)

*E6
local i A B C D E F G V W
foreach x of local i{
gen e6_`x'=regexm(e6,"`x'") if e_check2==1
replace e6_`x'=e6_`x'*100
}

order e6_A-e6_W, after(e6)


*E7
local i A B C D E F G H I J W
foreach x of local i{
gen e7_`x'=regexm(e7,"`x'") if e_check2==1
replace e7_`x'=e7_`x'*100
}

order e7_A-e7_W, after(e7)

*E8
local i A B C D E F W
foreach x of local i{
gen e8_`x'=regexm(e8,"`x'") if e_check2==1
replace e8_`x'=e8_`x'*100
}

order e8_A-e8_W, after(e8)

*E10
local i A B C D E F G H W
foreach x of local i{
gen e10_`x'=regexm(e10,"`x'") if !regexm(e9,"D") & !missing(e9)
replace e10_`x'=e10_`x'*100
}

order e10_A-e10_W, after(e10)

*E11
local i A B C D E F G H I J W
foreach x of local i{
gen e11_`x'=regexm(e11,"`x'") if !regexm(e10,"H|W") & !missing(e10)
replace e11_`x'=e11_`x'*100
}

order e11_A-e11_W, after(e11)

*E13
local i A B C D E F G H I J K
foreach x of local i{
gen e13_`x'=regexm(e13,"`x'") if e12==1
replace e13_`x'=e13_`x'*100
}

order e13_A-e13_K, after(e13)

*E14
local i A B W
foreach x of local i{
gen e14_`x'=regexm(e14,"`x'") if e_check2==1
replace e14_`x'=e14_`x'*100
}

order e14_A-e14_W, after(e14)

*E15
local i A B C D E F G H I J K L
foreach x of local i{
gen e15_`x'=regexm(e15,"`x'") if e_check2==1 & regexm(e14,"A|B")
replace e15_`x'=e15_`x'*100
}

order e15_A-e15_L, after(e15)

*F2
local i A B C D E F G H
foreach x of local i{
gen f2_`x'=regexm(f2,"`x'") if f1==1
replace f2_`x'=f2_`x'*100
}

order f2_A-f2_H, after(f2)

*F3
local i A B C D E F G H I
foreach x of local i{
gen f3_`x'=regexm(f3,"`x'") if f1==1
replace f3_`x'=f3_`x'*100
}

order f3_A-f3_I, after(f3)

*F6
local i A B C D E F G H I
foreach x of local i{
gen f6_`x'=regexm(f6,"`x'") if f5==1
replace f6_`x'=f6_`x'*100
}

order f6_A-f6_I, after(f6)

*F7
local i A B C D E F G H
foreach x of local i{
gen f7_`x'=regexm(f7,"`x'") if f5==1
replace f7_`x'=f7_`x'*100
}

order f7_A-f7_H, after(f7)

*F8
local i A B C D E F G H V W
foreach x of local i{
gen f8_`x'=regexm(f8,"`x'")
replace f8_`x'=f8_`x'*100
}

order f8_A-f8_W, after(f8)

*F9
local i A B C D E Y
foreach x of local i{
gen f9_`x'=regexm(f9,"`x'") if !regexm(f8,"W") & !missing(f8)
replace f9_`x'=f9_`x'*100
}

order f9_A-f9_Y, after(f9)

*F10
local i A B C D E F G H
foreach x of local i{
gen f10_`x'=regexm(f10,"`x'") if !regexm(f8,"W") & !missing(f8)
replace f10_`x'=f10_`x'*100
}

order f10_A-f10_H, after(f10)

*F12
local i A B C D E F G H I X
foreach x of local i{
gen f12_`x'=regexm(f12,"`x'") if f11==1
replace f12_`x'=f12_`x'*100
}

order f12_A-f12_X, after(f12)

*G1
local i A B C D E F G H X Y
foreach x of local i{
gen g1_`x'=regexm(g1,"`x'")
replace g1_`x'=g1_`x'*100
}

order g1_A-g1_Y, after(g1)

*G2
local i A B C D
foreach x of local i{
gen g2_`x'=regexm(g2,"`x'") if !regexm(g1,"X|Y")
replace g2_`x'=g2_`x'*100
}

order g2_A-g2_D, after(g2)

*G3
local i A B C
foreach x of local i{
gen g3_`x'=regexm(g3,"`x'") if !regexm(g2,"A") & !missing(g2)
replace g3_`x'=g3_`x'*100
}

order g3_A-g3_C, after(g3)

*G5
local i A B C D E F V W
foreach x of local i{
gen g5_`x'=regexm(g5,"`x'") if !regexm(g1,"X|Y")
replace g5_`x'=g5_`x'*100
}

order g5_A-g5_W, after(g5)


*G6
local i A B C D E Y
foreach x of local i{
gen g6_`x'=regexm(g6,"`x'") if !regexm(g5,"W") & !missing(g5)
replace g6_`x'=g6_`x'*100
}

order g6_A-g6_Y, after(g6)

*G8
local i A B C D E F G V
foreach x of local i{
gen g8_`x'=regexm(g8,"`x'") if g7==1
replace g8_`x'=g8_`x'*100
}

order g8_A-g8_V, after(g8)

*G10
local i A B C D E F G H V
foreach x of local i{
gen g10_`x'=regexm(g10,"`x'") if g9==1
replace g10_`x'=g10_`x'*100
}

order g10_A-g10_V, after(g10)

*G12
local i A B C D E F V
foreach x of local i{
gen g12_`x'=regexm(g12,"`x'") if g11==1
replace g12_`x'=g12_`x'*100
}

order g12_A-g12_V, after(g12)

*H1
local i A B C D E F G H I W
foreach x of local i{
gen h1_`x'=regexm(h1,"`x'")
replace h1_`x'=h1_`x'*100
}

order h1_A-h1_W, after(h1)

*H24
local i A B C D E F W
foreach x of local i{
gen h24_`x'=regexm(h24,"`x'")
replace h24_`x'=h24_`x'*100
}

order h24_A-h24_W, after(h24)

*H26
local i A B C D E Y W
foreach x of local i{
gen h26_`x'=regexm(h26,"`x'") if (!regexm(h24,"W") & h25==1)
replace h26_`x'=h26_`x'*100
}

order h26_A-h26_W, after(h26)

*H29
local i A B C
foreach x of local i{
gen h29_`x'=regexm(h29,"`x'") if !regexm(h29,"W")
replace h29_`x'=h29_`x'*100
}

order h29_A-h29_C, after(h29)

*H30
local i A B C D E F G H I
foreach x of local i{
gen h30_`x'=regexm(h30,"`x'") if !regexm(h29,"C|W")
replace h30_`x'=h30_`x'*100
}

order h30_A-h30_I, after(h30)

*I3
replace i3 = regexr(i3,"F","B")
local i A B C D E V
foreach x of local i{
gen i3_`x'=regexm(i3,"`x'") if i1!=5
replace i3_`x'=i3_`x'*100
}

order i3_A-i3_V, after(i3)

*I6
local i A B C D E F V
foreach x of local i{
gen i6_`x'=regexm(i6,"`x'") if i1!=5
replace i6_`x'=i6_`x'*100
}

order i6_A-i6_V, after(i6)

*I7
local i A B C D E F G H I J V W
foreach x of local i{
gen i7_`x'=regexm(i7,"`x'") if i1!=5
replace i7_`x'=i7_`x'*100
}

order i7_A-i7_W, after(i7)

*I8
local i A B C D E F G H I J K L M N V W
foreach x of local i{
gen i8_`x'=regexm(i8,"`x'") if i1!=5 & !regexm(i7,"W")
replace i8_`x'=i8_`x'*100
}

order i8_A-i8_W, after(i8)

*I9
local i A B C
foreach x of local i{
gen i9_`x'=regexm(i9,"`x'") if i1!=5
replace i9_`x'=i9_`x'*100
}

order i9_A-i9_C, after(i9)

*I10
local i A B C D
foreach x of local i{
gen i10_`x'=regexm(i10,"`x'") if !regexm(i9,"C") & !missing(i9)
replace i10_`x'=i10_`x'*100
}

order i10_A-i10_D, after(i10)

*I11
local i A B C D E F G H I J K L M
foreach x of local i{
gen i11_`x'=regexm(i11,"`x'") if i1!=5
replace i11_`x'=i11_`x'*100
}

order i11_A-i11_M, after(i11)

*I12
local i A B C D E F G H I J W
foreach x of local i{
gen i12_`x'=regexm(i12,"`x'") if i1!=5
replace i12_`x'=i12_`x'*100
}

order i12_A-i12_W, after(i12)

*I15
local i A B C D E F G V
foreach x of local i{
gen i15_`x'=regexm(i15,"`x'") if i14<4 & !missing(i14)
replace i15_`x'=i15_`x'*100
}

order i15_A-i15_V, after(i15)

rename a* b* c* d* e* f* g* h* i*, lower
}

/*------------------------------------------------------------------------------
English Label & Dummy Label
-------------------------------------------------------------------------------- */
{
la var id "id. Household ID"
la var id1_cd "id1_cd. Province code"
la var id1 "id1. Province name"
la var id2_cd "id2_cd. District/City code"
la var id2 "id2. District/City name"
la var id3_cd "id3_cd. Subdistrict code"
la var id3 "id3. Subdistrict name"
la var id4_cd "id4_cd. Village/Kelurahan code"
la var id4 "id4. Village/Kelurahan"
la var id5 "id5. Village/Kelurahan category"
la var id6 "id6. Census block number"
la var id7 "id7. Sample code number"
la var id8 "id8. Sample list number"
la var id9 "id9. Enumerator name"
la var id10 "id10. Supervisor name"
la var id12 "id12. Household found"

*la var pengantar "Household willingness" 
la var sint "Interview Start Time"
/*
la var a1 "a1. Full name of the household head"
la var a2 "a2. Reason for the change of the household head "
la var a3 "a3. Full name of the current household head "
la var a4 "a4. Full name of the respondent"
la var a5 "a5. Household’s full address"
la var a6_no "a6. HH’s phone number"
la var a6_nama "a6. Owner for HH’s phone number"
la var a7_no "a7. Other phone number"
la var a7_nama "a7. Owner for other phone number"
*la var a10 "a10. Date of interview"
la var a_check1 "a_check1. Check for household name "
*/
*la var bs "bs. Census block code"
la var b1 "b1. Respondent relationship with household head"
la var b2 "b2. HH head sex"
la var b3_usia "b3. HH head age"
la var b4 "b4. HH head education"
la var b5 "b5. HH head marital status"
la var b6 "b6. Respondent sex"
la var b7 "b7. Number of HH members"
la var b8a "b8a. Number of over 60 years old member"
la var b8b "b8b. Number of pregnant women"
la var b8c "b8c. Number of members with chronic illness"
la var b8d "b8d. Number of members with infectious disease"
la var b8e "b8e. Number of members work as medical personnel/at healthcare facility"
la var b8f "b8f. Number of members with out-of-home job/interact with a lot of people "
la var b9 "b9. COVID-19-positive individual around house "
la var b10 "b10. Biggest impact of the COVID-19 pandemic"
la var b11 "b11. Who has done the most HH chores"
la var b12 "b12. Who should be doing HH chores more"
la var b13 "b13. How the decision regarding the HH chores"
la var b14 "b14. Difference in the time spend for HH chores "
la var b15 "b15. Use of internet and the intensity"

la var c1a "c1a. Cash assistance since April 2020"
la var c1b "c1b. Family of Hope (PKH) program"
la var c1c "c1c. BPJS Ketenagakerjaan wage subsidy"
la var c1d "c1d. Preemployment Card (Kartu Prakerja)"
la var c_check1 "c_check1. Check for cash assistance"
la var c2 "c2. Most spending from the cash assistance"
la var c3a "c3a. Staple food assistance"
la var c3b "c3b. Internet package assistance"
la var c3c "c3c. Income or business tax deduction "
la var c3d "c3d. Deferment of installments"
la var c4 "c4. Installed capacity of the PLN’s electricity"
la var c5 "c5. Received electricity assistance"
la var c_check2 "c_check2. Check for external assistance"
la var c6 "c6. Perception on the disbursement of the social assistance "
la var c6a "c6_1. Reason to think it is fair"
la var c6b "c6_2. Reason to think it is unfair"
la var c7 "c7. Perception on HH’s need for assistance"
la var c8 "c8. Kind of assistance the HH need the most "
la var c9 "c9. Assistance from extended family/neighbors "
la var c10 "c10. Assistance from NGOs "
la var c11 "c11. How helpful has the assistance in meeting the needs"
la var c12 "c12. Total amount of assistances "

la var d1 "d1. What determines the food"
la var d2a "d2_a. Worried will not have enough food"
la var d2b "d2_b. Unable to eat healthy food"
la var d2c "d2_c. Eaten an unvaried diet"
la var d2d "d2_d. Skipped a meal on a particular day"
la var d2e "d2_e. Eaten smaller portions than usual"
la var d2f "d2_f. Run out of food"
la var d2g "d2_g. Felt hungry but did not eat"
la var d2h "d2_h. Not eaten for a whole day"
la var d3 "d3. Food expenditure in the past week"
la var d4 "d4. Non-food expenditure in the past month"
la var d5 "d5. Change in average expenditure"
la var d6 "d6. Higher expenditure component"
la var d7 "d7. Lower expenditure component"
la var d8 "d8. Source of HH income"
la var d9 "d9. Income change in comparison to January"
la var d10 "d10. Percentage of income change"
la var d11 "d11. Total net income from work/business"
la var d12 "d12. HH activity to make ends meet"
la var d_check1 "d_check1. Check for change in consumption"
la var d13a "d13_a. Food staples"
la var d13b "d13_b. Beans"
la var d13c "d13_c. Fish, squid, shrimps, seafood"
la var d13d "d13_d. Chicken, duck, poultry "
la var d13e "d13_e. Red meat"
la var d13f "d13_f. Eggs"
la var d13g "d13_g. Milk and dairy"
la var d13h "d13_h. Vegetables"
la var d13i "d13_i. Fruits"
la var d14 "d14. Own savings or liquid assets to support HH"
la var d15a "d15_a. Gas cylinders 5.5kg or higher"
la var d15b "d15_b. Refrigerator"
la var d15c "d15_c. Air conditioner "
la var d15d "d15_d. Smartphone"
la var d15e "d15_e. Computer or laptop"
la var d15f "d15_f. Gold/jewerly"
la var d15g "d15_g. Motorcycle"
la var d15h "d15_h. Car"
la var d15i "d15_i. Flat-screen television"
la var d15j "d15_j. Farmland or land"
la var d15k "d15_k. Self-owned house"
la var d15l "d15_l. Livestock"
la var d16a "d16_a. Jewerly"
la var d16b "d16_b. Vehicles"
la var d16c "d16_c. Electrical home appliances"
la var d16d "d16_d. House or land"
la var d16e "d16_e. Livestock"
la var d17 "d17. Debt before April 2020"
la var d18 "d18. Debt since April 2020"

la var e1 "e1. Number of children aged 13-17yo"
la var e2 "e2. Number of children aged 5-12yo"
la var e3 "e3. Number of children aged 0-4yo"
la var e_check1 "e_check1. Check for 0-4yo"
la var e4 "e4. Child consumption pattern"
la var e5 "e5. Reason for different consumption pattern"
la var e_check2 "e_check2. Check for HH children"
la var e6 "e6. Caregivers"
la var e7 "e7. Concern for children"
la var e8 "e8. Children behavioral changes"
la var e9aa"e9_a. Number of children in elementary school"
la var e9ab "e9_b. Number of children in junior high school"
la var e9ac "e9_c. Number of children in senior high school "
la var e10 "e10. LFH constraints"
la var e11 "e11. Action to overcome constraints"
la var e12 "e12. Having difficulties with educational costs"
la var e13 "e13. Action to overcome difficulties with educational costs"
la var e14 "e14. Children who do not continue education"
la var e15 "e15. Reason to not continue education"
la var e16a "e16_a. Leave children in the care of better off relative"
la var e16b "e16_b. Sending children to boarding school"
la var e16c "e16_c. Leaving children in the care of orphanage"
la var e16d "e16_d. Asking children to work "
la var e16e "e15_e. Marrying the children"

la var f1 "f1. Visited/accessed healthcare facilities "
la var f2 "f2. Healthcare facilities visited"
la var f3 "f3. Purpose of visit"
la var f4 "f4. used application-based online health services "
la var f5 "f5. Not get a needed health service"
la var f6 "f6. Health service not gotten"
la var f7 "f7. Reason did not get the health service"
la var f8 "f8. Felt unhappy, depressed, or experienced excessive anxieties "
la var f9 "f9. Reason for exhibits those behaviors"
la var f10 "f10. Moral support"
la var f11 "f11. HH argument"
la var f12 "f12. Argument frequency"

la var g1 "g1. Type of disability"
la var g2 "g2. PwD age group"
la var g3 "g3. PwD independency"
la var g4 "g4. PwD most affected/disturbed"
la var g5 "g5. PwD social assistance"
la var g6 "g6. PwD source of assistance"
la var g7 "g7. PwD dissemination"
la var g8 "g8. PwD organizer of dissemination"
la var g9 "g9. PwD difficulty in visiting health facilities"
la var g10 "g10. PwD complaints in accessing health facilities"
la var g11 "g11. PwD regular therapy needs"
la var g12 "g12. PwD impact to therapy"

la var h1 "h1. Working members"
la var h2 "h2. Number of working members"
la var h3 "h3. Main breadwinner (MB)"
la var h4 "h4. MB working"
la var h5 "h5. MB suspended-temporarily"
la var h6 "h6. MB suspended-reason related to COVID"
la var h7 "h7. MB suspended-month"
la var h8 "h8. MB suspended-earn income"
la var h9 "h9. MB suspended-guarantee"
la var h_check1 "h_check1. Check for work status"
la var h10 "h10. MB line of business/field of job"
la var h11 "h11. MB status/position"
la var h12 "h12. MB work hours in a week"
la var h13 "h13. MB WFH"
la var h14 "h14. MB fee basis" 
la var h15 "h15. MB impact for casual employee"
la var h16 "h16. MB additional job/business"
la var h17 "h17. MB looking for work"
la var h18 "h18. MB setting up business"
la var h_check2 "h_check2. Check if MB looking for work/setting up business"
la var h19 "h19. MB reason if looking for work/setting up business"
la var h20 "h20. MB previous"
la var h21 "h21. MB previous-month"
la var h22 "h22. MB previous-line of business/field of job"
la var h23 "h23. MB previous-status/position"
la var h24 "h24. Other HH-job changes"
la var h25 "h25. Other HH-reason for job changes"
la var h26 "h26. Source of seed money"
la var h27 "h27. Claim Old Age Benefit"
la var h28 "h28. Change BPJS Kesehatan change"
la var h29 "h29. Working children"
la var h30 "h30. Working children business/field of job"

la var i1 "i1. Ownership of business"
la var i2 "i2. Start of business"
la var i3 "i3. Reason to start business"
la var i4 "i4. Line of business"
la var i5 "i5. Current business operations"
la var i6 "i6. Strategy for marketing"
la var i7 "i7. COVID impact on business"
la var i8 "i8. Business strategy to overcome the impact"
la var i9 "i9. Working children in business"
la var i10 "i10. Payment for working children"
la var i11 "i11. Source of capital"
la var i12 "i12. Outstanding business debts/loans"
la var i13 "i13. Ability to pay installment payment regularly"
la var i14 "i14. Received assistance for business "
la var i15 "i15. Use of the assistance"

la var j1 "j1. Interview result"
la var j2 "j2. Willingness to participate in in-depth interview"
la var j3 "j3. Interviewer note"
la var j4 "j4. Reminder for follow-up phone interview"

la var c1a_a "c1a_a. Direct Cash Transfer-Village Fund (BLT-DD)"
la var c1a_b "c1a_b. Direct Cash Transfer (BLT) Non-Jabodetabek"
la var c1a_c "c1a_c. Direct Cash Transfer for Micro-Small Business: Banpres Produktif Usaha Mikro/BPUM (BLT-UMKM)"
la var c1a_d "c1a_d. Received cash transfer but don’t know which program"
la var c1a_w "c1a_w. Did not receive cash transfer"

la var c2_a "c2_a. Groceries and daily expenses"
la var c2_b "c2_b. Utilities"
la var c2_c "c2_c. Cell phone credit or internet package"
la var c2_d "c2_d. Transportation expenses"
la var c2_e "c2_e. Health expenses"
la var c2_f "c2_f. Education expenses"
la var c2_g "c2_g. House or room rent payments"
la var c2_h "c2_h. Donation or charitable expenses"
la var c2_i "c2_i. Seed money"
la var c2_j "c2_j. Installments or debt repayments"

la var c6a_a "c6a_a. Neighborhood officers conducted meetings"
la var c6a_b "c6a_b. Neighborhood officers checked each family’s condition"
la var c6a_c "c6a_c. Poor families received assistance"
la var c6a_d "c6a_d. The available assistance was distributed fairly"
la var c6a_v "c6a_v. Others"

la var c6b_a "c6b_a. The system is fair but there is a limited amount/stock of assistance"
la var c6b_b "c6b_b. Neighborhood officers prioritized their families"
la var c6b_c "c6b_c. There are poor families who didn’t receive assistance"
la var c6b_d "c6b_d. Data is not updated"
la var c6b_e "c6b_e. The available assistance is distributed equally"
la var c6b_f "c6b_f. The same person receives some/many assistances"
la var c6b_v "c6b_v. Others"

la var c9_a "c9_a. Yes, in the form of money"
la var c9_b "c9_b. Yes, in the form of staple food or basic daily needs"
la var c9_c "c9_c. Yes, in the form of services"
la var c9_d "c9_d. Yes, in the form of other goods"
la var c9_w "c9_w. No"

la var c10_a "c10_a. Yes, in the form of money"
la var c10_b "c10_b. Yes, in the form of staple food"
la var c10_c "c10_c. Yes, in the form of services"
la var c10_d "c10_d. Yes, in the form of healthcare equipment"
la var c10_e "c10_e. Yes, in the form of other goods"
la var c10_w "c10_w. No"

la var d6_a "d6_a. Expenses for groceries and daily needs"
la var d6_b "d6_b. Expenses for utilities"
la var d6_c "d6_c. Expenses for cell phone credit or internet package"
la var d6_d "d6_d. Transportation expenses"
la var d6_e "d6_e. Health expenses"
la var d6_f "d6_f. Education expenses"
la var d6_g "d6_g. House or room rent payments"
la var d6_h "d6_h. Donation or charitable expenses"
la var d6_i "d6_i. Seed money"
la var d6_j "d6_j. Installments or debt repayments"
la var d6_v "d6_v. Others"

la var d7_a "d7_a. Expenses for groceries and daily needs"
la var d7_b "d7_b. Expenses for utilities"
la var d7_c "d7_c. Expenses for cell phone credit or internet package"
la var d7_d "d7_d. Transportation expenses"
la var d7_e "d7_e. Health expenses"
la var d7_f "d7_f. Education expenses"
la var d7_g "d7_g. House or room rent payments"
la var d7_h "d7_h. Donation or charitable expenses"
la var d7_i "d7_i. Seed money"
la var d7_j "d7_j. Installments or debt repayments"
la var d7_v "d7_v. Others"

la var d8_a "d8_a. Profit from business operation, including earning from farming"
la var d8_b "d8_b. Salary, wage, or allowance"
la var d8_c "d8_c. Pension"
la var d8_d "d8_d. Financial assistance from relatives"
la var d8_e "d8_e. Cash assistance from the government"
la var d8_f "d8_f. Cash assistance from donators or NGOs"
la var d8_g "d8_g. Scholarship money"
la var d8_h "d8_h. Return on investment"
la var d8_v "d8_i. Others"
la var d8_w "d8_w. No income at all"

la var d12_a "d12_a. Borrowing money from relatives or friends"
la var d12_b "d12_b. Borrowing money from a bank or a loan shark"
la var d12_c "d12_c. Looking for side jobs"
la var d12_d "d12_d. Preparing/setting up a new business"
la var d12_e "d12_e. Seeking/applying for assistance from the government"
la var d12_f "d12_f. Seeking/applying for assistance from nongovernmental parties"
la var d12_g "d12_g. Using severance or savings"
la var d12_h "d12_h. Changing the allocation of consumption"
la var d12_i "d12_i. Reducing food expenditures"
la var d12_j "d12_j. Reducing non-food expenditures"
la var d12_k "d12_k. Selling or pawning belongings"
la var d12_l "d12_l. None of the above"
la var d12_w "d12_w. Not applicable because the household’s needs are met"

la var e5_a "e5_a. The child consumes more animal protein"
la var e5_b "e5_b. The child consumes more vegetables"
la var e5_c "e5_c. The child consumes more fruit"
la var e5_d "e5_d. The child only likes certain types of food"
la var e5_e "e5_e. The child has an allergy"
la var e5_f "e5_f. The child is under 6 months old or has not consumed MPASI"
la var e5_v "e5_v. Others"

la var e6_a "e6_a. Father of the children"
la var e6_b "e6_b. Mother of the children"
la var e6_c "e6_c. Older brothers/sisters of the children"
la var e6_d "e6_d. Other male adults of the household members"
la var e6_e "e6_e. Other female adults of the household members"
la var e6_f "e6_f. Relatives/neighbors not in this household"
la var e6_g "e6_g. Children study alone/unaccompanied"
la var e6_v "e6_v. Others"
la var e6_w "e6_w. Irrelevant (no children in school)"

la var e7_a "e7_a. Children not being able to play outside the house"
la var e7_b "e7_b. Children’s learning process being disrupted"
la var e7_c "e7_c. Children being disturbed emotionally"
la var e7_d "e7_d. Children eating less than the usual/not being able to eat regularly"
la var e7_e "e7_e. Children getting sick easily"
la var e7_f "e7_f. Children being infected with COVID-19"
la var e7_g "e7_g. Children too much playing with cell phones or watching TV"
la var e7_h "e7_h. Children lacking physical activities"
la var e7_i "e7_i. Children lacking for socialization and interaction with their peers"
la var e7_j "e7_j. Others"
la var e7_w "e7_w. None"

la var e8_a "e8_a. Become angry or rebellious more often"
la var e8_b "e8_b. Become sad or moody more often"
la var e8_c "e8_c. Find it harder to concentrate"
la var e8_d "e8_d. Find it harder to eat"
la var e8_e "e8_e. Find it harder to sleep"
la var e8_f "e8_f. Become lazier"
la var e8_w "e8_w. No changes"

la var e10_a "e10_a. Not having the necessary devices"
la var e10_b "e10_b. Having to take turns to use the necessary devices at home"
la var e10_c "e10_c. Limited access to internet"
la var e10_d "e10_d. Home/surrounding condition not being conducive to learning activities"
la var e10_e "e10_e. Children being less motivated to learn"
la var e10_f "e10_f. Parents’ limited time to accompany/teach the children"
la var e10_g "e10_g. Parents’ limited capacity to teach the children"
la var e10_h "e10_h. Not having any problems"
la var e10_w "e10_w. Irrelevant (not learning from home, already resume face-to-face learning)"

la var e11_a "e11_a. Buying a smartphone or laptop"
la var e11_b "e11_b. Borrowing the necessary devices from relatives/neighbors"
la var e11_c "e11_c. Subscribing to a Wi-Fi or cable internet provider"
la var e11_d "e11_d. Asking the children to study at another place that has internet access"
la var e11_e "e11_e. Accompanying or helping the children to learn"
la var e11_f "e11_f. Making deals with the children"
la var e11_g "e11_g. Rebuking or hitting the children, or pinching them on the ear"
la var e11_h "e11_h. Telling the children what to do"
la var e11_i "e11_i. Communicating with or consulting the teachers"
la var e11_j "e11_j. Paying teachers to come and teach the children at home or finding the children a course place for extra lesson"
la var e11_w "e11_w. Nothing"

la var e13_a "e13_a. Adjusting the allocation of funds for other expenses/tightening belts"
la var e13_b "e13_b. Applying for school fees relief"
la var e13_c "e13_c. Asking for assistance from the schools"
la var e13_d "e13_d. Sending the children to other schools"
la var e13_e "e13_e. Homeschooling the children"
la var e13_f "e13_f. Making the boys quit school"
la var e13_g "e13_g. Making the girls quit school"
la var e13_h "e13_h. Borrowing money or asking for financial assistance from relatives"
la var e13_i "e13_i. Borrowing money from non-familial parties"
la var e13_j "e13_j. Seeking to earn additional incomes"
la var e13_k "e13_k. Pawning or selling assets/belongings"

la var e14_a "e14_a. Yes, boys"
la var e14_b "e14_b. Yes, girls"
la var e14_w "e14_c. No"

la var e15_a "e15_a. Too young or not getting a seat for new students’ position according to the zoning system based on age"
la var e15_b "e15_b. Disability/illness"
la var e15_c "e15_c. Failed to achieve the required passing grade"
la var e15_d "e15_d. No schools around/schools being too far from home"
la var e15_e "e15_e. Unable to pay school fees"
la var e15_f "e15_f. Worried about possible COVID-19 infection"
la var e15_g "e15_g. Finding it difficult to follow a distant learning system"
la var e15_h "e15_h. Working"
la var e15_i "e15_i. Assuming the task/responsibility to perform household chores"
la var e15_j "e15_j. Getting married"
la var e15_k "e15_k. Bullying"
la var e15_l "e15_l. Not interested in school or not considering education an important thing"

la var f2_a "f2_a. Public hospital"
la var f2_b "f2_b. Private hospital"
la var f2_c "f2_c. Private practice (doctor/midwife)"
la var f2_d "f2_d. Clinic/general practice"
la var f2_e "f2_e. Puskesmas or pustu"
la var f2_f "f2_f. Community-Resourced Health Initiative/UKBM"
la var f2_g "f2_g. Traditional healing clinic, mantri"
la var f2_h "f2_h. Pharmacy, laboratory, physical therapy clinic"

la var f3_a "f3_a. Immunization"
la var f3_b "f3_b. Birth control services (KB)"
la var f3_c "f3_c. Pregnancy monitoring/examination, childbirth, and post-delivery services"
la var f3_d "f3_d. Regular treatment or therapy, health checkup"
la var f3_e "f3_e. Checking herself/himself on the ailments felt"
la var f3_f "f3_f. Having surgery or inpatients"
la var f3_g "f3_g. Treatment for COVID-19"
la var f3_h "f3_h. Going for a health certificate request"
la var f3_i "f3_i. Having a COVID-19 test"

la var f6_a "f6_a. Immunization"
la var f6_b "f6_b. Birth control services (KB)"
la var f6_c "f6_c. Pregnancy monitoring/examination, childbirth, and post-delivery services"
la var f6_d "f6_d. Regular treatment or therapy, health checkup"
la var f6_e "f6_e. Checking herself/himself on the ailments felt"
la var f6_f "f6_f. Having surgery or inpatients"
la var f6_g "f6_g. Treatment for COVID-19"
la var f6_h "f6_h. Going for a health certificate request"
la var f6_i "f6_i. Having a COVID-19 test"

la var f7_a "f7_a. Being afraid to visit healthcare facilities for fear of being infected with COVID-19"
la var f7_b "f7_b. Not having enough money for treatment cost"
la var f7_c "f7_c. Not being covered by the insurance or BPJS Kesehatan"
la var f7_d "f7_d. Not having enough money for transportation cost or not having the means of transportation"
la var f7_e "f7_e. Not having someone to accompany herself/himself"
la var f7_f "f7_f. Services needed being unavailable, or the healthcare facilities ran out of vaccines/medicine"
la var f7_g "f7_g. Healthcare facilities being closed or not accepting general patients"
la var f7_h "f7_h. Already done self-medication to treat the ailments or did not feel necessary to go to the health facilities"
la var f8_a "f8_a. Yes, head of the household"
la var f8_b "f8_b. Yes, wife/husband"
la var f8_c "f8_c. Yes, head of the household’s son or son-in-law"
la var f8_d "f8_d. Yes, head of the household’s daughter or daughter-in-law"
la var f8_e "f8_e. Yes, head of the household’s father or father-in-law"
la var f8_f "f8_f. Yes, head of the household’s mother or mother-in-law"
la var f8_g "f8_g. Other male family members"
la var f8_h "f8_h. Other female family members"
la var f8_v "f8_v. Yes, others (no family relationships)"
la var f8_w "f8_w. No one"

la var f9_a "f9_a. A family member or acquaintance was infected with COVID-19"
la var f9_b "f9_b. Worriedness about being infected with COVID-19 and family’s death risk"
la var f9_c "f9_c. Money and job issues"
la var f9_d "f9_d. Children care, development and education issues"
la var f9_e "f9_e. Household issues"
la var f9_y "f9_y. Don’t know"

la var f10_a "f10_a. Family or relatives"
la var f10_b "f10_b. Friends or neighbors"
la var f10_c "f10_c. Religious or community leaders"
la var f10_d "f10_d. NGOs"
la var f10_e "f10_e. Health workers such as doctors"
la var f10_f "f10_f. Psychologist or psychiatrist"
la var f10_g "f10_g. No one"
la var f10_h "f10_h. Doesn’t need external support"

la var f12_a "f12_a. More often with the spouse"
la var f12_b "f12_b. More often with children"
la var f12_c "f12_c. More often with other household members"
la var f12_d "f12_d. Just the same with the spouse"
la var f12_e "f12_e. Just the same with children"
la var f12_f "f12_f. Just the same with other household members"
la var f12_g "f12_g. Less often with the spouse"
la var f12_h "f12_h. Less often with children"
la var f12_i "f12_i. Less often with other household members"
la var f12_x "f12_x. Refuse to answer"

la var g1_a "g1_a. Having difficulty or problems with vision"
la var g1_b "g1_b. Having difficulty or problems with hearing"
la var g1_c "g1_c. Having difficulty or problems with walking or taking the stairs"
la var g1_d "g1_d. Having difficulty or problems with using or moving hands and fingers"
la var g1_e "g1_e. Having difficulty or problems with memory or concentration"
la var g1_f "g1_f. Having behavioral and/or emotional problems"
la var g1_g "g1_g. Having difficulty or problems with speaking and/or understanding/communication with others"
la var g1_h "g1_h. Having difficulty or problems to take care of oneself "
la var g1_x "g1_x. Not applicable (no one with disabilities)"
la var g1_y "g1_y. Don’t know"

la var g2_a "g2_a. Toddlers (2-4 years old)"
la var g2_b "g2_b. Children (5-17 years old)"
la var g2_c "g2_c. Adults (18-59 years old)"
la var g2_d "g2_d. The elderly (60 years old and above)"

la var g3_a "g3_a. Fully independent"
la var g3_b "g3_b. Not yet independent, still need companion for some activities"
la var g3_c "g3_c. Totally dependent on the companions"

la var g5_a "g5_a. Cash (including PKH)"
la var g5_b "g5_b. Groceries/food"
la var g5_c "g5_c. Vitamins/medicines"
la var g5_d "g5_d. Medical equipment"
la var g5_e "g5_e. Skill training for work"
la var g5_f "g5_f. Skill training for independent therapy"
la var g5_v "g5_v. Others"
la var g5_w "g5_w. Not receiving any assistance"

la var g6_a "g6_a. Central/Regional Government"
la var g6_b "g6_b. Village government"
la var g6_c "g6_c. Private companies"
la var g6_d "g6_d. NGOs"
la var g6_e "g6_e. Individual"
la var g6_y "g6_y. No idea"

la var g8_a "g8_a. Village officers"
la var g8_b "g8_b. Health workers"
la var g8_c "g8_c. Disability Facilitator from MoSA"
la var g8_d "g8_d. Local Community"
la var g8_e "g8_e. NGOs"
la var g8_f "g8_f. CSR team of a company"
la var g8_g "g8_g. Family"
la var g8_v "g8_v. Other"

la var g10_a "g10_a. Did not visit health facilities because of fear of being infected with COVID-19"
la var g10_b "g10_b. Visiting hours are highly limited"
la var g10_c "g10_c. Facilities needed are not available/scarce"
la var g10_d "g10_d. Health facilities are closed or did not accept general patients"
la var g10_e "g10_e. The number of medical personnel is limited because of the pandemic, resulting in long queues"
la var g10_f "g10_f. Costs rise"
la var g10_g "g10_g. Patients with disabilities are not accepted"
la var g10_h "g10_h. Access to transportation to health facilities are difficult"
la var g10_v "g10_v. Other"

la var g12_a "g12_a. Service duration is reduced"
la var g12_b "g12_b. Service is abolished"
la var g12_c "g12_c. Service rate increases"
la var g12_d "g12_d. Services are carried out online"
la var g12_e "g12_e. Household members have to facilitate or provide therapy"
la var g12_f "g12_f. No professional services can be accessed"
la var g12_v "g12_v. Other"

la var h1_a "h1_a. Household head"
la var h1_b "h1_b. Wife/husband of the household head"
la var h1_c "h1_c. Son or son-in-law of the household head"
la var h1_d "h1_d. Daughter or daughter-in-law of the household head"
la var h1_e "h1_e. Father or father-in-law of the household head"
la var h1_f "h1_f. Mother or mother-in-law of the household head"
la var h1_g "h1_g. Another male family member"
la var h1_h "h1_h. Another female family member"
la var h1_i "h1_i. Other/not a member of this household"
la var h1_w "h1_w. No one is working"

la var h24_a "h24_a. Yes, they are looking for a job"
la var h24_b "h24_b. Yes, they have acquired a new job"
la var h24_c "h24_c. Yes, they have acquired a side job"
la var h24_d "h24_d. Yes, they are setting up a business"
la var h24_e "h24_e. Yes, they have opened a new business"
la var h24_f "h24_f. Someone lost their job"
la var h24_w "h24_w. Nothing changes"

la var h26_a "h26_a. Using savings as seed money"
la var h26_b "h26_b. Selling assets for seed money"
la var h26_c "h26_c. Seeking loans from family or friends for seed money"
la var h26_d "h26_d. Seeking loans from banks or financial institutions for seed money"
la var h26_e "h26_e. Seeking loans from government programs such as KUR, Mekaar, UMI for seed money"
la var h26_w "h26_w. Inapplicable"
la var h26_y "h26_y. No idea yet"

la var h29_a "h29_a. Yes, since before April 2020"
la var h29_b "h29_b. Yes, since April 2020"
la var h29_c "h29_c. No"
*la var h29_w "h29_w. Irrelevant because no household member under 18 years of age"

la var h30_a "h30_a. Agriculture, Plantation, Forestry, Hunting & Fisheries"
la var h30_b "h30_b. Mining and Quarrying"
la var h30_c "h30_c. Industry"
la var h30_d "h30_d. Utilities"
la var h30_e "h30_e. Construction"
la var h30_f "h30_f. Trade, Restaurants and Accommodation Services"
la var h30_g "h30_g. Transportation, Warehousing, and Communication"
la var h30_h "h30_h. Financial Institutions, Real Estate, Rental Business & Corporate Services"
la var h30_i "h30_i. Community, Social and Individual Services"

la var i3_a "i3_a. Losing his/her main income"
la var i3_b "i3_b. Looking for additional income"
la var i3_c "i3_c. Making use of his/her free time"
la var i3_d "i3_d. Inspired by/following colleagues"
la var i3_e "i3_e. Helping others/surrounding neighborhood"
*la var i3_f "i3_f. Additional income"
la var i3_v "i3_v. Others"

la var i6_a "i6_a. Adding social media online marketing"
la var i6_b "i6_b. Adding marketplace marketing"
la var i6_c "i6_c. Adding marketing though online delivery service apps"
la var i6_d "i6_d. No changes, already use online platforms before"
la var i6_e "i6_e. No changes, only conventional marketing"
la var i6_f "i6_f. Stockpiling products while waiting for the moment to sell"
la var i6_v "i6_v. Others"

la var i7_a "i7_a. Buyers increase"
la var i7_b "i7_b. Buyers decrease"
la var i7_c "i7_c. Operating and raw material costs increase"
la var i7_d "i7_d. Operating and raw material costs decrease"
la var i7_e "i7_e. Goods delivery/distribution is difficult"
la var i7_f "i7_f. Raw material availability is disrupted"
la var i7_g "i7_g. Revenues increase"
la var i7_h "i7_h. Revenues decrease"
la var i7_i "i7_i. Capital decreases"
la var i7_j "i7_j. Cannot pay business installments loans"
la var i7_v "i7_v. Others"
la var i7_w "i7_w. Not applicable (not affected by the COVID-19)"

la var i8_a "i8_a. Reducing the number of employees"
la var i8_b "i8_b. Temporarily laying off some employees"
la var i8_c "i8_c. Increasing the number of employees"
la var i8_d "i8_d. Not paying employees"
la var i8_e "i8_e. Reducing employee salaries"
la var i8_f "i8_f. Raising employee salaries"
la var i8_g "i8_g. Not giving bonuses"
la var i8_h "i8_h. Reducing less important purchases/expenses"
la var i8_i "i8_i. Reducing business hours"
la var i8_j "i8_j. Selling online/via apps"
la var i8_k "i8_k. Reducing seed money/selling assets"
la var i8_l "i8_l. Increasing seed money/buying assets"
la var i8_m "i8_m. Replacing the product"
la var i8_n "i8_n. Temporarily closing business"
la var i8_v "i8_v. Others"
la var i8_w "i8_w. Not applicable (No specific strategy is applied)"

la var i9_a "i9_a. Yes, a child/children in this household"
la var i9_b "i9_b. Yes, a child/children but not from this household"
la var i9_c "i9_c. No"

la var i10_a "i10_a. Yes, with money"
la var i10_b "i10_b. Yes, with goods"
la var i10_c "i10_c. Uncertain payment"
la var i10_d "i10_d. Unpaid"

la var i11_a "i11_a. Business profits"
la var i11_b "i11_b. Savings"
la var i11_c "i11_c. Assets"
la var i11_d "i11_d. Family or friends"
la var i11_e "i11_e. Cooperatives"
la var i11_f "i11_f. Commercial banks (KUR)"
la var i11_g "i11_g. Commercial banks or credit bank (BPR), programs aside from KUR"
la var i11_h "i11_h. Leasing"
la var i11_i "i11_i. Pawnshops"
la var i11_j "i11_j. Online loans"
la var i11_k "i11_k. Microcredit programs"
la var i11_l "i11_l. Loan shark"
la var i11_m "i11_m. Village-owned enterprises (BUMDes)"

la var i12_a "i12_a. From family or friends"
la var i12_b "i12_b. From cooperatives"
la var i12_c "i12_c. From commercial banks (KUR)"
la var i12_d "i12_d. From commercial banks or credit bank (BPR), programs aside from KUR"
la var i12_e "i12_e. From leasing"
la var i12_f "i12_f. From pawnshops"
la var i12_g "i12_g. rom online loans"
la var i12_h "i12_h. From microcredit programs"
la var i12_i "i12_i. From loan shark"
la var i12_j "i12_j. From village-owned enterprises (BUMDes)"
la var i12_w "i12_w. Have no business debts/loans"

la var i15_a "i15_a. As additional capital"
la var i15_b "i15_b. As new capital"
la var i15_c "i15_c. Paying workers"
la var i15_d "i15_d. Paying suppliers"
la var i15_e "i15_e. Paying business installments loans"
la var i15_f "i15_f. Paying marketing costs"
la var i15_g "i15_g. Buying household necessities"
la var i15_v "i15_v. Others"

la var b3 "b3. Know: HH head age" 
la var b8cx "b8cx. Know: chronic"
la var b8dx "b8dx. Know: infectious"
la var c12x "c12x. Know: total assistance"
la var d3x "d3x. Know: food expenses"
la var d4x "d4x. Know: non-food expenses"
la var d10x "d10x. Know: income changes"
la var d11x "d11x. Know: income"
la var h12x "h12x. Know: work hours"
/*
la var a6 "a6. Main phone number available"
la var a7 "a7. Other phone number available"
*/
la var fint "Interview End Time"
}

*set trace on
/*------------------------------------------------------------------------------
English Label Values
-------------------------------------------------------------------------------- */

{
*MODULE ID & A*
la de id5 1 "Urban" 2 "Rural", modify
la val id5 id5
la de id12 1 "Yes" 2 "No", modify
la val id12 id12
la de a_check1 1 "Yes" 2 "No", modify
la val a_check1 a_check1

/*
la de a2 1 "Death" 2 "Divorce" 3 "Migration" 4 "Others", modify
la de a6 1 "Yes, there is" 96 "No", modify
la val a6 a6
la de a7 1 "Yes, there is" 96 "No", modify
la val a7 a7
*/
*MODULE B*
la de b1 1 "I am the head of this household" 2 "Wife/husband" 3 "Child/stepchild/adopted child" 4 "Child-in-law" 5 "Grandchild" 6 "Mother/father or mother-/father-in-law"  95 "Other member of the household", modify
la val b1 b1
la de b2 1 "Male" 2 "Female", modify
la val b2 b2
la de b3 1 "Yes " 8 "Don't know", modify
la val b3 b3
la de b4 1 "Never attended school or not completed elementary school." 2 "Elementary school (MI/Paket A)" 3 "Junior high school (MTs/Paket B)" 4 "Senior high school (SMK/MA/Paket C)" 5 "Diploma degree (D1/D2/D3/D4)" 6 "Bachelor/master/doctoral/professional degree" 8 "Don’t know", modify
la val b4 b4
la de b5 1 "Married" 2 "Widowed" 3 "Divorced" 4 "Single", modify
la val b5 b5
la de b6 1 "Male" 2 "Female", modify
la val b6 b6
la de b8c 1 "Yes" 0 "No", modify
la val b8c b8c
la de b8cx 1 "Yes, I know" 98 "Don't know", modify
la val b8cx b8cx
la de b8d 1 "Yes" 0 "No", modify
la val b8d b8d
la de b8dx 1 "Yes, I know" 98 "Don't know", modify
la val b8dx b8dx
la de b9 1 "Yes, around this house" 2 "No one" 8 "Don't know", modify
la val b9 b9
la de b10 1 "Loss of job/reduced income" 2 "Increased workload and household chores" 3 "Worsened physical health" 4 "Worsened mental health" 5 "Disrupted child’s education" 6 "Interrupted access to healthcare services"  7 "Interrupted access to other public services"  8 "Loss of family member"  95 "Others" 96 "None", modify
la val b10 b10
la de b11 1 "Household head" 2 "Wife/husband of the household head" 3 "Son or son-in-law of the household head" 4 "Daughter or daughter-in-law of the household head" 5 "Father or father-in-law of the household head" 6 "Mother or mother-in-law of the household head"  7 "Another household member"  8 "Divided equally among all household members"  9 "Household helper/assistant" 96 "Others/not a member of this household", modify
la val b11 b11
la de b12 1 "Household head" 2 "Wife/husband of the household head" 3 "Son or son-in-law of the household head" 4 "Daughter or daughter-in-law of the household head" 5 "Father or father-in-law of the household head" 6 "Mother or mother-in-law of the household head"  7 "Another household member"  8 "Divided equally among all household members"  9 "Household helper/assistant" 96 "Others/not a member of this household", modify
la val b12 b12
la de b13 1 "Decided together by all members of the household" 2 "Decided by the household head and spouse" 3 "Decided by the household head alone" 4 "Decided by the spouse alone" 5 "Decided by an older member of the family", modify
la val b13 b13
la de b14 1 "Spending more time than before" 2 "Time spent is just the same." 3 "Spending less time than before" 96 "Irrelevant (not part of my responsibilities)", modify
la val b14 b14
la de b15 1 "Yes, just started to use it" 2 "Yes, use it more often" 3 "Yes, but there is no difference" 4 "Yes, use it less often" 96 "Never use the internet", modify
la val b15 
 
*MODULE C*
la de c1a_a 100 "Yes" 0 "No", modify
la val c1a_a c1a_a
la de c1a_b 100 "Yes" 0 "No", modify
la val c1a_b c1a_b
la de c1a_c 100 "Yes" 0 "No", modify
la val c1a_c c1a_c
la de c1a_d 100 "Yes" 0 "No", modify
la val c1a_d c1a_d
la de c1a_w 100 "Yes" 0 "No", modify
la val c1a_w c1a_w
la de c1b 1 "Yes, have received since before April 2020" 2 "Yes, have received since April 2020" 3 "No", modify
la val c1b c1b
la de c1c 1 "Yes" 2 "No" 96 "Irrelevant as none of the household members is an active member of BPJS Ketenagakerjaan", modify
la val c1c c1c
la de c1d 1 "Yes" 2 "No, but already applied for it" 3 "Did not receive and did not apply", modify 
la val c1d c1d
la de c_check1 1 "Yes" 2 "No", modify
la val c_check1 c_check1
la de c2_a 100 "Yes" 0 "No", modify
la val c2_a c2_a
la de c2_b 100 "Yes" 0 "No", modify
la val c2_b c2_b
la de c2_c 100 "Yes" 0 "No", modify
la val c2_c c2_c
la de c2_d 100 "Yes" 0 "No", modify
la val c2_d c2_d
la de c2_e 100 "Yes" 0 "No", modify
la val c2_e c2_e
la de c2_f 100 "Yes" 0 "No", modify
la val c2_f c2_f
la de c2_g 100 "Yes" 0 "No", modify
la val c2_g c2_g
la de c2_h 100 "Yes" 0 "No", modify
la val c2_h c2_h
la de c2_i 100 "Yes" 0 "No", modify
la val c2_i c2_i
la de c2_j 100 "Yes" 0 "No", modify
la val c2_j c2_j
la de c3a 1 "Yes" 2 "No", modify
la val c3a c3a
la de c3b 1 "Yes" 2 "No" 96 "Irrelevant", modify
la val c3b c3b
la de c3c 1 "Yes" 2 "No" 96 "Irrelevant", modify
la val c3c c3c
la de c3d 1 "Yes" 2 "Didn’t make use of it or did not receive even though under an installment plan" 96 "Irrelevant", modify 
la val c3d c3d
la de c4 1 "450 watts" 2 "900 watts" 3 "1,300 watts" 4 "2,200 watts" 5 "More than 2,200 watts" 6 "Don’t have electricity meter/using neighbor’s electricity"  7 "Not using electricity from PLN/no electricity at this house", modify
la val c4 c4
la de c5 1 "Yes" 2 "No" 8 "Don’t know", modify
la val c5 c5
la de c_check2 1 "Yes" 2 "No", modify
la val c_check2 c_check2
la de c6 1 "Very fair" 2 "Fair enough" 3 "Not really fair" 4 "Unfair" 5 "Know about social assistances given in the neighborhood but don’t know about the disbursement process" 6 "Never heard of any social assistance given", modify
la val c6 c6
la de c6a_a 100 "Yes" 0 "No", modify
la val c6a_a c6a_a
la de c6a_b 100 "Yes" 0 "No", modify
la val c6a_b c6a_b
la de c6a_c 100 "Yes" 0 "No", modify
la val c6a_c c6a_c
la de c6a_d 100 "Yes" 0 "No", modify
la val c6a_d c6a_d
la de c6a_v 100 "Yes" 0 "No", modify
la val c6a_v c6a_v
la de c6b_a 100 "Yes" 0 "No", modify
la val c6b_a c6b_a
la de c6b_b 100 "Yes" 0 "No", modify
la val c6b_b c6b_b
la de c6b_c 100 "Yes" 0 "No", modify
la val c6b_c c6b_c
la de c6b_d 100 "Yes" 0 "No", modify
la val c6b_d c6b_d
la de c6b_e 100 "Yes" 0 "No", modify
la val c6b_e c6b_e
la de c6b_f 100 "Yes" 0 "No", modify
la val c6b_f c6b_f
la de c6b_v 100 "Yes" 0 "No", modify
la val c6b_v c6b_v
la de c7 1 "Yes" 2 "No", modify
la val c7 c7
la de c8 1 "Money" 2 "Staple food" 3 "Electricity bill discount" 4 "Deferment of installments" 5 "Seed money assistance" 6 "Reduction in  Education fee/other forms of assistance for education fees"  7 "Subsidies for cell phone credit or internet package"  8 "Healthcare equipment/services"  95 "Others", modify
la val c8 c8
la de c9_a 100 "Yes" 0 "No", modify
la val c9_a c9_a
la de c9_b 100 "Yes" 0 "No", modify
la val c9_b c9_b
la de c9_c 100 "Yes" 0 "No", modify
la val c9_c c9_c
la de c9_d 100 "Yes" 0 "No", modify
la val c9_d c9_d
la de c9_w 100 "Yes" 0 "No", modify
la val c9_w c9_w
la de c10_a 100 "Yes" 0 "No", modify
la val c10_a c10_a
la de c10_b 100 "Yes" 0 "No", modify
la val c10_b c10_b
la de c10_c 100 "Yes" 0 "No", modify
la val c10_c c10_c
la de c10_d 100 "Yes" 0 "No", modify
la val c10_d c10_d
la de c10_w 100 "Yes" 0 "No", modify
la val c10_w c10_w
la de c11 1 "Received assistance from both, but the government assistance is more helpful" 2 "Received assistance from both, but the assistance from nongovernmental organization is more helpful" 3 "Received assistance from both and they are equally helpful" 4 "Received assistance from both and none of them are helpful" 5 "Only received government assistance and it is helpful" 6 "Only received government assistance but it is not helpful"  7 "Only received assistance from the other parties and it is helpful"  8 "Only received assistance from the other parties but it is not helpful", modify
la val c11 c11
la de c12x 1 "Yes, I know" 998 "Don't know"
la val c12x c12x
 
 
*MODULE D*
la de d1 1 "Household head’s appetite" 2 "Another household adult’s appetite" 3 "Household children’s appetite" 4 "Every member’s appetite (cook many type of meals)" 5 "What is available at the house on that day" 6 "What is sold at the market/seller"  7 "Grocery money sufficiency"  95 "Others", modify
la val d1 d1
la de d2a 1 "Yes, because of COVID-19 pandemic" 2 "Yes, because of other reasons" 3 "No" 8 "Don’t know" 97 "Refuse to answer", modify
la val d2a d2a
la de d2b 1 "Yes, because of COVID-19 pandemic" 2 "Yes, because of other reasons" 3 "No" 8 "Don’t know" 97 "Refuse to answer", modify
la val d2b d2b
la de d2c 1 "Yes, because of COVID-19 pandemic" 2 "Yes, because of other reasons" 3 "No" 8 "Don’t know" 97 "Refuse to answer", modify
la val d2c d2c
la de d2d 1 "Yes, because of COVID-19 pandemic" 2 "Yes, because of other reasons" 3 "No" 8 "Don’t know" 97 "Refuse to answer", modify
la val d2d d2d
la de d2e 1 "Yes, because of COVID-19 pandemic" 2 "Yes, because of other reasons" 3 "No" 8 "Don’t know" 97 "Refuse to answer", modify
la val d2e d2e
la de d2f 1 "Yes, because of COVID-19 pandemic" 2 "Yes, because of other reasons" 3 "No" 8 "Don’t know" 97 "Refuse to answer", modify
la val d2f d2f
la de d2g 1 "Yes, because of COVID-19 pandemic" 2 "Yes, because of other reasons" 3 "No" 8 "Don’t know" 97 "Refuse to answer", modify
la val d2g d2g
la de d2h 1 "Yes, because of COVID-19 pandemic" 2 "Yes, because of other reasons" 3 "No" 8 "Don’t know" 97 "Refuse to answer", modify
la val d2h d2h
la de d3x 1 "Yes, I know" 997 "Refuse to answer" 998 "Don’t know", modify 
la val d3x d3x
la de d4x 1 "Yes, I know" 997 "Refuse to answer" 998 "Don’t know", modify 
la val d4x d4x
la de d5 1 "Current expenditure is higher than in January" 2 "Current expenditure is the same or unchanged compared to January" 3 "Current expenditure is lower than in January", modify 
la val d5 d5
la de d6_a 100 "Yes" 0 "No", modify
la val d6_a d6_a
la de d6_b 100 "Yes" 0 "No", modify
la val d6_b d6_b
la de d6_c 100 "Yes" 0 "No", modify
la val d6_c d6_c
la de d6_d 100 "Yes" 0 "No", modify
la val d6_d d6_d
la de d6_e 100 "Yes" 0 "No", modify
la val d6_e d6_e
la de d6_f 100 "Yes" 0 "No", modify
la val d6_f d6_f
la de d6_g 100 "Yes" 0 "No", modify
la val d6_g d6_g
la de d6_h 100 "Yes" 0 "No", modify
la val d6_h d6_h
la de d6_i 100 "Yes" 0 "No", modify
la val d6_i d6_i
la de d6_j 100 "Yes" 0 "No", modify
la val d6_j d6_j
la de d6_v 100 "Yes" 0 "No", modify
la val d6_v d6_v
la de d7_a 100 "Yes" 0 "No", modify
la val d7_a d7_a
la de d7_b 100 "Yes" 0 "No", modify
la val d7_b d7_b
la de d7_c 100 "Yes" 0 "No", modify
la val d7_c d7_c
la de d7_d 100 "Yes" 0 "No", modify
la val d7_d d7_d
la de d7_e 100 "Yes" 0 "No", modify
la val d7_e d7_e
la de d7_f 100 "Yes" 0 "No", modify
la val d7_f d7_f
la de d7_g 100 "Yes" 0 "No", modify
la val d7_g d7_g
la de d7_h 100 "Yes" 0 "No", modify
la val d7_h d7_h
la de d7_i 100 "Yes" 0 "No", modify
la val d7_i d7_i
la de d7_j 100 "Yes" 0 "No", modify
la val d7_j d7_j
la de d7_v 100 "Yes" 0 "No", modify
la val d7_v d7_v
la de d8_a 100 "Yes" 0 "No", modify
la val d8_a d8_a
la de d8_b 100 "Yes" 0 "No", modify
la val d8_b d8_b
la de d8_c 100 "Yes" 0 "No", modify
la val d8_c d8_c
la de d8_d 100 "Yes" 0 "No", modify
la val d8_d d8_d
la de d8_e 100 "Yes" 0 "No", modify
la val d8_e d8_e
la de d8_f 100 "Yes" 0 "No", modify
la val d8_f d8_f
la de d8_g 100 "Yes" 0 "No", modify
la val d8_g d8_g
la de d8_h 100 "Yes" 0 "No", modify
la val d8_h d8_h
la de d8_v 100 "Yes" 0 "No", modify
la val d8_v d8_v
la de d8_w 100 "Yes" 0 "No", modify
la val d8_w d8_w
la de d9 1 "Current income is higher than in January" 2 "Current income is the same or unchanged compared to January" 3 "Current income is lower than in January", modify
la val d9 d9
la de d10x 1 "Yes, I know" 997 "Refuse to answer" 998 "Don’t know", modify
la val d10x d10x
la de d11x 1 "Yes, I know" 997 "Refuse to answer" 998 "Don’t know", modify
la val d11x d11x
la de d12_a 100 "Yes" 0 "No", modify
la val d12_a d12_a
la de d12_b 100 "Yes" 0 "No", modify
la val d12_b d12_b
la de d12_c 100 "Yes" 0 "No", modify
la val d12_c d12_c
la de d12_d 100 "Yes" 0 "No", modify
la val d12_d d12_d
la de d12_e 100 "Yes" 0 "No", modify
la val d12_e d12_e
la de d12_f 100 "Yes" 0 "No", modify
la val d12_f d12_f
la de d12_g 100 "Yes" 0 "No", modify
la val d12_g d12_g
la de d12_h 100 "Yes" 0 "No", modify
la val d12_h d12_h
la de d12_i 100 "Yes" 0 "No", modify
la val d12_i d12_i
la de d12_j 100 "Yes" 0 "No", modify
la val d12_j d12_j
la de d12_k 100 "Yes" 0 "No", modify
la val d12_k d12_k
la de d12_l 100 "Yes" 0 "No", modify
la val d12_l d12_l
la de d8_w 100 "Yes" 0 "No", modify
la val d8_w d8_w
la de d_check1 1 "Yes" 2 "No" 3 "Irrelevant (did not answer H or I in D12)" 
la val d_check1 d_check1
la de d13a 1 "Yes" 2 "No", modify
la val d13a d13a
la de d13b 1 "Yes" 2 "No", modify
la val d13b d13b
la de d13c 1 "Yes" 2 "No", modify
la val d13c d13c
la de d13d 1 "Yes" 2 "No", modify
la val d13d d13d
la de d13e 1 "Yes" 2 "No", modify
la val d13e d13e
la de d13f 1 "Yes" 2 "No", modify
la val d13f d13f
la de d13g 1 "Yes" 2 "No", modify
la val d13g d13g
la de d13h 1 "Yes" 2 "No", modify
la val d13h d13h
la de d13i 1 "Yes" 2 "No", modify
la val d13i d13i
la de d14 1 "Yes, enough to sustain my households for more than 6 months" 2 "Yes, enough to sustain my households for 4 to 6 months" 3 "Yes, enough to sustain my households for 1 to 3 months" 4 "Yes, only enough to sustain my households for less than one month" 5 "No", modify
la val d14 d14
la de d15a 1 "Yes" 2 "No", modify
la val d15a d15a
la de d15b 1 "Yes" 2 "No", modify
la val d15b d15b
la de d15c 1 "Yes" 2 "No", modify
la val d15c d15c
la de d15d 1 "Yes" 2 "No", modify
la val d15d d15d
la de d15e 1 "Yes" 2 "No", modify
la val d15e d15e
la de d15f 1 "Yes" 2 "No", modify
la val d15f d15f
la de d15g 1 "Yes" 2 "No", modify
la val d15g d15g
la de d15h 1 "Yes" 2 "No", modify
la val d15h d15h
la de d15i 1 "Yes" 2 "No", modify
la val d15i d15i
la de d15j 1 "Yes" 2 "No", modify
la val d15j d15j
la de d15k 1 "Yes" 2 "No", modify
la val d15k d15k
la de d15l 1 "Yes" 2 "No", modify
la val d15l d15l
la de d16a 1 "Yes" 2 "No" 96 "Inapplicable", modify
la val d16a d16a
la de d16b 1 "Yes" 2 "No" 96 "Inapplicable", modify
la val d16b d16b
la de d16c 1 "Yes" 2 "No" 96 "Inapplicable", modify 
la val d16c d16c
la de d16d 1 "Yes" 2 "No" 96 "Inapplicable", modify 
la val d16d d16d
la de d16e 1 "Yes" 2 "No" 96 "Inapplicable", modify
la val d16e d16e
la de d17 1 "Yes, and have been paying the installments regularly" 2 "Yes, but unable to pay the installments" 3 "Yes, and it is temporarily suspended" 4 "No debt that started before April", modify
la val d17 d17
la de d18 1 "Yes, and have been paying the installments regularly" 2 "Yes, but unable to pay the installments" 3 "Yes, and it is temporarily suspended" 4 "No debt that started since April", modify
la val d18 d18
 
*MODULE E*
la de e_check1 1 "Yes" 2 "No", modify
la val e_check1 e_check1
la de e_check2 1 "Yes, household has children under 18 years old" 2 "No, household does not has children under 18 years old", modify
la val e_check2 e_check2
la de e4 1 "Yes, same as other member of the household" 2 "No", modify
la val e4 e4
la de e5_a 100 "Yes" 0 "No", modify
la val e5_a e5_a
la de e5_b 100 "Yes" 0 "No", modify
la val e5_b e5_b
la de e5_c 100 "Yes" 0 "No", modify
la val e5_c e5_c
la de e5_d 100 "Yes" 0 "No", modify
la val e5_d e5_d
la de e5_e 100 "Yes" 0 "No", modify
la val e5_e e5_e
la de e5_f 100 "Yes" 0 "No", modify
la val e5_f e5_f
la de e5_v 100 "Yes" 0 "No", modify
la val e5_v e5_v
la de e6_a 100 "Yes" 0 "No", modify
la val e6_a e6_a
la de e6_b 100 "Yes" 0 "No", modify
la val e6_b e6_b
la de e6_c 100 "Yes" 0 "No", modify
la val e6_c e6_c
la de e6_d 100 "Yes" 0 "No", modify
la val e6_d e6_d
la de e6_e 100 "Yes" 0 "No", modify
la val e6_e e6_e
la de e6_f 100 "Yes" 0 "No", modify
la val e6_f e6_f
la de e6_g 100 "Yes" 0 "No", modify
la val e6_g e6_g
la de e6_v 100 "Yes" 0 "No", modify
la val e6_v e6_v
la de e6_w 100 "Yes" 0 "No", modify
la val e6_w e6_w
la de e7_a 100 "Yes" 0 "No", modify
la val e7_a e7_a
la de e7_b 100 "Yes" 0 "No", modify
la val e7_b e7_b
la de e7_c 100 "Yes" 0 "No", modify
la val e7_c e7_c
la de e7_d 100 "Yes" 0 "No", modify
la val e7_d e7_d
la de e7_e 100 "Yes" 0 "No", modify
la val e7_e e7_e
la de e7_f 100 "Yes" 0 "No", modify
la val e7_f e7_f
la de e7_g 100 "Yes" 0 "No", modify
la val e7_g e7_g
la de e7_h 100 "Yes" 0 "No", modify
la val e7_h e7_h
la de e7_i 100 "Yes" 0 "No", modify
la val e7_i e7_i
la de e7_j 100 "Yes" 0 "No", modify
la val e7_j e7_j
la de e7_w 100 "Yes" 0 "No", modify
la val e7_w e7_w
la de e8_a 100 "Yes" 0 "No", modify
la val e8_a e8_a
la de e8_b 100 "Yes" 0 "No", modify
la val e8_b e8_b
la de e8_c 100 "Yes" 0 "No", modify
la val e8_c e8_c
la de e8_d 100 "Yes" 0 "No", modify
la val e8_d e8_d
la de e8_e 100 "Yes" 0 "No", modify
la val e8_e e8_e
la de e8_f 100 "Yes" 0 "No", modify
la val e8_f e8_f
la de e8_w 100 "Yes" 0 "No", modify
la val e8_w e8_w
la de e10_a 100 "Yes" 0 "No", modify
la val e10_a e10_a
la de e10_b 100 "Yes" 0 "No", modify
la val e10_b e10_b
la de e10_c 100 "Yes" 0 "No", modify
la val e10_c e10_c
la de e10_d 100 "Yes" 0 "No", modify
la val e10_d e10_d
la de e10_e 100 "Yes" 0 "No", modify
la val e10_e e10_e
la de e10_f 100 "Yes" 0 "No", modify
la val e10_f e10_f
la de e10_g 100 "Yes" 0 "No", modify
la val e10_g e10_g
la de e10_h 100 "Yes" 0 "No", modify
la val e10_h e10_h
la de e10_w 100 "Yes" 0 "No", modify
la val e10_w e10_w
la de e11_a 100 "Yes" 0 "No", modify
la val e11_a e11_a
la de e11_b 100 "Yes" 0 "No", modify
la val e11_b e11_b
la de e11_c 100 "Yes" 0 "No", modify
la val e11_c e11_c
la de e11_d 100 "Yes" 0 "No", modify
la val e11_d e11_d
la de e11_e 100 "Yes" 0 "No", modify
la val e11_e e11_e
la de e11_f 100 "Yes" 0 "No", modify
la val e11_f e11_f
la de e11_g 100 "Yes" 0 "No", modify
la val e11_g e11_g
la de e11_h 100 "Yes" 0 "No", modify
la val e11_h e11_h
la de e11_i 100 "Yes" 0 "No", modify
la val e11_i e11_i
la de e11_j 100 "Yes" 0 "No", modify
la val e11_j e11_j
la de e11_w 100 "Yes" 0 "No", modify
la val e11_w e11_w
la de e12 1 "Yes" 2 "No", modify
la val e12 e12
la de e13_a 100 "Yes" 0 "No", modify
la val e13_a e13_a
la de e13_b 100 "Yes" 0 "No", modify
la val e13_b e13_b
la de e13_c 100 "Yes" 0 "No", modify
la val e13_c e13_c
la de e13_d 100 "Yes" 0 "No", modify
la val e13_d e13_d
la de e13_e 100 "Yes" 0 "No", modify
la val e13_e e13_e
la de e13_f 100 "Yes" 0 "No", modify
la val e13_f e13_f
la de e13_g 100 "Yes" 0 "No", modify
la val e13_g e13_g
la de e13_h 100 "Yes" 0 "No", modify
la val e13_h e13_h
la de e13_i 100 "Yes" 0 "No", modify
la val e13_i e13_i
la de e13_j 100 "Yes" 0 "No", modify
la val e13_j e13_j
la de e13_k 100 "Yes" 0 "No", modify
la val e13_k e13_k
la de e14_a 100 "Yes" 0 "No", modify
la val e14_a e14_a
la de e14_b 100 "Yes" 0 "No", modify
la val e14_b e14_b
la de e14_w 100 "Yes" 0 "No", modify
la val e14_w e14_w
la de e15_a 100 "Yes" 0 "No", modify
la val e15_a e15_a
la de e15_b 100 "Yes" 0 "No", modify
la val e15_b e15_b
la de e15_c 100 "Yes" 0 "No", modify
la val e15_c e15_c
la de e15_d 100 "Yes" 0 "No", modify
la val e15_d e15_d
la de e15_e 100 "Yes" 0 "No", modify
la val e15_e e15_e
la de e15_f 100 "Yes" 0 "No", modify
la val e15_f e15_f
la de e15_g 100 "Yes" 0 "No", modify
la val e15_g e15_g
la de e15_h 100 "Yes" 0 "No", modify
la val e15_h e15_h
la de e15_i 100 "Yes" 0 "No", modify
la val e15_i e15_i
la de e15_j 100 "Yes" 0 "No", modify
la val e15_j e15_j
la de e15_k 100 "Yes" 0 "No", modify
la val e15_k e15_k
la de e15_l 100 "Yes" 0 "No", modify
la val e15_l e15_l
la de e16a 1 "Yes, for boys" 2 "Yes, for girls" 3 "Yes, for boys and girls" 4 "No" 8 "No idea", modify
la val e16a e16a
la de e16b 1 "Yes, for boys" 2 "Yes, for girls" 3 "Yes, for boys and girls" 4 "No" 8 "No idea", modify
la val e16b e16b
la de e16c 1 "Yes, for boys" 2 "Yes, for girls" 3 "Yes, for boys and girls" 4 "No" 8 "No idea", modify
la val e16c e16c
la de e16d 1 "Yes, for boys" 2 "Yes, for girls" 3 "Yes, for boys and girls" 4 "No" 8 "No idea", modify
la val e16d e16d
la de e16e 1 "Yes, for boys" 2 "Yes, for girls" 3 "Yes, for boys and girls" 4 "No" 8 "No idea", modify
la val e16e e16e
 
*MODULE F*
la de f1 1 "Yes" 2 "No", modify
la val f1 f1
la de f2_a 100 "Yes" 0 "No", modify
la val f2_a f2_a
la de f2_b 100 "Yes" 0 "No", modify
la val f2_b f2_b
la de f2_c 100 "Yes" 0 "No", modify
la val f2_c f2_c
la de f2_d 100 "Yes" 0 "No", modify
la val f2_d f2_d
la de f2_e 100 "Yes" 0 "No", modify
la val f2_e f2_e
la de f2_f 100 "Yes" 0 "No", modify
la val f2_f f2_f
la de f2_g 100 "Yes" 0 "No", modify
la val f2_g f2_g
la de f2_h 100 "Yes" 0 "No", modify
la val f2_h f2_h
la de f3_a 100 "Yes" 0 "No", modify
la val f3_a f3_a
la de f3_b 100 "Yes" 0 "No", modify
la val f3_b f3_b
la de f3_c 100 "Yes" 0 "No", modify
la val f3_c f3_c
la de f3_d 100 "Yes" 0 "No", modify
la val f3_d f3_d
la de f3_e 100 "Yes" 0 "No", modify
la val f3_e f3_e
la de f3_f 100 "Yes" 0 "No", modify
la val f3_f f3_f
la de f3_g 100 "Yes" 0 "No", modify
la val f3_g f3_g
la de f3_h 100 "Yes" 0 "No", modify
la val f3_h f3_h
la de f3_i 100 "Yes" 0 "No", modify
la val f3_i f3_i
la de f4 1 "Yes" 2 "No", modify
la val f4 f4
la de f5 1 "Yes" 2 "No", modify
la val f5 f5
la de f6_a 100 "Yes" 0 "No", modify
la val f6_a f6_a
la de f6_b 100 "Yes" 0 "No", modify
la val f6_b f6_b
la de f6_c 100 "Yes" 0 "No", modify
la val f6_c f6_c
la de f6_d 100 "Yes" 0 "No", modify
la val f6_d f6_d
la de f6_e 100 "Yes" 0 "No", modify
la val f6_e f6_e
la de f6_f 100 "Yes" 0 "No", modify
la val f6_f f6_f
la de f6_g 100 "Yes" 0 "No", modify
la val f6_g f6_g
la de f6_h 100 "Yes" 0 "No", modify
la val f6_h f6_h
la de f6_i 100 "Yes" 0 "No", modify
la val f6_i f6_i
la de f7_a 100 "Yes" 0 "No", modify
la val f7_a f7_a
la de f7_b 100 "Yes" 0 "No", modify
la val f7_b f7_b
la de f7_c 100 "Yes" 0 "No", modify
la val f7_c f7_c
la de f7_d 100 "Yes" 0 "No", modify
la val f7_d f7_d
la de f7_e 100 "Yes" 0 "No", modify
la val f7_e f7_e
la de f7_f 100 "Yes" 0 "No", modify
la val f7_f f7_f
la de f7_g 100 "Yes" 0 "No", modify
la val f7_g f7_g
la de f7_h 100 "Yes" 0 "No", modify
la val f7_h f7_h
la de f8_a 100 "Yes" 0 "No", modify
la val f8_a f8_a
la de f8_b 100 "Yes" 0 "No", modify
la val f8_b f8_b
la de f8_c 100 "Yes" 0 "No", modify
la val f8_c f8_c
la de f8_d 100 "Yes" 0 "No", modify
la val f8_d f8_d
la de f8_e 100 "Yes" 0 "No", modify
la val f8_e f8_e
la de f8_f 100 "Yes" 0 "No", modify
la val f8_f f8_f
la de f8_g 100 "Yes" 0 "No", modify
la val f8_g f8_g
la de f8_h 100 "Yes" 0 "No", modify
la val f8_h f8_h
la de f8_v 100 "Yes" 0 "No", modify
la val f8_v f8_v
la de f8_w 100 "Yes" 0 "No", modify
la val f8_w f8_w
la de f9_a 100 "Yes" 0 "No", modify
la val f9_a f9_a
la de f9_b 100 "Yes" 0 "No", modify
la val f9_b f9_b
la de f9_c 100 "Yes" 0 "No", modify
la val f9_c f9_c
la de f9_d 100 "Yes" 0 "No", modify
la val f9_d f9_d
la de f9_e 100 "Yes" 0 "No", modify
la val f9_e f9_e
la de f9_y 100 "Yes" 0 "No", modify
la val f9_y f9_y
la de f10_a 100 "Yes" 0 "No", modify
la val f10_a f10_a
la de f10_b 100 "Yes" 0 "No", modify
la val f10_b f10_b
la de f10_c 100 "Yes" 0 "No", modify
la val f10_c f10_c
la de f10_d 100 "Yes" 0 "No", modify
la val f10_d f10_d
la de f10_e 100 "Yes" 0 "No", modify
la val f10_e f10_e
la de f10_f 100 "Yes" 0 "No", modify
la val f10_f f10_f
la de f10_g 100 "Yes" 0 "No", modify
la val f10_g f10_g
la de f10_h 100 "Yes" 0 "No", modify
la val f10_h f10_h
la de f11 1 "Yes" 2 "No" 7 "Refuse to answer", modify
la val f11 f11
la de f12_a 100 "Yes" 0 "No", modify
la val f12_a f12_a
la de f12_b 100 "Yes" 0 "No", modify
la val f12_b f12_b
la de f12_c 100 "Yes" 0 "No", modify
la val f12_c f12_c
la de f12_d 100 "Yes" 0 "No", modify
la val f12_d f12_d
la de f12_e 100 "Yes" 0 "No", modify
la val f12_e f12_e
la de f12_f 100 "Yes" 0 "No", modify
la val f12_f f12_f
la de f12_g 100 "Yes" 0 "No", modify
la val f12_g f12_g
la de f12_h 100 "Yes" 0 "No", modify
la val f12_h f12_h
la de f12_i 100 "Yes" 0 "No", modify
la val f12_i f12_i
la de f12_x 100 "Yes" 0 "No", modify
la val f12_x f12_x
 
*MODULE G*
la de g1_a 100 "Yes" 0 "No", modify
la val g1_a g1_a
la de g1_b 100 "Yes" 0 "No", modify
la val g1_b g1_b
la de g1_c 100 "Yes" 0 "No", modify
la val g1_c g1_c
la de g1_d 100 "Yes" 0 "No", modify
la val g1_d g1_d
la de g1_e 100 "Yes" 0 "No", modify
la val g1_e g1_e
la de g1_f 100 "Yes" 0 "No", modify
la val g1_f g1_f
la de g1_g 100 "Yes" 0 "No", modify
la val g1_g g1_g
la de g1_h 100 "Yes" 0 "No", modify
la val g1_h g1_h
la de g1_x 100 "Yes" 0 "No", modify
la val g1_x g1_x
la de g1_y 100 "Yes" 0 "No", modify
la val g1_y g1_y
la de g2_a 100 "Yes" 0 "No", modify
la val g2_a g2_a
la de g2_b 100 "Yes" 0 "No", modify
la val g2_b g2_b
la de g2_c 100 "Yes" 0 "No", modify
la val g2_c g2_c
la de g2_d 100 "Yes" 0 "No", modify
la val g2_d g2_d
la de g3_a 100 "Yes" 0 "No", modify
la val g3_a g3_a
la de g3_b 100 "Yes" 0 "No", modify
la val g3_b g3_b
la de g3_c 100 "Yes" 0 "No", modify
la val g3_c g3_c
la de g4 1 "Daily activities" 2 "Working activities" 3 "Access to medicine, therapy services or healthcare facilities" 4 "Psychological disturbances" 5 "Access to clean water and sanitation" 95 "Others"  96 "None", modify
la val g4 g4
la de g5_a 100 "Yes" 0 "No", modify
la val g5_a g5_a
la de g5_b 100 "Yes" 0 "No", modify
la val g5_b g5_b
la de g5_c 100 "Yes" 0 "No", modify
la val g5_c g5_c
la de g5_d 100 "Yes" 0 "No", modify
la val g5_d g5_d
la de g5_e 100 "Yes" 0 "No", modify
la val g5_e g5_e
la de g5_f 100 "Yes" 0 "No", modify
la val g5_f g5_f
la de g5_v 100 "Yes" 0 "No", modify
la val g5_v g5_v
la de g5_w 100 "Yes" 0 "No", modify
la val g5_w g5_w
la de g6_a 100 "Yes" 0 "No", modify
la val g6_a g6_a
la de g6_b 100 "Yes" 0 "No", modify
la val g6_b g6_b
la de g6_c 100 "Yes" 0 "No", modify
la val g6_c g6_c
la de g6_d 100 "Yes" 0 "No", modify
la val g6_d g6_d
la de g6_e 100 "Yes" 0 "No", modify
la val g6_e g6_e
la de g6_y 100 "Yes" 0 "No", modify
la val g6_y g6_y
la de g7 1 "Yes" 2 "No", modify
la val g7 g7
la de g8_a 100 "Yes" 0 "No", modify
la val g8_a g8_a
la de g8_b 100 "Yes" 0 "No", modify
la val g8_b g8_b
la de g8_c 100 "Yes" 0 "No", modify
la val g8_c g8_c
la de g8_d 100 "Yes" 0 "No", modify
la val g8_d g8_d
la de g8_e 100 "Yes" 0 "No", modify
la val g8_e g8_e
la de g8_f 100 "Yes" 0 "No", modify
la val g8_f g8_f
la de g8_g 100 "Yes" 0 "No", modify
la val g8_g g8_g
la de g8_v 100 "Yes" 0 "No", modify
la val g8_v g8_v
la de g9 1 "Yes" 2 "No", modify
la val g9 g9
la de g10_a 100 "Yes" 0 "No", modify
la val g10_a g10_a
la de g10_b 100 "Yes" 0 "No", modify
la val g10_b g10_b
la de g10_c 100 "Yes" 0 "No", modify
la val g10_c g10_c
la de g10_d 100 "Yes" 0 "No", modify
la val g10_d g10_d
la de g10_e 100 "Yes" 0 "No", modify
la val g10_e g10_e
la de g10_f 100 "Yes" 0 "No", modify
la val g10_f g10_f
la de g10_g 100 "Yes" 0 "No", modify
la val g10_g g10_g
la de g10_h 100 "Yes" 0 "No", modify
la val g10_h g10_h
la de g10_v 100 "Yes" 0 "No", modify
la val g10_v g10_v
la de g11 1 "Yes" 2 "No", modify
la val g11 g11
la de g12_a 100 "Yes" 0 "No", modify
la val g12_a g12_a
la de g12_b 100 "Yes" 0 "No", modify
la val g12_b g12_b
la de g12_c 100 "Yes" 0 "No", modify
la val g12_c g12_c
la de g12_d 100 "Yes" 0 "No", modify
la val g12_d g12_d
la de g12_e 100 "Yes" 0 "No", modify
la val g12_e g12_e
la de g12_f 100 "Yes" 0 "No", modify
la val g12_f g12_f
la de g12_v 100 "Yes" 0 "No", modify
la val g12_v g12_v
 
*MODULE H*
la de h1_a 100 "Yes" 0 "No", modify
la val h1_a h1_a
la de h1_b 100 "Yes" 0 "No", modify
la val h1_b h1_b
la de h1_c 100 "Yes" 0 "No", modify
la val h1_c h1_c
la de h1_d 100 "Yes" 0 "No", modify
la val h1_d h1_d
la de h1_e 100 "Yes" 0 "No", modify
la val h1_e h1_e
la de h1_f 100 "Yes" 0 "No", modify
la val h1_f h1_f
la de h1_g 100 "Yes" 0 "No", modify
la val h1_g h1_g
la de h1_h 100 "Yes" 0 "No", modify
la val h1_h h1_h
la de h1_i 100 "Yes" 0 "No", modify
la val h1_i h1_i
la de h1_w 100 "Yes" 0 "No", modify
la val h1_w h1_w
la de h3 1 "Household head" 2 "Wife/husband" 3 "Son or son-in-law" 4 "Daughter or daughter-in-law" 5 "Father or father-in-law" 6 "Mother or mother-in-law"  7 "Other male family members"  8 "Other female family members"  95 "Others (people who have no relationship with the household head)" 96 "No one is working", modify
la val h3 h3
la de h4 1 "Yes" 2 "No", modify
la val h4 h4
la de h5 1 "Yes" 2 "No", modify
la val h5 h5
la de h6 1 "Yes" 2 "No", modify
la val h6 h6
la de h7 1 "March 2020" 2 "April 2020" 3 "May 2020" 4 "June 2020" 5 "July 2020" 6 "August 2020"  7 "September 2020"  8 "October 2020", modify
la val h7 h7
la de h8 1 "Yes, and the amount is the same" 2 "Yes, but the amount is reduced" 3 "No", modify 
la val h8 h8
la de h9 1 "Yes" 2 "No" 8 "Don’t know", modify
la val h9 h9
la de h_check1 1 "Yes" 2 "No", modify
la val h_check1 h_check1
la de h10 1 "Agriculture, Plantation, Forestry, Hunting & Fisheries" 2 "Mining and Quarrying" 3 "Industry" 4 "Utilities" 5 "Construction" 6 "Trade, Restaurants and Accommodation Services"  7 "Transportation, Warehousing, and Communication"  8 "Financial Institutions, Real Estate, Rental Business & Corporate Services" 9 "Community, Social and Individual Services", modify
la val h10 h10
la de h11 1 "Self employed" 2 "Employer assisted by temporary workers/unpaid/family workers" 3 "Employer assisted by permanent/paid workers" 4 "Laborer/employee" 5 "Casual employee in agriculture sector" 6 "Casual employee in non-agriculture sectors"  7 "Family/unpaid worker", modify
la val h11 h11
la de h12x 1 "Yes, I know" 888 "Don’t know", modify
la val h12x h12x
la de h13 1 "Completely working from home since before the pandemic/April 2020" 2 "Completely working from home since the pandemic/April 2020" 3 "Alternately working from home and at workplace" 4 "Completely working at workplace", modify
la val h13 h13
la de h14 1 "Monthly" 2 "Weekly" 3 "Daily" 4 "Lump-sum" 5 "Paid per unit of deliverables" 6 "Commissions or tips"  7 "Seasonal"  96 "Irrelevant", modify
la val h14 h14
la de h15 1 "Salary and allowances increased" 2 "Salary and allowances were reduced/deducted" 3 "Temporarily laid off" 4 "Terminated by the company (permanent layoffs)" 5 "Working at home is less conducive" 6 "No jobs were offered/number of jobs declined"  95 "Other"  96 "Irrelevant/Not affected", modify
la val h15 h15
la de h16 1 "Yes, since before April 2020" 2 "Yes, since April 2020" 3 "No", modify 
la val h16 h16
la de h17 1 "Yes, since before April 2020" 2 "Yes, since April 2020" 3 "No", modify 
la val h17 h17
la de h18 1 "Yes, since before April 2020" 2 "Yes, since April 2020" 3 "No", modify
la val h18 h18
la de h_check2 1 "Yes" 2 "No", modify
la val h_check2 h_check2
la de h19 1 " Feeling responsible for earning a living/assisting the economy of households or families " 2 "Getting more income" 3 "Current work less appropriate" 4 "Permanently laid off" 5 "Business closed"  6 "Out of/running out of contract"  7 "Helping others/surrounding neighboorhood" 95 "Other", modify
la val h19 h19
la de h20 1 "Yes, stopped/changed work/business because of the COVID-19 pandemic" 2 "Yes, stoped/changed work/business because of other reasons" 3 "No", modify 
la val h20 h20
la de h21 1 "March 2020" 2 "April 2020" 3 "May 2020" 4 "June 2020" 5 "July 2020" 6 "August 2020"  7 "September 2020"  8 "October 2020", modify
la val h21 h21
la de h22 1 "Agriculture, Plantation, Forestry, Hunting & Fisheries" 2 "Mining and Quarrying" 3 "Industry" 4 "Utilities" 5 "Construction" 6 "Trade, Restaurants and Accommodation Services"  7 "Transportation, Warehousing, and Communication"  8 "Financial Institutions, Real Estate, Rental Business & Corporate Services" 9 "Community, Social and Individual Services", modify
la val h22 h22
la de h23 1 "Self employed" 2 "Employer assisted by temporary workers/unpaid/family workers" 3 "Employer assisted by permanent/paid workers" 4 "Laborer/employee" 5 "Casual employee in agriculture sector" 6 "Casual employee in non-agriculture sectors"  7 "Family/unpaid worker", modify
la val h23 h23
la de h24_a 100 "Yes" 0 "No", modify
la val h24_a h24_a
la de h24_b 100 "Yes" 0 "No", modify
la val h24_b h24_b
la de h24_c 100 "Yes" 0 "No", modify
la val h24_c h24_c
la de h24_d 100 "Yes" 0 "No", modify
la val h24_d h24_d
la de h24_e 100 "Yes" 0 "No", modify
la val h24_e h24_e
la de h24_f 100 "Yes" 0 "No", modify
la val h24_f h24_f
la de h24_w 100 "Yes" 0 "No", modify
la val h24_w h24_w
la de h25 1 "Yes" 2 "No", modify
la val h25 h25
la de h26_a 100 "Yes" 0 "No", modify
la val h26_a h26_a
la de h26_b 100 "Yes" 0 "No", modify
la val h26_b h26_b
la de h26_c 100 "Yes" 0 "No", modify
la val h26_c h26_c
la de h26_d 100 "Yes" 0 "No", modify
la val h26_d h26_d
la de h26_e 100 "Yes" 0 "No", modify
la val h26_e h26_e
la de h26_w 100 "Yes" 0 "No", modify
la val h26_w h26_w
la de h26_y 100 "Yes" 0 "No", modify
la val h26_y h26_y
la de h27 1 "Yes" 2 "No" 96 "Irrelevant because they did not have JHT", modify
la val h27 h27
la de h28 1 "Yes" 2 "No" 96 "Irrelevant because they are not registered as BPJS Kesehatan participant", modify
la val h28 h28
la de h29_a 100 "Yes" 0 "No", modify
la val h29_a h29_a
la de h29_b 100 "Yes" 0 "No", modify
la val h29_b h29_b
la de h29_c 100 "Yes" 0 "No", modify
la val h29_c h29_c
*la de h29_w 100 "Yes" 0 "No", modify
*la val h29_w h29_w
la de h30_a 100 "Yes" 0 "No", modify
la val h30_a h30_a
la de h30_b 100 "Yes" 0 "No", modify
la val h30_b h30_b
la de h30_c 100 "Yes" 0 "No", modify
la val h30_c h30_c
la de h30_d 100 "Yes" 0 "No", modify
la val h30_d h30_d
la de h30_e 100 "Yes" 0 "No", modify
la val h30_e h30_e
la de h30_f 100 "Yes" 0 "No", modify
la val h30_f h30_f
la de h30_g 100 "Yes" 0 "No", modify
la val h30_g h30_g
la de h30_h 100 "Yes" 0 "No", modify
la val h30_h h30_h
la de h30_i 100 "Yes" 0 "No", modify
la val h30_i h30_i
 
*MODULE I*
la de i1 1 "Yes, a male member of the household" 2 "Yes, a female member of the household" 3 "Yes, operating it together" 4 "Yes, operated by someone else - not a member of this household" 5 "No", modify
la val i1 i1
la de i2 1 "More than 10 years ago" 2 "5-10 years ago" 3 "<5 years ago until before April 2020" 4 "Starting April 2020", modify
la val i2 i2
la de i3_a 100 "Yes" 0 "No", modify
la val i3_a i3_a
la de i3_b 100 "Yes" 0 "No", modify
la val i3_b i3_b
la de i3_c 100 "Yes" 0 "No", modify
la val i3_c i3_c
la de i3_d 100 "Yes" 0 "No", modify
la val i3_d i3_d
la de i3_e 100 "Yes" 0 "No", modify
la val i3_e i3_e
*la de i3_f 100 "Yes" 0 "No", modify
*la val i3_f i3_f
la de i3_v 100 "Yes" 0 "No", modify
la val i3_v i3_v
la de i4 1 "Agriculture, Plantation, Forestry, Hunting & Fisheries" 2 "Mining and Quarrying" 3 "Industry" 4 "Utilities" 5 "Construction" 6 "Trade, Restaurants and Accommodation Services"  7 "Transportation, Warehousing, and Communication"  8 "Financial Institutions, Real Estate, Rental Business & Corporate Services" 9 "Community, Social and Individual Services", modify
la val i4 i4
la de i5 1 "Open/taking orders as usual" 2 "Open as usual, while applying health protocols" 3 "Open for a limited operating hours or with a limited capacity, while applying health protocols" 4 "Temporarily closed" 9 "Others", modify
la val i5 i5
la de i6_a 100 "Yes" 0 "No", modify
la val i6_a i6_a
la de i6_b 100 "Yes" 0 "No", modify
la val i6_b i6_b
la de i6_c 100 "Yes" 0 "No", modify
la val i6_c i6_c
la de i6_d 100 "Yes" 0 "No", modify
la val i6_d i6_d
la de i6_e 100 "Yes" 0 "No", modify
la val i6_e i6_e
la de i6_f 100 "Yes" 0 "No", modify
la val i6_f i6_f
la de i6_v 100 "Yes" 0 "No", modify
la val i6_v i6_v
la de i7_a 100 "Yes" 0 "No", modify
la val i7_a i7_a
la de i7_b 100 "Yes" 0 "No", modify
la val i7_b i7_b
la de i7_c 100 "Yes" 0 "No", modify
la val i7_c i7_c
la de i7_d 100 "Yes" 0 "No", modify
la val i7_d i7_d
la de i7_e 100 "Yes" 0 "No", modify
la val i7_e i7_e
la de i7_f 100 "Yes" 0 "No", modify
la val i7_f i7_f
la de i7_g 100 "Yes" 0 "No", modify
la val i7_g i7_g
la de i7_h 100 "Yes" 0 "No", modify
la val i7_h i7_h
la de i7_i 100 "Yes" 0 "No", modify
la val i7_i i7_i
la de i7_j 100 "Yes" 0 "No", modify
la val i7_j i7_j
la de i7_v 100 "Yes" 0 "No", modify
la val i7_v i7_v
la de i7_w 100 "Yes" 0 "No", modify
la val i7_w i7_w
la de i8_a 100 "Yes" 0 "No", modify
la val i8_a i8_a
la de i8_b 100 "Yes" 0 "No", modify
la val i8_b i8_b
la de i8_c 100 "Yes" 0 "No", modify
la val i8_c i8_c
la de i8_d 100 "Yes" 0 "No", modify
la val i8_d i8_d
la de i8_e 100 "Yes" 0 "No", modify
la val i8_e i8_e
la de i8_f 100 "Yes" 0 "No", modify
la val i8_f i8_f
la de i8_g 100 "Yes" 0 "No", modify
la val i8_g i8_g
la de i8_h 100 "Yes" 0 "No", modify
la val i8_h i8_h
la de i8_i 100 "Yes" 0 "No", modify
la val i8_i i8_i
la de i8_j 100 "Yes" 0 "No", modify
la val i8_j i8_j
la de i8_k 100 "Yes" 0 "No", modify
la val i8_k i8_k
la de i8_l 100 "Yes" 0 "No", modify
la val i8_l i8_l
la de i8_m 100 "Yes" 0 "No", modify
la val i8_m i8_m
la de i8_n 100 "Yes" 0 "No", modify
la val i8_n i8_n
la de i8_v 100 "Yes" 0 "No", modify
la val i8_v i8_v
la de i8_w 100 "Yes" 0 "No", modify
la val i8_w i8_w
la de i9_a 100 "Yes" 0 "No", modify
la val i9_a i9_a
la de i9_b 100 "Yes" 0 "No", modify
la val i9_b i9_b
la de i9_c 100 "Yes" 0 "No", modify
la val i9_c i9_c
la de i10_a 100 "Yes" 0 "No", modify
la val i10_a i10_a
la de i10_b 100 "Yes" 0 "No", modify
la val i10_b i10_b
la de i10_c 100 "Yes" 0 "No", modify
la val i10_c i10_c
la de i10_d 100 "Yes" 0 "No", modify
la val i10_d i10_d
la de i11_a 100 "Yes" 0 "No", modify
la val i11_a i11_a
la de i11_b 100 "Yes" 0 "No", modify
la val i11_b i11_b
la de i11_c 100 "Yes" 0 "No", modify
la val i11_c i11_c
la de i11_d 100 "Yes" 0 "No", modify
la val i11_d i11_d
la de i11_e 100 "Yes" 0 "No", modify
la val i11_e i11_e
la de i11_f 100 "Yes" 0 "No", modify
la val i11_f i11_f
la de i11_g 100 "Yes" 0 "No", modify
la val i11_g i11_g
la de i11_h 100 "Yes" 0 "No", modify
la val i11_h i11_h
la de i11_i 100 "Yes" 0 "No", modify
la val i11_i i11_i
la de i11_j 100 "Yes" 0 "No", modify
la val i11_j i11_j
la de i11_k 100 "Yes" 0 "No", modify
la val i11_k i11_k
la de i11_l 100 "Yes" 0 "No", modify
la val i11_l i11_l
la de i11_m 100 "Yes" 0 "No", modify
la val i11_m i11_m
la de i12_a 100 "Yes" 0 "No", modify
la val i12_a i12_a
la de i12_b 100 "Yes" 0 "No", modify
la val i12_b i12_b
la de i12_c 100 "Yes" 0 "No", modify
la val i12_c i12_c
la de i12_d 100 "Yes" 0 "No", modify
la val i12_d i12_d
la de i12_e 100 "Yes" 0 "No", modify
la val i12_e i12_e
la de i12_f 100 "Yes" 0 "No", modify
la val i12_f i12_f
la de i12_g 100 "Yes" 0 "No", modify
la val i12_g i12_g
la de i12_h 100 "Yes" 0 "No", modify
la val i12_h i12_h
la de i12_i 100 "Yes" 0 "No", modify
la val i12_i i12_i
la de i12_w 100 "Yes" 0 "No", modify
la val i12_w i12_w
la de i13 1 "Yes, I can" 2 "No, I can’t" 3 "There is no due date for installment payment", modify
la val i13 i13
la de i14 1 "Receive cash assistance for UMKM (BLT UMKM/BPUM)" 2 "Receive debt relaxations" 3 "Receive both cash assistance and debt relaxations" 4 "Aware, but do not receive it" 5 "Aware, but do not know how to apply" 6 "Aware, but do not apply because it is not needed"  8 "Unaware of any assistance", modify
la val i14 i14
la de i15_a 100 "Yes" 0 "No", modify
la val i15_a i15_a
la de i15_b 100 "Yes" 0 "No", modify
la val i15_b i15_b
la de i15_c 100 "Yes" 0 "No", modify
la val i15_c i15_c
la de i15_d 100 "Yes" 0 "No", modify
la val i15_d i15_d
la de i15_e 100 "Yes" 0 "No", modify
la val i15_e i15_e
la de i15_f 100 "Yes" 0 "No", modify
la val i15_f i15_f
la de i15_g 100 "Yes" 0 "No", modify
la val i15_g i15_g
la de i15_v 100 "Yes" 0 "No", modify
la val i15_v i15_v
 
*MODULE J*
 
la de j1 1 "Successful and completely filled" 2 "Incompletely filled" 3 "Refused (Phone Number)" 4 "Moved outside of census block" 5 "Household disbanded" 6 "Cannot be found"  7 "Household merged with another household", modify
la val j1 j1
la de j2 1 "Yes" 2 "No", modify
la val j2 j2
la de j4 1 "Yes" 2 "No", modify
la val j4 j4
}

save "datasurvei_25jan", replace


/*------------------------------------------------------------------------------
Part: Household characteristics
-------------------------------------------------------------------------------*/ 
{
gen hc01=0
	replace hc01=1 if inrange(b3_usia,15,29)
	replace hc01=2 if inrange(b3_usia,30,39)
	replace hc01=3 if inrange(b3_usia,40,49)
	replace hc01=4 if inrange(b3_usia,50,59)	
	replace hc01=5 if inrange(b3_usia,60,89)
	replace hc01=6 if b3==8 | b3_usia==98
	la var hc01 "hc01. HH head agegroup"
	la de hc01 1 "15-29yo" 2 "30-39yo" 3 "40-49yo" 4 "50-59yo" 5 "60yo+" 6 "Don't know", modify
	la val hc01 hc01

gen hc02=0
	replace hc02=1 if inrange(b7,1,2)
	replace hc02=2 if inrange(b7,3,4)
	replace hc02=3 if inrange(b7,5,6)
	replace hc02=4 if inrange(b7,7,30)	
	la var hc02 "hc02. HH size group"
	la de hc02 1 "1-2 members" 2 "3-4 members" 3 "5-6 members" 4 "7 members or more", modify
	la val hc02 hc02

gen hc03=0
	replace hc03=1 if b8a==1
	replace hc03=2 if b8a==2
	replace hc03=3 if inrange(b8a,3,20)
	la var hc03 "hc03. Elderly size group"
	la de hc03 0 "None" 1 "1 member" 2 "2 members" 3 "3 members or more", modify
	la val hc03 hc03

gen hc04=0
	replace hc04=1 if b8b==1
	replace hc04=2 if inrange(b8b,2,20)
	la var hc04 "hc03. Pregnant size group"
	la de hc04 0 "None" 1 "1 member" 2 "2 members or more", modify
	la val hc04 hc04

gen hc05=0
	replace hc05=1 if b8c==1
	replace hc05=2 if inrange(b8c,2,20)
	replace hc05=3 if b8cx==98
	la var hc05 "hc05. Chronic disease size group"
	la de hc05 0 "None" 1 "1 member" 2 "2 members or more" 3 "Don't know", modify
	la val hc05 hc05	

gen hc06=0
	replace hc06=1 if b8d==1
	replace hc06=2 if inrange(b8d,2,20)
	replace hc06=3 if b8dx==98
	la var hc06 "hc06. Infectious disease size group"
	la de hc06 0 "None" 1 "1 member" 2 "2 members or more" 3 "Don't know", modify
	la val hc06 hc06

gen hc07=0
	replace hc07=1 if b8e==1
	replace hc07=2 if inrange(b8e,2,20)
	la var hc07 "hc07. Medical workers size group"
	la de hc07 0 "None" 1 "1 member" 2 "2 members or more", modify
	la val hc07 hc07

gen hc08=0
	replace hc08=1 if b8f==1
	replace hc08=2 if b8f==2
	replace hc08=3 if inrange(b8f,3,20)
	la var hc08 "hc08. Working outside size group"
	la de hc08 0 "None" 1 "1 member" 2 "2 members" 3 "3 members or more", modify
	la val hc08 hc08

gen hc09=0
	replace hc09=e1+e2+e3
	la var hc09 "hc09. Number of children 0-17yo"

gen hc10=0
	replace hc10=1 if hc09==1
	replace hc10=2 if hc09==2
	replace hc10=3 if inrange(hc09,3,20)
	la var hc10 "hc10. Children 0-17yo size group"
	la de hc10 0 "None" 1 "1 member" 2 "2 members" 3 "3 members or more", modify
	la val hc10 hc10

gen hc11=0
	replace hc11=1 if e3==1
	replace hc11=2 if inrange(e3,2,20)
	la var hc11 "hc11. Children 0-4yo size group"
	la de hc11 0 "None" 1 "1 member" 2 "2 members or more", modify
	la val hc11 hc11

gen hc12=0
	replace hc12=1 if inrange(hc09,1,20)
	la var hc12 "hc12. Children dummy"
	la de hc12 0 "None" 1 "Have children", modify
	la val hc12 hc12

gen hc12a=0
	replace hc12a=1 if inrange(e9aa,1,20) | inrange(e9ab,1,20) | inrange(e9ac,1,20)
	la var hc12a "hc12a. Children in school dummy"
	la de hc12a 0 "None" 1 "Have children in school", modify
	la val hc12a hc12a
	
gen hc13=0
	replace hc13=1 if !regexm(g1,"W|Y")
	la var hc13 "hc13. Disability dummy"
	la de hc13 0 "None" 1 "Have members with disability", modify
	la val hc13 hc13

gen hc13b = g2_b==100
	la var hc13b "hc13b. Children (5-17) disability dummy"
	la de hc13b 0 "None" 1"Have children (5-17) with disability", modify
	la val hc13b hc13b
	
gen hc14= hc03>0
	la var hc14 "hc14. Elderly dummy"
	la de hc14 0 "None" 1 "Have elderly member(s)"
	la val hc14 hc14

gen hc15 = e3>0 & !missing(e3)
	la var hc15 "hc15. Balita dummy"
	la de hc15 0 "None" 1 "Have balita member(s)"
	la val hc15 hc15

*Income groups
gen hc16=0 if d11x==1
	replace hc16=1 if inrange(d11,1,999999)
	replace hc16=2 if inrange(d11,1000000,2499999)
	replace hc16=3 if inrange(d11,2500000,4999999)
	replace hc16=4 if inrange(d11,5000000,9999999)
	replace hc16=5 if inrange(d11,10000000,89999999)
	replace hc16=6 if d11x==997 
	replace hc16=7 if d11x==998 
	replace hc16=8 if missing(d11x)

	la var hc16 "hc16. Income groups"
	la de hc16 0 "None" 1 "Under 1 million" 2 "1-2.5 millions" 3 "2.5-5 millions" 4 "5-10 millions" 5 "10 millions or more" 6 "Refuse to answer" 7 "Don't know" 8 "No Working/Business Income", modify
	la val hc16 hc16

gen hc16a =0
replace hc16a=0 if inrange(hc16,2,5)
replace hc16a=1 if hc16==1
	la var hc16a "hc16a. Lowest income group dummy"
	la de hc16a 0 "1 million or more" 1"Less than one million"
	la val hc16a hc16a
	
gen hc17 = hc04>0
	la var hc17 "hc17. Pregnant dummy"
	la de hc17 0 "None" 1 "With pregnant member"
	la val hc17 hc17

gen hc18=0
	replace hc18=1 if h2==1
	replace hc18=2 if h2==2
	replace hc18=3 if inrange(h2,3,20)
	la var hc18 "hc18. Working members size group"
	la de hc18 0 "None" 1 "1 member" 2 "2 members" 3 "3 members or more", modify
	la val hc18 hc18

gen hc19 =0
	replace hc19=0 if b2==1
	replace hc19=1 if b2==2
	la var hc19 " hc19. Female household dummy"
	la de hc19 0 "Male-headed household" 1 "Female-headed household"
	la val hc19 hc19

gen hc20=0
	replace hc20=0 if id5==2
	replace hc20=1 if id5==1
	la var hc20 "hc20. Urban-rural dummy"
	la de hc20 0"Rural" 1 "Urban"
	la val hc20 hc20


*Urban-Rural Java & Non-Java*
*Urban Rural Java*
gen hc20a = 1 if hc20==0 & inlist(id1_cd,31,32,33,34,35,36)
replace hc20a = 2 if hc20==1 & inlist(id1_cd,31,32,33,34,35,36)
replace hc20a = 3 if hc20==0 & !inlist(id1_cd,31,32,33,34,35,36)
replace hc20a = 4 if hc20==1 & !inlist(id1_cd,31,32,33,34,35,36)

la var hc20a "hc20a. Urban-Rural Java Non-Java Dummy"
la de hc20a 1 "Java-Rural" 2 "Java-Urban" 3 "Non-Java Rural" 4 "Non-Java Urban"
la val hc20a hc20a

*Food expenditure groups
gen hc21=0
replace hc21=1 if inrange(d3,1,249999)
replace hc21=2 if inrange(d3,250000,499999)
replace hc21=3 if inrange(d3,500000,999999)
replace hc21=4 if inrange(d3,1000000,1999999)
replace hc21=5 if inrange(d3,2000000,89999999)
la var hc21 "hc21. Food expenditure groups"
la de hc21 0 "None" 1 "Under 0.25 millions" 2 "0.25-0.5 millions" 3 "0.5-1 millions" 4 "1-2 millions" 5 "2 millions or more", modify
la val hc21 hc21

* Nonfood expenditure groups
gen hc22=0
replace hc22=1 if inrange(d4,1,249999)
replace hc22=2 if inrange(d4,250000,499999)
replace hc22=3 if inrange(d4,500000,999999)
replace hc22=4 if inrange(d4,1000000,1999999)
replace hc22=5 if inrange(d4,2000000,89999999)
la var hc22 "hc22. Nonfood expenditure groups"
la de hc22 0 "None" 1 "Under 0.25 millions" 2 "0.25-0.5 millions" 3 "0.5-1 millions" 4 "1-2 millions" 5 "2 millions or more", modify
la val hc22 hc22

gen hc23= regexm(c1a,"[A-D]") | inrange(c1b,1,2) | c1c==1 | c1d==1 
	la var hc23 "hc23. Receive cash Assistance from Government"
	la de hc23 0"Did not receive cash assitance" 1 "Receive cash assistance"
	la val hc23 hc23

gen hc24= regexm(c1a,"[A-D]") | inrange(c1b,1,2) | c1c==1 | c1d==1 | c3a==1 | c3b==1 | c3c==1 | c3d==1 | c5==1
	la var hc24 "hc24. Receive any Assistance from Government"
	la de hc24 0"Did not receive any assitance" 1 "Receive any assistance"
	la val hc24 hc24

gen hc24b = c3a==1 | c3b==1 | c3c==1 | c3d==1 | c5==1
	la var hc24b "hc24b. Receive non-cash Assistance from Government"
	la de hc24b 0"Did not receive non-cash assitance" 1 "Receive non-cash assistance"
	la val hc24b hc24b	

gen hc24c = hc23 & hc24b
	la var hc24c "hc24c. Receive both cash and non-cash assistance from Government"
	la de hc24c 0"Did not receive assitance" 1 "Receive assistance"
	la val hc24c hc24c
		
*Social Assistance ant crosstab*
gen PKH = inrange(c1b,1,2)
gen BPJS = c1c==1
gen Prakerja = c1d==1
gen sembako = c3a==1
gen pulsa = c3b==1
gen tax = c3c==1 
gen credit = c3d==1
gen PLN = c5==1

foreach var of varlist c1a_* {
	replace `var'=1 if `var'==100
}

egen hc25 = rowtotal(c1a_a c1a_b c1a_c c1a_d PKH BPJS Prakerja sembako pulsa tax credit PLN)
replace hc25 = 4 if hc25>4
la var hc25 "No. of Gvt Social Assistance Received"
la de hc25 0 "Zero" 1 "One" 2 "Two" 3 "Three" 4 "Four or more"
la val hc25 hc25

gen exp = (d3*4)+d4
la var exp "Total Monthly Expenditure"
la var exp "Total Monthly Expenditure (Group)"
gen hc26 = 0
	replace hc26=1 if inrange(exp,1,999999)
	replace hc26=2 if inrange(exp,1000000,2499999)
	replace hc26=3 if inrange(exp,2500000,4999999)
	replace hc26=4 if inrange(exp,5000000,9999999)
	replace hc26=5 if inrange(exp,10000000,89999999)
	replace hc26=6 if missing(exp)
	la de hc26 0 "None" 1 "Under 1 million" 2 "1-2.5 millions" 3 "2.5-5 millions" 4 "5-10 millions" 5 "10 millions or more" 6 "Don't know/refuse", modify
	la val hc26 hc26

gen hc27 = b15!=96
la var hc27 "Household Used internet"
la de hc27 1 "Used internet" 0 "No internet"



gen hcr1 = d9==3
la var hcr1 "Lower income dummy"
la de hcr1 1 "Income lower" 0 "Income higher/stays the same"
la val hcr1 hcr1


foreach var of varlist c1a_* {
	replace `var'=100 if `var'==1
}



*Income Changes*
*Percentage of income changes
gen im01=0
	replace im01=1 if inrange(d10,1,25) & d9==3
	replace im01=2 if inrange(d10,26,50) & d9==3
	replace im01=3 if inrange(d10,51,75) & d9==3
	replace im01=4 if inrange(d10,76,100) & d9==3
	replace im01=5 if d9==3 & d10x==998
	replace im01=6 if d9==2
	replace im01=7 if d9==1
	replace im01=8 if im01==0
	la var im01 "im01. Changes in income"
	la de im01 8 "Don't have income from work/business" 1 "1-25% lower" 2 "26-50% lower" 3 "51-75% lower" 4 "76-100% lower" 5 "Lower, don't know the-%" 6 "Constant" 7 "Higher", modify
	la val im01 im01
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

gen wealth_group = 1 if inlist(wealth_index,1,2)
replace wealth_group = 2 if inlist(wealth_index,3,4)
replace wealth_group = 3 if inlist(wealth_index,5)

la var wealth_group "Wealth distribution"
la de wealth_group 1 "Bottom 40%" 2 "Middle 40%" 3 "Top 20%"
la val wealth_group wealth_group

foreach var of varlist d15* {
	replace `var'=2 if `var'==0
}

gen debt = 1 if d17==1 | d18==1
replace debt = 2 if d17==2 | d18==2
replace debt = 3 if d17==3 | d18==3
replace debt = 4 if d17==4 | d18==4
la var debt "Have debt?"
la de debt 1  "Yes, can pay the installments regularly" 2  "Yes, can not pay the installments regularly" 3 "Yes, the installment is currenly deferred" 4 "no debt"
la val debt debt



*HH  Default characteristics for for tabulation
/* code
a. all
a2. Male-headed
b. Female headed
c. children
d. disability
cd. Children disability
e. elder
f. children aged below 5 years old
g. Income group
g2. Low income group
h. pregnant
i. low income
j. rural-urban
ja. Rural-Urban Java Non-Java
k. Wealth index
k2. Wealth index group (bottom 40%, middle 40%, top 20%)
l. No. of Social Assistance
m. Expenditure Groups
o. Internet user group
p. Receive cash social assistance
q. Receive any social assistance
*/
local group_b "hc19"
local group_c "hc12"
local group_d "hc13"
local group_cd "hc13b"
local group_e "hc14"
local group_f "hc15"
local group_g "hc16"
local group_g2 "hcr1"
local group_h "hc17"
local group_i "hc16a" 
local group_j "hc20"
local group_j2 "hc20a"
local group_k "wealth_index"
local group_k2 "wealth_group"
local group_k3 
local group_l "hc25"
local group_m "hc26"
local group_o "hc27"
local group_p "hc23"
local group_q "hc24"


save "datasurvei_250121_grouped", replace
tempfile appended
save `appended'
