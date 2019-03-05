/mob/living/simple_animal/hostile/metroid
	name = "baby metroid"
	desc = "The baby the baby the baby the baby."
	tt_desc = "Minimus Headamus Suckumus"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroidbaby"
	icon_state = "metroidbaby"
	isEdible = 0
	
	faction = "metroids"
	maxHealth = 50
	health = 50

//Metroids aren't affected by most atmospheres except cold.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = T0C-30
	heat_damage_per_tick = 0
	cold_damage_per_tick = 40

	melee_damage_lower = 1
	melee_damage_upper = 5

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

/mob/living/simple_animal/hostile/metroid/death()
	playsound(src, 'sound/effects/metroiddeath.ogg', 50, 1)
	..()


/*
/mob/living/simple_animal/hostile/metroid/super
	name = "super metroid"
	desc = "Some sort of person eaty thing!"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"

	faction = "metroids"
	maxHealth = 200
	health = 200

//Metroids aren't affected by most atmospheres except cold.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = T0C-30
	heat_damage_per_tick = 0
	cold_damage_per_tick = 40

	melee_damage_lower = 2
	melee_damage_upper = 5

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

/mob/living/simple_animal/hostile/metroid/super
	vore_active = 1
	vore_pounce_chance = 75 //Pro Tip: Don't let them touch you.
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //Hungry little bastards.
*/


/mob/living/simple_animal/hostile/metroid/mine
	name = "minetroid"
	desc = "Some sort of person eaty thing! But weak compared to regular Metroids!"
	tt_desc = "Headamus Suckumus"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"

	faction = "metroids"
	intelligence_level = SA_ANIMAL
	hovering = TRUE
	maxHealth = 25
	health = 25
	speed = 4
	turns_per_move = 5
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

//Minetroids aren't affected by atmospheres.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0


	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = list("suckulated")
	attack_sound = 'sound/effects/metroidattack.ogg'

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

	meat_type = /obj/item/toy/figure/samus

/mob/living/simple_animal/hostile/metroid/mine
	vore_active = 1
	vore_pounce_chance = 50
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //Hungry little bastards.

/mob/living/simple_animal/hostile/metroid/mine/death()
	playsound(src, 'sound/effects/metroiddeath.ogg', 50, 1)
	..()
	if(prob(20))
		visible_message("<span class='notice'>\The [src] dropped some toy!</span>")
		var/location = get_turf(src)
		new /obj/item/toy/figure/samus(location)


/*
/mob/living/simple_animal/hostile/metroid/alpha
	name = "super metroid"
	desc = "Some sort of person rammy thing!"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"

	faction = "metroids"
	maxHealth = 225
	health = 225

//Metroids aren't affected by most atmospheres except cold.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = T0C-30
	heat_damage_per_tick = 0
	cold_damage_per_tick = 40

	melee_damage_lower = 10
	melee_damage_upper = 15

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

// Activate Noms!
/mob/living/simple_animal/hostile/metroid/alpha
	vore_active = 1
	vore_pounce_chance = 75 //Pro Tip: Don't let them touch you.
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //Hungry little bastards.



/mob/living/simple_animal/hostile/metroid/gamma
	name = "super metroid"
	desc = "Some sort of person zappy thing!"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"

	faction = "metroids"
	maxHealth = 275
	health = 275

//Evolutions aren't affected by atmospheres.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	melee_damage_lower = 0
	melee_damage_upper = 0

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

// Activate Noms!
/mob/living/simple_animal/hostile/metroid/gamma
	vore_active = 1
	vore_pounce_chance = 75 //Pro Tip: Don't let them touch you.
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //Hungry little bastards.



/mob/living/simple_animal/hostile/metroid/zeta
	name = "super metroid"
	desc = "Some sort of person stompy thing!"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"

	faction = "metroids"
	maxHealth = 350
	health = 350

//Evolutions aren't affected by atmospheres.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	melee_damage_lower = 0
	melee_damage_upper = 0

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

// Activate Noms!
/mob/living/simple_animal/hostile/metroid/zeta
	vore_active = 1
	vore_pounce_chance = 75 //Pro Tip: Don't let them touch you.
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //Hungry little bastards.



/mob/living/simple_animal/hostile/metroid/omega
	name = "super metroid"
	desc = "Some sort of person smashy thing!"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"

	faction = "metroids"
	maxHealth = 450
	health = 450

//Evolutions aren't affected by atmospheres.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	melee_damage_lower = 0
	melee_damage_upper = 0

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

// Activate Noms!
/mob/living/simple_animal/hostile/metroid/omega
	vore_active = 1
	vore_pounce_chance = 75 //Pro Tip: Don't let them touch you.
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //Hungry little bastards.



/mob/living/simple_animal/hostile/metroid/queen
	name = "super metroid"
	desc = "How the hell could you let this happen."
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"

	faction = "metroids"
	maxHealth = 575
	health = 575

//Evolutions aren't affected by atmospheres.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	melee_damage_lower = 0
	melee_damage_upper = 0

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

// Activate Noms!
/mob/living/simple_animal/hostile/metroid/queen
	vore_active = 1
	vore_pounce_chance = 75 //Pro Tip: Don't let them touch you.
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //Hungry little bastards.
*/
