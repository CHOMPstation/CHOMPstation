/mob/living/simple_animal/retaliate/synx
	name = "Synx"
	desc = "A cold blooded, genderless, parasitic eel from the more distant and stranger areas of the cosmos. Plain, white, perpetually grinning and possessing a hunger as enthusiastic and endless as humanity's sense of exploration."
	tt_desc = "synxus pergulus"

	 //Synx species belongs to ChimeraSynx , Sprites by: SpitefulCrow
	icon = 'icons/mob/synx.dmi'//giving synxes their own DMI file!
	icon_state = "synx"
	icon_living = "synx"

	var/transformed_state = "synx_transformed"

	var/transformed = FALSE

	faction = "Synx"
	intelligence_level = SA_ANIMAL

	maxHealth = 150
	health = 120
	//turns_per_move = 2 //to be balanced, default for now
	//speed = -2 //to be balanced, default for now
	see_in_dark = 6
	stop_when_pulled = 0
	armor = list(			// will be determined
				"melee" = 20,
				"bullet" = 0,
				"laser" = 0,
				"energy" = 0,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	//has_hands = TRUE

	response_help  = "pets"
	response_disarm = "gently pushes aside"


	pass_flags = PASSTABLE

	melee_damage_lower = 20
	melee_damage_upper = 30
	attack_armor_pen = 50			// How much armor pen this attack has.
	attack_sharp = 1
	attack_edge = 1

	//will be affected by atmos soon
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
    //to be added
	/*speak_chance = 1
	speak = list()
	speak_emote = list()
	emote_hear = list()
	emote_see = list()*/

/mob/living/simple_animal/retaliate/synx/New()
    ..()
    verbs |= /mob/living/proc/ventcrawl
    verbs |= /mob/living/simple_animal/proc/contort
    verbs +=  /mob/living/simple_animal/retaliate/synx/proc/disguise

mob/living/simple_animal/synx/PunchTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "bites [target_mob]") ) )

	var/damage = rand(melee_damage_lower, melee_damage_upper)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_TORSO, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), H.get_armor_soak(affecting, "melee"), sharp=1, edge=1)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L
	else
		..()

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// POWERS!!!! /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

/mob/living/simple_animal/proc/contort()
	set name = "contort"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities"

	if(stat == DEAD || paralysis || weakened || stunned || restrained())
		return

	if(status_flags & HIDING)
		status_flags &= ~HIDING
		reset_plane_and_layer()
		to_chat(src,"<span class='notice'>You have stopped hiding.</span>")
		//speed = -3, to be balanced
	else
		status_flags |= HIDING
		layer = HIDING_LAYER //Just above cables with their 2.44
		plane = OBJ_PLANE
		to_chat(src,"<span class='notice'>You are now hiding.</span>")
		speed = 2

/mob/living/simple_animal/retaliate/synx/proc/disguise()
	set name = "Toggle Form"
	set desc = "Switch between amorphous and humanoid forms."
	set category = "Abilities"

	if(stat == DEAD || paralysis || weakened || stunned || restrained())
		return

	// If transform isn't true
	if(!transformed)
		to_chat(src,"<span class='warning'>you changed back into your disguise.</span>")
		icon_living = transformed_state //Switch state to transformed state
	else // If transformed is true.
		to_chat(src,"<span class='warning'>now they see your true form.</span>")
		icon_living = initial(icon_living) //Switch state to what it was originally defined.


	transformed = !transformed
	update_icons()
