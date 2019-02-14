/// Recipes

/datum/chemical_reaction/aphrodisiac
	name = "Aphrodisiac"
	id = "aphrodisiac"
	result = "aphrodisiac"
	required_reagents = list("carbon" = 2, "hydrogen" = 2, "oxygen" = 2, "water" = 1)
	result_amount = 6

/datum/reagent/aphrodisiac
	name = "Aphrodisiac"
	id = "aphrodisiac"
	description = "You so horny."
	taste_description = "sweetness"
	reagent_state = LIQUID
	color = "#FF9999"
	scannable = 1

/datum/reagent/aphrodisiac/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(!M)	return

	if(prob(3))
		M.emote(pick("blush", "moan", "moan", "giggle"))

	// Unsure if we want to allow cumming. I'm gonna disable it for now.
/*
	if(prob(1))
		switch(M.gender)
			if(MALE)
				M.emote("mcum")
			if(FEMALE)
				M.emote("fcum")
			if(PLURAL)
				if(prob(50))
					M.emote("mcum")
				else
					M.emote("fcum")
*/
// Disabled cause I'm unsure if we want to do this or not.
/*
/mob/living/proc/cum()
	if(!check_has_mouth())
		return
	src.visible_message("<span class='warning'>[src] throws up!</span>","<span class='warning'>You throw up!</span>")

	var/turf/simulated/T = get_turf(src)	//TODO: Make add_blood_floor remove blood from human mobs
	if(istype(T))
		T.add_vomit_floor(src, 1)
*/

//////////////////////////////////////////////
////////////////C U B E S////////////////////
////////////////////////////////////////////
/datum/chemical_reaction/cube/sagaru
	name = "Saguwu"
	id = "cubedsagaru"
	result = null
	required_reagents = list("cheese" = 1, "blood" = 1, "clonexadone" = 10,)
	result_amount = 1

/datum/chemical_reaction/cube/sagaru/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/sarucube(location)
	return
////////////////////////////////////
////////////That good shit/////////
//////////////////////////////////
/datum/reagent/claridyl
	name = "Claridyl Natural Remedy"
	id = "claridyl"
	description = "Claridyl is an advanced medicine that cures all of your problems. Notice: Clarydil does not claim to fix marriages, car loans, student debt or insomnia and may cause severe pain."
	taste_description = "sugar"
	reagent_state = LIQUID
	color = "#AAAAFF"
	overdose = REAGENTS_OVERDOSE * 100
	metabolism = REM * 0.1
	scannable = 1

/datum/reagent/claridyl/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_STABLE, 30)
		M.add_chemical_effect(CE_PAINKILLER, 40)
		if(M.getBruteLoss())
			M.adjustBruteLoss(-1)
			M.adjustHalLoss(1.5)
		if(prob(0.0001))
			M.adjustToxLoss(50)//instant crit for tesh
			
		if(prob(0.1))
			pick(M.custom_pain("You suddenly feel inexplicably angry!",30),
			M.custom_pain("You suddenly lose your train of thought!",30),
			M.custom_pain("Your mouth feels dry!",30),
			M.make_dizzy(2),
			M.AdjustWeakened(10),
			M.AdjustStunned(1),
			M.AdjustParalysis(0.1),
			M.hallucination = max(M.hallucination, 2),
			M.flash_eyes(),
			M.custom_pain("Your vision becomes blurred!",30),
			M.add_chemical_effect(CE_ALCOHOL, 5),)

/datum/reagent/claridyl/bloodburn/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.bloodstr)//No seriously dont inject this wtf is wrong with you.
		for(var/datum/reagent/R in M.bloodstr.reagent_list)
			if(istype(R, /datum/reagent/blood))
				R.remove_self(removed * 15)

/datum/reagent/claridyl/bloodburn/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.ingested)
		for(var/datum/reagent/R in M.ingested.reagent_list)
			if(istype(R, /datum/reagent/ethanol))
				R.remove_self(removed * 5)

/datum/reagent/claridyl/bloodburn
	name = "Bloodburn"
	id = "bloodburn"
	description = "A chemical used to soak up any reagents inside someones stomach, injection is not advised, if you need to ask why please seek a new job."
	taste_description = "liquid void"
	color = "#000000"
	metabolism = REM * 5

////////////////////////////////////////////////
/////////DRINKS////////////////////////////////
//////////////////////////////////////////////

/datum/reagent/drink/tea/dyloteane
	name = "The Anti-Irish"
	id = "dyloteane"
	glass_name = "Medicinal tea cup"
	glass_desc = "Goes perfectly with alcohol poisoning!"
	taste_description = "The sweet taste of multidepartment cooperation!"
	cup_desc = "Goes perfectly with alcohol poisoning!"
	cup_name = "Medicinal tea cup"
	color = "#00FF00"
	

/datum/reagent/drink/tea/dyloteane/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(M.ingested)
		for(var/datum/reagent/R in M.ingested.reagent_list)
			if(istype(R, /datum/reagent/ethanol))
				R.remove_self(removed * 3)
	if(M.bloodstr)
		for(var/datum/reagent/R in M.bloodstr.reagent_list)
			if(istype(R, /datum/reagent/ethanol))
				R.remove_self(removed * 10)

/datum/reagent/drink/tea/dyloteane/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1
	if(alien != IS_DIONA)
		M.drowsyness = max(0, M.drowsyness - 6 * removed * chem_effective)
		M.hallucination = max(0, M.hallucination - 9 * removed * chem_effective)
		M.adjustToxLoss(-1 * removed * chem_effective)
