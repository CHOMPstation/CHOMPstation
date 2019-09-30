/mob/living/simple_animal/hostile/jelly
	name = "jelly blob"
	desc = "Some sort of undulating blob of slime!"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "jelly_dead"
	icon_living = "jelly"
	icon_state = "jelly"

	faction = "virgo2"
	maxHealth = 50
	health = 50

	view_range = 4 //they're blind AF

//atmo-immune. Might be necessary for it to not just die in vacuum.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	melee_damage_lower = 5
	melee_damage_upper = 15

	speak_chance = 2
	emote_hear = list("squishes","spluts","splorts","sqrshes","makes slime noises")
	emote_see = list("undulates quietly")

//CHOMPEDIT ACTIVATING LOOT DROPS FOR JELLO NERDS
/mob/living/simple_animal/hostile/jelly/death()
	..()
	var/location = get_turf(src) //lets just define this here once instead of ewverytime an if is true, less work.
	if(prob(99))
		visible_message("<span class='notice'>\The [src] dropped some gel!</span>")
		new /obj/item/weapon/reagent_containers/food/snacks/gelbowl(location) //gelatinous blobs, hoe bland.
	if(prob(80))
		visible_message("<span class='notice'>\The [src] dropped some can!</span>")
		new /obj/item/weapon/reagent_containers/food/drinks/cans/lemon_lime(location) //blobs have bad taste
	if(prob(20))
		visible_message("<span class='notice'>\The [src] dropped some ore!</span>")
		new /obj/item/weapon/ore/uranium(location)

// Activate Noms!
/mob/living/simple_animal/hostile/jelly
	vore_active = 1
	vore_pounce_chance = 20 //Should be a percentage
	vore_capacity = 2
	vore_ignores_undigestable = 0
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //Hungry little bastards.
