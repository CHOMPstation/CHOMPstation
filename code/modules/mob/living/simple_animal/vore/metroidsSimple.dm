var/global/list/queen_amount = 0 //We only gonna want 1 queen in the world.

/*
//The metroids' base variables!
*/


/mob/living/simple_animal/hostile/metroid
	name = "metroid"
	desc = "Some sort of person eaty thing!"
	tt_desc = "Headamus Suckumus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"
	faction = "metroids"
	intelligence_level = SA_ANIMAL
	hovering = TRUE
	maxHealth = 25
	health = 25
	speed = 4
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	harm_intent_damage = 5
	isEdible = 0 //They cannot be eaten while alive.
	var/canEvolve = 1 //A variable for admins to turn off and on for when they like assign a player as a mob. I want to add a verb so that they can do it on command when the conditions are right in the future.
	var/obj/machinery/atmospherics/unary/vent_pump/entry_vent //Graciously stolen from spider code

//Metroids aren't affected by atmospheres.
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
	emote_see = list("SKREEs")
	meat_type = /obj/item/toy/figure/samus

	var/mob/living/victim = null // the person the metroid is currently feeding on
	var/optimal_combat = FALSE // Used to dumb down the combat AI somewhat.  If true, the metroid tends to be really dangerous to fight alone due to stunlocking.
	var/power_charge = 0
	var/evo_point = 0
	var/evo_limit = 0
	var/next = null
	
	//Stuff for if a person is playing as a metroid.
	show_stat_health = 1	// Does the percentage health show in the stat panel for the mob
	ai_inactive = 0 	// Set to 1 to turn off most AI actions
	has_hands = 1		// Set to 1 to enable the use of hands and the hands hud
	humanoid_hands = 1	// Can a player in this mob use things like guns or AI cards?
	//hand_form = "hands"	// Used in IsHumanoidToolUser. 'Your X are not fit-'.
	//hud_gears		// Slots to show on the hud (typically none)
	//ui_icons		// Icon file path to use for the HUD, otherwise generic icons are used
	//r_hand_sprite = "metroid_r" // If they have hands
	//l_hand_sprite = "metroid_l" // they could use some icons.
	player_msg = "SUCC." // Message to print to players about 'how' to play this mob on login.





/mob/living/simple_animal/hostile/metroid/init_vore() //graciously ~stolen~ inspired from the Synx code
	..()
	var/obj/belly/B = vore_selected
	B.vore_verb = "swallow"
	B.name = "membrane"
	B.desc	= "The metroid positions itself above you and swoops down, lazily enveloping you through its tight mouth and sending you straight to its bulbous membrane for all to see."
	B.emote_lists[DM_HOLD] = list(
	"The metroid's cortex tentacles wriggle over you, violating and teasing you as they sopped you in viscous slime.",
	"The cortex you are forced against pulses with life, gently squeezing you between it and the stretchy membrane around you.",
	"You press your face against the transparent membrane, watching how the world distorts as it stretches over your eyes.",
	"The air around you is so thick. You struggle to breathe occasionally, choking on the heat and moisture.",
	"You struggle a bit, making the membrane swell out."
	)
	B.emote_lists[DM_DIGEST] = list(
	"The cortex tentacles are pulsating like lines of power streaking away from you as it drains you. Waves of sleepiness wash over you as the areas most closest to the tentacles are drained of energy.",
	"The air feels a tinge incendiary as the cortex you rest on heats up, fueled by your own body as the metroid draws your strenght away from you.",
	"As you grow weaker, your movements against the membrane grow weaker as well, making you feel as if the membrane is closing around you, wrapping and squeezing you, draining you for all you are worth.",
	"You feel faint as the tentacles wrapped around you sap you of your strength, seemingly eager to drain and claim you for food."
	)
	B.digest_messages_prey = list(
	"You can't stay awake anymore, the clear world around you going fuzzy until you can see it no more.",
	"The tinge of the air grows to a crescendo and then fades away, just as the rest of your body fizzles into energy for the metroid.",
	"The tentacles squeeze you one last time as the last of your energy is sapped and your body is claimed as food for the metroid.",
	"The metroid swells as it absorbs the rest of your life force and nutrients into its body, making it stronger and even hungry for more."
	)

/mob/living/simple_animal/hostile/metroid //activate noms
	vore_active = 1
	vore_pounce_chance = 25
	vore_icons = SA_ICON_LIVING
	isEdible = 0

/mob/living/simple_animal/hostile/metroid/death()
	playsound(src, 'sound/effects/metroiddeath.ogg', 50, 1)
	..()

