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
	speed = 4

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
	pixel_x = -15
	desc = "The call of the abyss manifested. Doors have proven inefective against it."
	hasdrops = 0
	health = 2000
	maxHealth = 2000
	attack_sharp = 0
	melee_attack_minDelay = 2
	melee_attack_maxDelay = 10
	view_range = 420
	size_multiplier = 1
	icon_state = "arachnid"
	icon_living = "arachnid"
	//icon_dead = "arachnid_dead"
	icon_dead = "arachnid_stunned" //Same as dead but no blood
	icon_rest = "arachnid_sleeping"
	tt_desc = "Unknown Specimen"
	attacktext = list("whacked","slashed","smashed")
	melee_damage_lower = 0 
	melee_damage_upper = 50
	universal_speak = 0
	var/alang = LANGUAGE_GALCOM
	var/active_sound = 'sound/effects/kefka.ogg'
	armor = list(
				"melee" = 99,
				"bullet" = 99,
				"laser" = 99,
				"energy" = 99,
				"bomb" = 99,
				"bio" = 100,
				"rad" = 100)
//Vore stuff
	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 10 //Rare
	vore_default_flags = null
	vore_default_mode = DM_DIGEST
	vore_standing_too = 1
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
/mob/living/simple_animal/hostile/tarrasque/mrx/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.digest_burn = 10 //Normally this can only be 6 but since we are in code we can override this to be 10 so we dont need brute.
	B.digest_brute = 0
	
/mob/living/simple_animal/hostile/tarrasque/mrx/New()
	..()
	update_icon()
	seedarkness = 0
	src.sight |= SEE_TURFS|SEE_MOBS|SEE_OBJS
	add_language("Xenomorph")
	verbs |= /mob/living/simple_animal/hostile/tarrasque/mrx/proc/hackervoice
	verbs |= /mob/living/simple_animal/hostile/tarrasque/mrx/proc/scarethelights
	verbs |= /mob/living/simple_animal/hostile/tarrasque/mrx/proc/knocktheirfaces

/mob/living/simple_animal/hostile/tarrasque/mrx/Life()
	..()
	if(!pixel_x)
		pixel_x = -15
	if(resting && !client)
		resting = !resting
		update_icon()
	if (anchored)
		melee_damage_upper = 0 //hacky way to stop attacks
		set_light(l_range = 10, l_power = 5, l_color = COLOR_RED) //RUN BITCHES
	if(!anchored)
		melee_damage_upper = 50
	if(!client)
		opensesame()
	if(buckled)
		resist()
		buckled = null
	if(active_sound)
		while(anchored)
			playsound(src.loc, "[active_sound]", 100, 0, 4)
			sleep(60)

//time for special MR X kick you in the shins and stands there code
/mob/living/simple_animal/hostile/tarrasque/mrx/DoPunch(var/atom/A)
	. = ..()
	if(.) // If we succeeded in hitting.
		if(alang==LANGUAGE_GALCOM)
			alang="Xenomorph"
		else if(alang=="Xenomorph")
			alang=LANGUAGE_GALCOM
		flicker()
		if(istype(A,/turf/simulated/wall))
			var/turf/simulated/wall/wall = A
			wall.dismantle_wall(null,null,1)
		if(isliving(A) && !anchored)
			src.say("Run tasty treat, run~", alang,"chitters") //may hiss may not, balanced
			var/mob/living/L = A
			L.Weaken(5)
			stop_automated_movement = 1
			anchored = 1
			melee_damage_upper = 0
			spawn(150)
				stop_automated_movement = 0
				anchored = 0
				melee_damage_upper = 50

/mob/living/simple_animal/hostile/tarrasque/mrx/handle_regular_hud_updates()
	..()
	sight |= SEE_TURFS|SEE_MOBS|SEE_OBJS
	see_in_dark = 8
	see_invisible = SEE_INVISIBLE_LEVEL_TWO
/////////////////////////////////////////
//////////////Special EX PRocs go here // Mostly for playercontrolled stuff
/////////////////////////////////////////
/mob/living/simple_animal/hostile/tarrasque/mrx/proc/opensesame()
	for(var/obj/machinery/door/airlock/door in range(5, src))
		door.open(1)
		door.lock(1)
/mob/living/simple_animal/hostile/tarrasque/mrx/proc/flicker()
	for(var/obj/machinery/light/light in range(5, src))
		light.flicker(2) 
/mob/living/simple_animal/hostile/tarrasque/mrx/proc/stopfuckingkitingme()
	for(var/mob/living/carbon/human/peasant in range(2, src))
		DoPunch(peasant)
/mob/living/simple_animal/hostile/tarrasque/mrx/proc/knocktheirfaces()
	set name = "Anti Kite"
	set desc = "Fuck them up"
	set category = "X Powers"
	stopfuckingkitingme()
/mob/living/simple_animal/hostile/tarrasque/mrx/proc/hackervoice()
	set name = "Door Override"
	set desc = "Hacker Voice: Im in"
	set category = "X Powers"
	opensesame()
/mob/living/simple_animal/hostile/tarrasque/mrx/proc/scarethelights()
	set name = "Light Flicker"
	set desc = "Hacker Voice: Im in"
	set category = "X Powers"
	flicker()

/mob/living/simple_animal/hostile/tarrasque/mrx/react_to_attack(var/mob/living/M)
	return //ONly one target at a time, if he dies, we move on.
