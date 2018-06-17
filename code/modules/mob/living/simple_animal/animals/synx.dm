/mob/living/simple_animal/neutral/synx
	name = "Synx"
	desc = "to be added"
	tt_desc = "synxus pergulus"

	 //to be added
	icon_state = "synx"
	icon_living = "synx"

	faction = "Synx"
	intelligence_level = SA_ANIMAL

	maxHealth = 150
	health = 120
	turns_per_move = 3
	speed = -3
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

/mob/living/simple_animal/neutral/synx/New()
	..()
	verbs |= /mob/living/proc/ventcrawl
	verbs |= /mob/living/proc/hide
	verbs |= /mob/living/proc/disguise

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