/mob/living/simple_animal/hostile/metroid/pet //Security's pet
	name = "Jellybrig"
	desc = "This one scree's happily at you."
	hostile = 0
	retaliate = 1 //Just making sure. Hostile and Retaliate vars are literally the only difference between a hostile and a retaliate mob.
	faction = "neutral"
	maxHealth = 400
	health = 400
	melee_damage_lower = 2
	melee_damage_upper = 9
	move_to_delay = 6
	harm_intent_damage = 1
	speak_chance = 1
	stop_when_pulled = 1
	armor = list(
				"melee" = 50,
				"bullet" = -90,
				"laser" = 0,
				"energy" = -50,
				"bomb" = 70,
				"bio" = 100,
				"rad" = 100)		
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 3
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 90 //Don't punch or grab this guy. He will grab you instead!
	swallowTime = 1 SECONDS //Hungry little bastards.
	vore_default_mode = DM_HOLD
	vore_digest_chance = 1		// Chance to switch to digest mode if resisted
	vore_absorb_chance = 0
	vore_escape_chance = 10


/mob/living/simple_animal/hostile/metroid/mine
	name = "Mochtroid"
	desc = "Some sort of person eaty thing! But weak compared to regular Metroids!"
	tt_desc = "Headamus Suckumus Weakamus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "metroid_dead"
	icon_living = "mochtroid"
	icon_state = "mochtroid"

	vore_active = 1
	vore_pounce_chance = 50
	vore_icons = SA_ICON_LIVING
/mob/living/simple_animal/hostile/metroid/mine/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.digest_burn = 1
	B.digest_brute = 0
	

/mob/living/simple_animal/hostile/metroid/mine/death()
	playsound(src, 'sound/effects/metroiddeath.ogg', 50, 1)
	..()
	if(prob(20))
		visible_message("<span class='notice'>\The [src] dropped some toy!</span>")
		var/location = get_turf(src)
		new /obj/item/toy/figure/samus(location)





