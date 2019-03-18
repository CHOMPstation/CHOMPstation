/mob/living/simple_animal/hostile/tarrasque
	//icon = bigboygains.dmi
	
	//temporarily gonna use Deathclaw
	icon = 'icons/mob/vore64x64.dmi'
	icon_dead = "deathclaw-dead"
	icon_living = "deathclaw"
	icon_state = "deathclaw"
	size_multiplier = 2
	var/hasdrops = 1
	
	isEdible = 0
	name = "T'rasq"
	desc = "The most dreaded monster. Its purpose is to devour the worlds 1 waking cycle at a time, all it knows is, eat, sleep, repeat."
	health = 1000
	maxHealth = 1000
	
	tt_desc = "Embodiment of Destruction" //Let's avoid Actually labeling these as "Tarrasque" by species, going for a more mythological kinda thing, does this even exyst?
	
	//icon_living = "tarrasque"
	//icon_dead = "" //This wont be needed since one does not simply kill a tarrasque.
	
	//Mob talking settings
	//Rawr rorr, mrawr~!
	//maybe later.

	//Mob movement settings
	wander = 1
	wander_distance = 999
	returns_home = 1
	turns_per_move = 7
	follow_dist = 999
	speed = 7
	
	//Mob interaction
	response_help   = "Sacrifices self to"
	response_harm   = "Weakly flails at"
	harm_intent_damage = 0
	
	//Mob environment settings
	minbodytemp = 0
	maxbodytemp = 100000
	heat_damage_per_tick = 0
	cold_damage_per_tick = 0
	min_oxy = 0
	max_tox = 0
	max_co2 = 0
	unsuitable_atoms_damage = 0

	//Hostility settings
	view_range = 280 //HE knows when you're awake, and also when you sleep
	investigates = 1 //Clever girl
	attack_same = 1 //There can only be one
	grab_resist = 100 //It's a collosal creature... you arent just grabbing that...
	taser_kill = 0 //It's lethals or nothing

	//Melee settings
	melee_damage_lower = 10 //huh not so bad
	melee_damage_upper = 45 //oh, oh no
	attacktext = list("bites","claws","slashes")
	environment_smash = 99999 //It's made for destroying things
	melee_miss_chance = 0
	melee_attack_minDelay = 0
	melee_attack_maxDelay = 5
	attack_armor_pen = 20
	attack_sharp = 1

	//Attack movement settings
	move_to_delay = 7
	destroy_surroundings = 1

	//Damage resistances
	shock_resistance = 1
	resistance = 99

/mob/living/simple_animal/hostile/tarrasque/death()
	..()
	if (hasdrops)
		visible_message("<span class='notice'>\The [src] is annoyed with your continued resistance and burrows into the ground!</span>")
		var/scale = /obj/item/clothing/accessory/medal/tarrasque
		new scale(location)
		new scale(location)
		new scale(location)
		new scale(location)
		new scale(location)
		new scale(location)
		qdel(src)

/obj/item/clothing/accessory/medal/tarrasque //IF we ever to make a siege event with this, this will be a permanent medal to win for people that survived
	name = "Scale medal"
	desc = "A T'rasq scale fashioned into a medal."
	icon_state = "bronze" //to be sprited "scale"
	
//MRX Variation
/mob/living/simple_animal/hostile/tarrasque/mrx
	icon = 'icons/mob/64x64.dmi'
	name = "Entity X"
	desc = "The call of the abyss manifested."
	hasdrops = 0
	health = 2000
	maxHealth = 2000
	attack_sharp = 0
	melee_attack_minDelay = 0
	melee_attack_maxDelay = 1
	view_range = 420
	size_multiplier = 1.5
	icon_state = "arachnid"
	icon_living = "arachnid"
	icon_dead = "arachnid_dead"
	tt_desc = "Unknown Specimen"
	attacktext = list("whacks","slashes","smashes")
	melee_damage_lower = 0 //huh not so bad
	melee_damage_upper = 50 //oh, oh no
	armor = list(
				"melee" = 99,
				"bullet" = 99,
				"laser" = 99,
				"energy" = 99,
				"bomb" = 99,
				"bio" = 100,
				"rad" = 100)

/mob/living/simple_animal/hostile/tarrasque/mrx/Life()
	..()
	if(resting)
		resting = !resting
	if (anchored)
		set_light(l_range = 1.5, l_power = 2, l_color = COLOR_RED)
	for(var/obj/machinery/door/airlock/door in range(3, src))
		door.open()

//time for special MR X kick you in the shins and stands there code
/mob/living/simple_animal/hostile/tarrasque/mrx/DoPunch(var/atom/A)
	. = ..()
	if(.) // If we succeeded in hitting.
		for(var/obj/machinery/light/light in range(5, src))
			light.flicker(10)
		if(isliving(A))
			var/mob/living/L = A
			L.Weaken(5)
			stop_automated_movement = 1
			anchored = 1
			spawn(100)
				stop_automated_movement = 0
				anchored = 0
