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