/mob/living/simple_animal/hostile/metroid/evolution/baby
	name = "baby metroid"
	desc = "The baby the baby the baby the baby the baby the baby the baby the baby."
	tt_desc = "Minimus Headamus Suckumus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "baby_dead"
	icon_living = "baby"
	icon_state = "baby"
	intelligence_level = SA_ANIMAL
	speak_emote = list("churrs")
	health = 200
	maxHealth = 200
	melee_damage_lower = 1
	melee_damage_upper = 5
	melee_miss_chance = 0
	armor = list(
				"melee" = 0,
				"bullet" = -60,
				"laser" = 60,
				"energy" = 10,
				"bomb" = -100,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	move_to_delay = 3

	//Metroids aren't affected by most atmospheres except cold.
	minbodytemp = T0C-40
	cold_damage_per_tick = 100
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0


	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 800
	evo_limit = 1000
	next = "/mob/living/simple_animal/hostile/metroid/evolution/super"
	vore_active = 0

/mob/living/simple_animal/hostile/metroid/evolution/baby/New()
	playsound(src, 'sound/metroid/metroidsee.ogg', 100, 1)
	..()



//------------------------------------------------------------------------------------------------------------




/mob/living/simple_animal/hostile/metroid/evolution/super
	name = "super metroid"
	desc = "Some kind of head sucky thing!"
	tt_desc = "Maximus Headamus Suckumus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"
	intelligence_level = SA_ANIMAL
	speak_emote = list("churrs")
	health = 250
	maxHealth = 250
	melee_damage_lower = 2
	melee_damage_upper = 9
	melee_miss_chance = 0
	armor = list(
				"melee" = 0,
				"bullet" = -50,
				"laser" = 90,
				"energy" = 10,
				"bomb" = -100,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	move_to_delay = 3

	//Metroids aren't affected by most atmospheres except cold.
	minbodytemp = T0C-40
	cold_damage_per_tick = 100
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 1200
	evo_limit = 1400
	next = "/mob/living/simple_animal/hostile/metroid/combat/alpha"

	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 25 //Metroids only eat incapacitated targets
	vore_default_mode = DM_DIGEST
	swallowTime = 1 SECONDS //Hungry little bastards.
	vore_escape_chance = 50

/mob/living/simple_animal/hostile/metroid/evolution/super/New()
	playsound(src, 'sound/metroid/metroidsee.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/evolution/super/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()




//------------------------------------------------------------------------------------------------------------



/mob/living/simple_animal/hostile/metroid/combat/alpha
	name = "alpha metroid"
	desc = "Some kind of head rammy thing!"
	tt_desc = "Minimus Headamus Rammamus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "alpha_dead"
	icon_living = "alpha"
	icon_state = "alpha"
	intelligence_level = SA_ANIMAL
	health = 300
	maxHealth = 300
	melee_damage_lower = 10
	melee_damage_upper = 15
	melee_miss_chance = 5
	attacktext = list("rammed")
	armor = list(
				"melee" = 50,
				"bullet" = 15,
				"laser" = 50,
				"energy" = 60,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	move_to_delay = 3

	//Alphas lose their vulnerability to cold.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 1200
	evo_limit = 1400
	next = "/mob/living/simple_animal/hostile/metroid/combat/gamma"

/mob/living/simple_animal/hostile/metroid/combat/alpha/New()
	playsound(src, 'sound/metroid/metroidsee.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/alpha/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/alpha //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 15 //Alphas will try knocking targets over since they lost their stun ability from the initial phases.
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 40






//------------------------------------------------------------------------------------------------------------



/mob/living/simple_animal/hostile/metroid/combat/gamma
	name = "gamma metroid"
	desc = "Some kind of head rammy thing! This one shoots electricity!"
	tt_desc = "Maximus Headamus Rammamus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "gamma_dead"
	icon_living = "gamma"
	icon_state = "gamma"
	intelligence_level = SA_ANIMAL
	health = 400
	maxHealth = 400
	melee_damage_lower = 10
	melee_damage_upper = 20
	melee_miss_chance = 5
	attacktext = list("rammed")
	armor = list(
				"melee" = 55,
				"bullet" = 15,
				"laser" = 50,
				"energy" = 90,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	move_to_delay = 4

	move_shoot = 1				//Move and shoot at the same time.
	ranged_cooldown = 0 		//What the starting cooldown is on ranged attacks
	ranged_cooldown_time = 150 	//How long, in deciseconds, the cooldown of ranged attacks is
	projectilesound = 'sound/weapons/taser2.ogg'
	projectiletype = /obj/item/projectile/beam/stun/weak
	firing_lines = 1
	cooperative = 1


	//Not affected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	var/emp_chance = 20 // Beware synths
	evo_point = 1200
	evo_limit = 1400
	next = "/mob/living/simple_animal/hostile/metroid/combat/zeta"

/mob/living/simple_animal/hostile/metroid/combat/gamma/New()
	playsound(src, 'sound/metroid/metroidgamma.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/gamma/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/gamma //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 15
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 30



//------------------------------------------------------------------------------------------------------------



/mob/living/simple_animal/hostile/metroid/combat/zeta
	name = "zeta metroid"
	desc = "Some kind of feet stompy thing!"
	tt_desc = "Minimus Feetamus Walkamus"
	icon = 'icons/mob/metroid/large.dmi'
	icon_dead = "zeta_dead"
	icon_living = "zeta"
	icon_state = "zeta"
	intelligence_level = SA_ANIMAL
	health = 500
	maxHealth = 500
	melee_damage_lower = 15
	melee_damage_upper = 25
	melee_miss_chance = 5
	attack_armor_pen = 10
	attacktext = list("slashed")
	armor = list(
				"melee" = 70,
				"bullet" = 15,
				"laser" = 50,
				"energy" = 60,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	move_to_delay = 4

	move_shoot = 1				//Move and shoot at the same time.
	ranged_cooldown = 0 		//What the starting cooldown is on ranged attacks
	ranged_cooldown_time = 60 	//How long, in deciseconds, the cooldown of ranged attacks is
	rapid = 0					// Three-round-burst fire mode //decided to disalbe for the zeta
	projectiletype	= /obj/item/projectile/energy/metroidacid	// The projectiles I shoot
	projectilesound = 'sound/weapons/slashmiss.ogg' // The sound I make when I do it

	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	pixel_x = -16
	pixel_y = -16
	old_x = -16
	old_y = -16

	response_help = "pets"

	speak = list(
		"Ereeeer...",
		"Rerrr..."
		)
	emote_hear = list()
	emote_see = list(
		"RAWR!"
		)

	cooperative = 1
	evo_point = 1600
	evo_limit = 1800
	next = "/mob/living/simple_animal/hostile/metroid/combat/omega"

/mob/living/simple_animal/hostile/metroid/combat/zeta/New()
	playsound(src, 'sound/metroid/metroidzeta.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/zeta/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/zeta //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 20
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 20




//------------------------------------------------------------------------------------------------------------



/mob/living/simple_animal/hostile/metroid/combat/omega
	name = "omega metroid"
	desc = "Those are some big claws!"
	tt_desc = "Maximus Feetamus Walkamus"
	icon = 'icons/mob/metroid/large.dmi'
	icon_dead = "omega_dead"
	icon_living = "omega"
	icon_state = "omega"
	intelligence_level = SA_ANIMAL
	health = 600
	maxHealth = 600
	melee_damage_lower = 25
	melee_damage_upper = 40
	melee_miss_chance = 5
	attack_armor_pen = 20
	attacktext = list("slashed")
	armor = list(
				"melee" = 75,
				"bullet" = 40,
				"laser" = 55,
				"energy" = 60,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	speed = 4
	move_to_delay = 5

	move_shoot = 1				//Move and shoot at the same time.
	ranged_cooldown = 0 		//What the starting cooldown is on ranged attacks
	ranged_cooldown_time = 150 	//How long, in deciseconds, the cooldown of ranged attacks is
	rapid = 0					// Three-round-burst fire mode
	projectiletype	= /obj/item/projectile/beam/smalllaser	// The projectiles I shoot
	projectilesound = 'sound/weapons/Flamer.ogg' // The sound I make when I do it

	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	response_help = "pets"

	speak = list(
		"Rurrr...",
		)
	emote_hear = list()
	emote_see = list(
		"ROAR"
		)

	cooperative = 1
	evo_point = 1700
	evo_limit = 2000
	next = "/mob/living/simple_animal/hostile/metroid/combat/queen"

/mob/living/simple_animal/hostile/metroid/combat/omega/New()
	playsound(src, 'sound/metroid/metroidomega.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/omega/death()
	playsound(src, 'sound/metroid/metroidomegadeath.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/omega //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 2
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 40
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 10




//------------------------------------------------------------------------------------------------------------



/mob/living/simple_animal/hostile/metroid/combat/queen
	name = "queen metroid"
	desc = "The mother of all Metroids - allowed to have grown too far!"
	tt_desc = "Maximus Queenamus Deathamus"
	icon = 'icons/mob/metroid/queen.dmi'
	icon_dead = "queen_dead"
	icon_living = "queen"
	icon_state = "queen"
	intelligence_level = SA_ANIMAL
	health = 1000
	maxHealth = 1000
	melee_damage_lower = 30
	melee_damage_upper = 60
	melee_miss_chance = 5
	attack_armor_pen = 20
	attacktext = list("gnashed")
	armor = list(
				"melee" = 75,
				"bullet" = 40,
				"laser" = 60,
				"energy" = 90,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	gender = NEUTER
	faction = "metroids"
	move_to_delay = 6

	move_shoot = 1				//Move and shoot at the same time.
	ranged_cooldown = 0 		//What the starting cooldown is on ranged attacks
	ranged_cooldown_time = 120 	//How long, in deciseconds, the cooldown of ranged attacks is
	rapid = 1					// Three-round-burst fire mode
	projectiletype	= /obj/item/projectile/energy/metroidacid	// The projectiles I shoot
	projectilesound = 'sound/weapons/slashmiss.ogg' // The sound I make when I do it

	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	pixel_x = -16
	pixel_y = -16
	old_x = -16
	old_y = -16

	response_help = "pets"

	emote_hear = list()
	emote_see = list(
		"ROAR"
		)

	cooperative = 1
	evo_point = 1100
	evo_limit = INFINITY
	next = null

/mob/living/simple_animal/hostile/metroid/combat/queen/New()
	playsound(src, 'sound/metroid/metroidqueen.ogg', 100, 1)
	queen_amount++
	..()

/mob/living/simple_animal/hostile/metroid/combat/queen/death()
	playsound(src, 'sound/metroid/metroidqueendeath.ogg', 100, 1)
	queen_amount--
	..()


/mob/living/simple_animal/hostile/metroid/combat/queen //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 4
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 60 //It's the queen, and it's hungry.
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	vore_escape_chance = 0 //You're not climbing out of that neck


//------------------------------------------------------------------------------------------------------------



/*
//Objects related to the Metroids.
//Projectile for the Metroids.
*/


/obj/item/projectile/energy/metroidacid

	name = "metroid acid"
	icon_state = "neurotoxin"
	damage = 10
	damage_type = TOX
	agony = 10
	check_armour = "bio"
	armor_penetration = 50

//EGG! Metroid egg and its mechanics. Ripped from spiders.
/obj/effect/metroid/egg
	name = "egg cluster"
	desc = "It seems to pulse slightly with an inner life"
	icon = 'icons/mob/metroid/small.dmi'
	icon_state = "egg"
	var/amount_grown = 0
	var/metroid_type = /mob/living/simple_animal/hostile/metroid/evolution/baby
	New()
		pixel_x = rand(3,-3)
		pixel_y = rand(3,-3)
		processing_objects |= src

/obj/effect/metroid/egg/New(var/location, var/atom/parent)
	get_light_and_color(parent)
	..()

/obj/effect/metroid/egg/Destroy()
	processing_objects -= src
	if(istype(loc, /obj/item/organ/external))
		var/obj/item/organ/external/O = loc
		O.implants -= src

	return ..()

/obj/effect/metroid/egg/process()
	amount_grown += rand(0,2)
	if(amount_grown >= 100)
		new metroid_type(src.loc, src)
		qdel(src)




//------------------------------------------------------------------------------------------------------------






/*
//LIFE STUFF, AND MECHANICS!
//FOR THE BABY AND SUPER FORMS!
*/



/mob/living/simple_animal/hostile/metroid/evolution/Life()
	. = ..()

	if(stat != DEAD)
		if(canEvolve == 1 && nutrition >= evo_limit && (buckled || vore_fullness == 1)) //spit dat crap out if nutrition gets too high!
			release_vore_contents()
			prey_excludes.Cut()
			stop_consumption()

		if(canEvolve == 1 && nutrition >= evo_point && !buckled && vore_fullness == 0 && !victim)
			playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
			paralysis = 7998
			sleep(50)
			paralysis = 0
			expand_troid()
			return
		if(stance == 7) //Necessary to fix a bug where if their vore prey or latching victim is laying down when they evolve, they get stuck in stance 7 and do nothing.
			stance = 4
			return
		else
			handle_idle()

/mob/living/simple_animal/hostile/metroid/proc/expand_troid()
	new next(get_turf(src))
	visible_message("<span class='warning'>\The [src] suddenly evolves!</span>")
	qdel(src)


/mob/living/simple_animal/hostile/metroid/evolution/handle_regular_status_updates()
	if(stat != DEAD)

		if(victim)
			handle_consumption()


		handle_stuttering()

	..()



/mob/living/simple_animal/hostile/metroid/evolution/proc/handle_idle()
	//Do we have a vent ? Good, let's take a look
	
	for(entry_vent in view(1, src))
		if(prob(99) || ai_inactive == 1) //1% chance to consider a vent, to try and avoid constant vent switching
			return
		visible_message("<span class='danger'>\The [src] starts trying to slide itself into the vent!</span>")
		sleep(50) //Let's stop the metroid for five seconds to do its parking job
		..()
		if(entry_vent.network && entry_vent.network.normal_members.len)
			var/list/vents = list()
			for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in entry_vent.network.normal_members)
				vents.Add(temp_vent)
			if(!vents.len)
				entry_vent = null
				return
			var/obj/machinery/atmospherics/unary/vent_pump/exit_vent = pick(vents)
			spawn()
				visible_message("<span class='danger'>\The [src] suddenly disappears into the vent!</span>")
				loc = exit_vent
				var/travel_time = round(get_dist(loc, exit_vent.loc)/2)
				spawn(travel_time)
					if(!exit_vent || exit_vent.welded)
						forceMove(get_turf(entry_vent))
						entry_vent = null
						visible_message("<span class='danger'>\The [src] suddenly appears from the vent!</span>")
						return

					forceMove(get_turf(exit_vent))
					entry_vent = null
					visible_message("<span class='danger'>\The [src] suddenly appears from the vent!</span>")
		else
			entry_vent = null

/mob/living/simple_animal/hostile/metroid/evolution/proc/adjust_nutrition(input)
	nutrition = between(0, nutrition + input, evo_limit) //Just is a thing to handle the stun from the metroid.

	if(input > 0)
		if(prob(input * 2)) // Gain around one level per 50 nutrition
			power_charge = min(power_charge++, 10)


/mob/living/simple_animal/hostile/metroid/evolution/PunchTarget() //this segment determines what the mob does depending on its intent.
	if(victim)
		return // Already eatting someone.
	if(!client) // AI controlled.
		if( (!target_mob.lying && prob(60) || (!target_mob.lying && optimal_combat) )) // "Smart" metroids always stun first.
			a_intent = I_DISARM // Stun them first.
		else if(can_consume(target_mob) && target_mob.lying)
			a_intent = I_GRAB // Then eat them.
		else
			a_intent = I_HURT // Otherwise robust them.
	ai_log("PunchTarget() will [a_intent] [target_mob]",2)
	..()

/mob/living/simple_animal/hostile/metroid/evolution/proc/can_consume(var/mob/living/L) //This checks to see if the mob can latch onto the target and marks it TRUE.
	if(!L || !istype(L))
		to_chat(src, "This subject is incomparable...")
		return FALSE
	if(L.isSynthetic())
		to_chat(src, "This subject is not biological...")
		return FALSE
	if(L.getarmor(null, "bio") >= 75)
		to_chat(src, "I cannot reach this subject's biological matter...")
		return FALSE
	if(istype(L, /mob/living/simple_animal/hostile/metroid))
		to_chat(src, "I cannot feed on other metroids...")
		return FALSE
	if(!Adjacent(L))
		to_chat(src, "This subject is too far away...")
		return FALSE
	if(istype(L, /mob/living/carbon) && L.getCloneLoss() >= L.getMaxHealth() * 1.5 || istype(L, /mob/living/simple_animal) && L.stat == DEAD)
		to_chat(src, "This subject does not have an edible life energy...")
		return FALSE
	if(L.has_buckled_mobs())
		for(var/A in L.buckled_mobs)
			if(istype(A, /mob/living/simple_animal/hostile/metroid))
				if(A != src)
					to_chat(src, "\The [A] is already feeding on this subject...")
					return FALSE
	return TRUE

/mob/living/simple_animal/hostile/metroid/evolution/proc/start_consuming(var/mob/living/L) //This segment gets the mob to latch onto the target.
	if(!can_consume(L))
		return
	if(!Adjacent(L))
		return
	step_towards(src, L) // Get on top of them to feed.
	if(loc != L.loc)
		return
	if(L.buckle_mob(src, forced = TRUE))
		victim = L
		update_icon()
		playsound(src, 'sound/metroid/metroidattach.ogg', 100, 1)
		victim.visible_message("<span class='danger'>\The [src] latches onto [victim]!</span>",
		"<span class='danger'>\The [src] latches onto you!</span>")
//		stop_automated_movement = 1

/mob/living/simple_animal/hostile/metroid/evolution/proc/stop_consumption()
	if(!victim)
		return
	victim.unbuckle_mob()
	playsound(loc, 'sound/metroid/metroiddetach.ogg', 50, 1, -1)
	victim.visible_message("<span class='notice'>\The [src] slides off of [victim]!</span>",
	"<span class='notice'>\The [src] slides off of you!</span>")
	victim = null
	update_icon()
	sleep(50)
//	stop_automated_movement = 0


/mob/living/simple_animal/hostile/metroid/evolution/proc/handle_consumption()
	if(victim && can_consume(victim) && !stat)

		var/armor_modifier = abs((victim.getarmor(null, "bio") / 100) - 1)
		if(istype(victim, /mob/living/carbon))
			victim.adjustCloneLoss(rand(2,6) * armor_modifier)
			victim.adjustToxLoss(rand(1,2) * armor_modifier)
			if(victim.health <= 0)
				victim.adjustToxLoss(rand(2,4) * armor_modifier)

		else if(istype(victim, /mob/living/simple_animal))
			victim.adjustBruteLoss(rand(4, 12))

		else
			to_chat(src, "<span class='warning'>[pick("This subject is incompatable", \
			"This subject does not have a life energy", "This subject is empty", "I am not satisified", \
			"I can not feed from this subject", "I do not feel nourished", "This subject is not food")]...</span>")
			stop_consumption()

		adjust_nutrition(35 * armor_modifier)
		playsound(src, 'sound/metroid/metroidattack.ogg', 50, 1)

		adjustOxyLoss(-10 * armor_modifier) //Heal yourself
		adjustBruteLoss(-10 * armor_modifier)
		adjustFireLoss(-10 * armor_modifier)
		adjustCloneLoss(-10 * armor_modifier)
		updatehealth()
		if(victim)
			victim.updatehealth()
	else
		stop_consumption()

/mob/living/simple_animal/hostile/metroid/evolution/DoPunch(var/mob/living/L) //Metroid melee.
	var/damage_to_do = rand(melee_damage_lower, melee_damage_upper)
	var/armor_modifier = abs((L.getarmor(null, "bio") / 100) - 1)

	if(!Adjacent(L)) // Might've moved away in the meantime.
		return

	if(istype(L))

		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			// Metroid attacks can be blocked with shields.
			if(H.check_shields(damage = 0, damage_source = null, attacker = src, def_zone = null, attack_text = "the attack"))
				return

			switch(a_intent)
				if(I_HELP)
					ai_log("DoPunch() against [L], helping.",2)
					L.visible_message("<span class='notice'>[src] gently pokes [L]!</span>",
					"<span class='notice'>[src] gently pokes you!</span>")
					do_attack_animation(L)

				if(I_DISARM) //The metroid does all this too try to knock the player down.
					ai_log("DoPunch() against [L], disarming.",2)
					var/stun_power = between(0, power_charge + rand(0, 3), 10)

					if(ishuman(L))
						stun_power *= max(H.species.siemens_coefficient,0)


					if(prob(stun_power * 10))
						power_charge = max(0, power_charge - 3)
						L.visible_message("<span class='danger'>[src] has shocked [L]!</span>", "<span class='danger'>[src] has shocked you!</span>")
						playsound(src, 'sound/weapons/Egloves.ogg', 75, 1)
						L.Weaken(4)
						L.Stun(4)
						do_attack_animation(L)
						if(L.buckled)
							L.buckled.unbuckle_mob() // To prevent an exploit where being buckled prevents metroids from jumping on you.
						L.stuttering = max(L.stuttering, stun_power)

						var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
						s.set_up(5, 1, L)
						s.start()

						if(prob(stun_power * 10) && stun_power >= 8)
							L.adjustFireLoss(power_charge * rand(1, 2))

					else if(prob(40))
						L.visible_message("<span class='danger'>[src] has pounced at [L]!</span>", "<span class='danger'>[src] has pounced at you!</span>")
						playsound(src, 'sound/metroid/metroidswoosh.ogg', 75, 1)
						L.Weaken(2)
						do_attack_animation(L)
						if(L.buckled)
							L.buckled.unbuckle_mob() // To prevent an exploit where being buckled prevents metroids from jumping on you.
					else
						L.visible_message("<span class='danger'>[src] has tried to pounce at [L]!</span>", "<span class='danger'>[src] has tried to pounce at you!</span>")
						playsound(src, 'sound/weapons/punchmiss.ogg', 75, 1)
						do_attack_animation(L)
					L.updatehealth()
					return L

				if(I_GRAB) //The metroid does this to start sucking their head off.
					ai_log("DoPunch() against [L], grabbing.",2)
					start_consuming(L)


				if(I_HURT) //The metroid does this if it can't latch onto the target or it decides not to try knocking them down.
					ai_log("DoPunch() against [L], hurting.",2)

					L.attack_generic(src, damage_to_do, pick(attacktext))
					playsound(src, 'sound/weapons/bite.ogg', 75, 1)

					// Give the Metroid some nutrition, if applicable, even if not attached.
					if(!L.isSynthetic())
						if(ishuman(L))
							if(L.getCloneLoss() < L.getMaxHealth() * 1.5)
								adjust_nutrition(5 + damage_to_do * armor_modifier)

		else if(istype(L, /mob/living/simple_animal))
			if(!ismetroid(L))
				var/mob/living/simple_animal/SA = L
				if(!SA.stat)
					L.attack_generic(src, damage_to_do, pick(attacktext))
					adjust_nutrition(damage_to_do * 5)



	if(istype(L,/obj/mecha))
		var/obj/mecha/M = L
		M.attack_generic(src, rand(melee_damage_lower, melee_damage_upper), pick(attacktext))



/mob/living/simple_animal/hostile/metroid/evolution/attack_hand(mob/living/carbon/human/M as mob)
	if(victim) // Are we eating someone?
		var/fail_odds = 30
		if(victim == M) // Harder to get the metroid off if its eating you right now.
			fail_odds = 60

		if(prob(fail_odds))
			visible_message("<span class='warning'>[M] attempts to wrestle \the [name] off!</span>")
			playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

		else
			visible_message("<span class='warning'> [M] manages to wrestle \the [name] off!</span>")
			stop_consumption()
			step_away(src,M)
			paralysis = 7998
			sleep(50)
			paralysis = 0


/mob/living/simple_animal/hostile/metroid/evolution/FindTarget() //This makes it so it doesn't go after another target while succing.
	if(victim) // Don't worry about finding another target if we're sucking on someone's head.
		return
	..()


/mob/living/simple_animal/hostile/metroid/evolution/ClosestDistance()
	if(target_mob.stat == DEAD)
		return 1 // Melee (eat) the target if dead, don't shoot it.
	return ..()


/mob/living/simple_animal/hostile/metroid/evolution/handle_resist()
	if(buckled && victim && isliving(buckled) && victim == buckled) //This ensures that when it latches onto a prey, it stays latched until otherwise. It's gotta be buckled to its victim, and the victim must be alive.
		return
	else
		..()



/mob/living/simple_animal/hostile/metroid/evolution/baby/Found(mob/living/L)
	if(isliving(L))
		if(SA_attackable(L))
			if(L.faction == faction && !attack_same)
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					if(istype(H.species, /datum/species/monkey)) // istype() is so they'll eat the alien monkeys too.
						return H // Monkeys are always food.
					else
						return

			if(ishuman(L))
				var/mob/living/carbon/human/H = L
				if(istype(H.species, /datum/species/monkey)) // istype() is so they'll eat the alien monkeys too.
					return H // Monkeys are always food.
	return






/*
//LIFE PROCS!
//FOR THE COMBAT FORMS
*/



/mob/living/simple_animal/hostile/metroid/combat/Life()
	. = ..()

	if(canEvolve == 1 && nutrition >= evo_limit && vore_fullness == TRUE) //spit dat crap out if nutrition gets too high!
		release_vore_contents()
		prey_excludes.Cut()

	if(canEvolve == 1 && nutrition >= evo_point && vore_fullness == 0 && next != "/mob/living/simple_animal/hostile/metroid/combat/queen")
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		paralysis = 7998
		sleep(50)
		paralysis = 0
		expand_troid()
		return

	else if(queen_amount == 0 && prob(5) && canEvolve == 1 && nutrition >= evo_point && vore_fullness == 0 && next == "/mob/living/simple_animal/hostile/metroid/combat/queen")
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		paralysis = 7998
		sleep(50)
		paralysis = 0
		expand_troid()

	else if(next == null && canEvolve == 1 && nutrition >= evo_point)
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		src.visible_message("<span class='notice'>\The [src] begins to lay an egg.</span>")
		stop_automated_movement = 1
		spawn(50)
		new /obj/effect/metroid/egg(loc, src)
		stop_automated_movement = 0
		nutrition = 400
		return

	if(stance == 7) //Necessary to fix a bug where if their prey or latching victim is laying down when they evolve, they get stuck in stance 7 and do nothing.
		stance = 4
		return




/mob/living/simple_animal/hostile/metroid/combat/proc/adjust_nutrition(input)
	nutrition = (nutrition + input) //It handles the metroid's nutrition gain from melee.



/mob/living/simple_animal/hostile/metroid/combat/PunchTarget() //this segment determines what the mob does depending on its intent.
	if(!client) // AI controlled.
		a_intent = I_HURT // Otherwise robust them.
	ai_log("PunchTarget() will [a_intent] [target_mob]",2)
	..()



/mob/living/simple_animal/hostile/metroid/combat/DoPunch(var/mob/living/L) //Metroid actions vs the player.
	var/damage_to_do = rand(melee_damage_lower, melee_damage_upper)
	var/armor_modifier = abs((L.getarmor(null, "bio") / 100) - 1)

	if(!Adjacent(L)) // Might've moved away in the meantime.
		return

	if(istype(L))
		if(ishuman(L))
			switch(a_intent)
				if(I_HELP)
					ai_log("DoPunch() against [L], helping.",2)
					L.visible_message("<span class='notice'>[src] gently pokes [L]!</span>",
					"<span class='notice'>[src] gently pokes you!</span>")
					do_attack_animation(L)


				if(I_HURT) //The metroid does this if it can't latch onto the target or it decides not to try knocking them down.
					ai_log("DoPunch() against [L], hurting.",2)



					L.attack_generic(src, damage_to_do, pick(attacktext))
					playsound(src, 'sound/weapons/bite.ogg', 75, 1)

					// Give the Metroid some nutrition, if applicable, even if not attached.
					if(!L.isSynthetic())
						if(ishuman(L))
							if(L.getCloneLoss() < L.getMaxHealth() * 1.5)
								adjust_nutrition(25 + damage_to_do * armor_modifier)

		else if(istype(L, /mob/living/simple_animal))
			if(!ismetroid(L))
				var/mob/living/simple_animal/SA = L
				if(!SA.stat)
					L.attack_generic(src, damage_to_do, pick(attacktext))
					adjust_nutrition(damage_to_do * 5)


	if(istype(L,/obj/mecha))
		var/obj/mecha/M = L
		M.attack_generic(src, rand(melee_damage_lower, melee_damage_upper), pick(attacktext))



/mob/living/simple_animal/hostile/metroid/combat/ClosestDistance()
	if(target_mob.stat == DEAD)
		return 1 // Melee (eat) the target if dead, don't shoot it.
	return ..()
	