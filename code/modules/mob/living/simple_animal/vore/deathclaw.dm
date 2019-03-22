/mob/living/simple_animal/hostile/deathclaw
	name = "deathclaw"
	desc = "Big! Big! The size of three men! Claws as long as my forearm! Ripped apart! Ripped apart!"
	icon = 'icons/mob/vore64x64.dmi'
	icon_dead = "deathclaw-dead"
	icon_living = "deathclaw"
	icon_state = "deathclaw"
	isEdible = 0

	attacktext = list("mauled")

	faction = "deathclaw"

	maxHealth = 200
	health = 200

	melee_damage_lower = 10
	melee_damage_upper = 60

	//Makes it so they're immune to space
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

// Activate Noms!
/mob/living/simple_animal/hostile/deathclaw
	vore_active = 1
	vore_capacity = 2
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_ignores_undigestable = 0
	vore_icons = SA_ICON_LIVING

//CHOMPEDIT Adding mining friendly dedclaws
/mob/living/simple_animal/hostile/deathclaw/minor //or miner
	name = "minor deathclaw"
	desc = "Big! The size of two men! Claws as long as my hand! Ripped apart! Ripped apart!"
	maxHealth = 150
	health = 150
	melee_damage_lower = 5
	melee_damage_upper = 30

//Activate Lootdrops
/mob/living/simple_animal/hostile/deathclaw/minor/death()
	..()
	if(prob(80))
		visible_message("<span class='notice'>\The [src] dropped some ore!</span>")
		var/location = get_turf(src)
		new /obj/item/weapon/ore/diamond(location)
	if(prob(40))
		visible_message("<span class='notice'>\The [src] dropped some ore!</span>")
		var/location = get_turf(src)
		new /obj/item/weapon/ore/uranium(location)
	if(prob(1))
		visible_message("<span class='notice'>\The [src] suddenly regenerates!</span>")
		var/location = get_turf(src)
		new /mob/living/simple_animal/hostile/deathclaw/minor(location)
		qdel(src)
