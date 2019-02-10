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
	description = "Claridyl is an advanced medicine that cures all of your problems. Notice: Clarydil does not claim to actually treat any problems and may cause severe pain."
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
		M.adjustBruteLoss(-1)
		M.adjustHalLoss(3)
		//many many side effects all listed in AS Commercial
		if(prob(0.0001))//Side effects incluide death, this seems like a good "balanced" inclusion of it
			M.adjustToxLoss(50)//instant crit for tesh
		if(prob(0.1))
			M.AdjustParalysis(0.5)
		if(prob(0.1))
			M.AdjustStunned(10)
		if(prob(5))
			M.AdjustWeakened(10)
		if(prob(5))
			M.make_dizzy(2)
		if(prob(10))
			M.add_chemical_effect(CE_ALCOHOL, 5)
			if(prob(50))
				M.custom_pain("Your vision becomes blurred!",30)
		if(prob(10))
			M.custom_pain("Your mouth feels dry!",30)
		if(prob(1))
			M.custom_pain("You suddenly feel inexplicably angry!",30)
		if(prob(2))
			M.custom_pain("You suddenly lose your train of thought!",30)
		if(prob(0.1))
			M.hallucination = max(M.hallucination, 2)
