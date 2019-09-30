/mob/living/simple_animal/hostile/tomato
	name = "tomato"
	desc = "It's a horrifyingly enormous beef tomato, and it's packing extra beef!"
	tt_desc = "X Solanum abominable"
	icon_state = "tomato"
	icon_living = "tomato"
	icon_dead = "tomato_dead"
	intelligence_level = SA_PLANT

	faction = "plants"
	maxHealth = 15
	health = 15
	turns_per_move = 5

	response_help  = "prods"
	response_disarm = "pushes aside"
	response_harm   = "smacks"

	harm_intent_damage = 5
	melee_damage_upper = 15
	melee_damage_lower = 10
	attacktext = list("mauled")

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/tomatomeat

//CHOMPEDIT PIRANHA PLANT.
//When I stop being lazy I'll give this its own file -shark
//Yes I'm basing this shit on the tomato, sue me. -shark
//No longer based on tomato because evolved too far -shark
/mob/living/simple_animal/hostile/piranhaplant
	name = "Piranha Plant"
	desc = "It's a plant, that eats people!"
	tt_desc = "Packun Flower"

	faction = "plants"
	intelligence_level = SA_PLANT

	maxHealth = 50
	health = 50
	meat_type = null

	//Mob icon/appearance settings
	icon = 'icons/mob/plantmobs32x32.dmi' //Thanks to vorebound mod and Estelle
	icon_living = "piranha-plant"
	icon_state = "piranha-plant"
	icon_dead = "piranha-plant_dead"
	icon_gib = "generic_gib"	// The iconstate for being gibbed, optional. Defaults to a generic gib animation.
	//icon_rest = null		// The iconstate for resting, optional
	attack_icon = 'icons/effects/effects.dmi' //Just the default, played like the weapon attack anim
	attack_icon_state = "slash" 	//Just the default //gonna have to make teeth chomping version

	//Vore stuff
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 10
	vore_standing_too = 1
	vore_ignores_undigestable = 0
	vore_default_mode = DM_DIGEST
	vore_digest_chance = 99
	vore_absorb_chance = 0
	vore_escape_chance = 5
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //CHOMPED

	//Movement Stuff
	wander = 0		// Does the mob wander around when idle?
	wander_distance = 0	// How far the mob will wander before going home (assuming they are allowed to do that)
	returns_home = 1	// Mob knows how to return to wherever it started
	turns_per_move = 4	// How many life() cycles to wait between each wander mov?
	stop_when_pulled = 0 	// When set to 1 this stops the animal from moving when someone is pulling it.
	follow_dist = 0		// Distance the mob tries to follow a friend
	speed = 4		// Higher speed is slower, negative speed is faster.
	entangle_immunity = 1 //makes mob immune to entangle effect of vines and also wont get stabbed by vines that has thorns

	//Talk/Emote stuff
	speak_chance = 0		// Probability that I talk (this is 'X in 200' chance since even 1/100 is pretty noisy)
	reacts = 1			// Reacts to some things being said
	speak = list()			// Things I might say if I talk
	emote_hear = list("chomps","snaps at the air")	// Hearable emotes I might perform
	emote_see = list()		// Unlike speak_emote, the list of things in this variable only show by themselves with no spoken text. IE: Ian barks, Ian yaps
	say_understood = list()		// List of things to say when accepting an order
	say_cannot = list()		// List of things to say when they cannot comply
	say_maybe_target = list()	// List of things to say when they spot something barely
	say_got_target = list()		// List of things to say when they engage a target
	reactions = list("chomp" = "!chomps",)	// List of "string" = "reaction" and things they hear will be searched for string.

	//Hostility war bloodshed, RAWR
	hostile = 1		// Do I even attack?
	view_range = 2		// Scan for targets in this range.
	investigates = 1	// Do I investigate if I saw someone briefly?
	cooperative = 1		// Do I ask allies to help me?
	assist_distance = 2	// Radius in which I'll ask my comrades for help.
	grab_resist = 100	// Chance of me resisting a grab attempt.
	taser_kill = 1		// Is the mob weak to tasers

	//Melee behaviour
	melee_damage_lower = 1		// Lower bound of randomized melee damage
	melee_damage_upper = 25		// Upper bound of randomized melee damage
	attacktext = list("chomped","bit","hompfed","crunched","cronched") // "You are [attacktext] by the mob!"
	friendly = list("nuzzles")	// "The mob [friendly] the person."
	//attack_sound = null		// Sound to play when I attack
	environment_smash = 0		// How much environment damage do I do when I hit stuff?
	melee_miss_chance = 1		// percent chance to miss a melee attack.
	melee_attack_minDelay = 5	// How long between attacks at least
	melee_attack_maxDelay = 20	// How long between attacks at most
	attack_armor_type = "bio"	// What armor does this check?
	attack_armor_pen = 50		// How much armor pen this attack has.
	attack_sharp = 1		// Is the attack sharp?
	attack_edge = 0			// Does the attack have an edge?

	//Stuff for people wanting to be a fucking plant. Weirdos
	show_stat_health = 1	// Does the percentage health show in the stat panel for the mob
	ai_inactive = 0 	// Set to 1 to turn off most AI actions
	has_hands = 1		// Set to 1 to enable the use of hands and the hands hud
	humanoid_hands = 1	// Can a player in this mob use things like guns or AI cards?
	//hand_form = "hands"	// Used in IsHumanoidToolUser. 'Your X are not fit-'.
	//hud_gears		// Slots to show on the hud (typically none)
	//ui_icons		// Icon file path to use for the HUD, otherwise generic icons are used
	//r_hand_sprite = "piranha_r" // If they have hands, //TODO make a leaf sprite for this
	//l_hand_sprite = "piranha_l" // they could use some icons.
	player_msg = "PLANT GO CHOMP" // Message to print to players about 'how' to play this mob on login.

//Ranged variation
/mob/living/simple_animal/hostile/piranhaplant/spitter
		//might snatch the code for that uranium ray for this since it should poison
	name = "Piranha Spitter"
	attack_armor_pen = 0
	//Attack ranged settings.
	ranged = 1		// Do I attack at range?
	shoot_range = 6		// How far away do I start shooting from?
	view_range = 5		//More range, more hurt, more... plant?
	rapid = 1		// Three-round-burst fire mode
	firing_lines = 0	// Avoids shooting allies
	projectiletype	= /obj/item/projectile/energy/piranhaspit	// The projectiles I shoot
	projectilesound = 'sound/weapons/thudswoosh.ogg' // The sound I make when I do it
	ranged_ignore_incapitated = 1 //make it so our spitter doesnt stun lock dorks
	ranged_cooldown_time = 90

//mob/living/simple_animal/hostile/piranhaplant/spitter/proc/Shoot()
	//TOX/HALLOSS swap code goes here //TODO

//Piranha unique projectile
/obj/item/projectile/energy/piranhaspit
    name = "piranha spit"
    icon_state = "neurotoxin"
    damage = 10
    damage_type = HALLOSS
    check_armour = "bio" //yup biohazard protection works here
    flash_strength = 0
    agony = 10
    combustion = FALSE

/obj/item/weapon/reagent_containers/food/snacks/soylentgreen/piranha
	name = "Soylent"
	desc = "This was spat out by a strange plant that eats people."
	icon_state = "soylent_green"
	filling_color = "#B8E6B5"
	center_of_mass = list("x"=15, "y"=11)

/obj/item/projectile/energy/piranhaspit/on_hit(var/atom/soyled)
    if(prob(5))
        soyl(soyled)
    ..()

/obj/item/projectile/energy/piranhaspit/proc/soyl(var/mob/M)
	var/location = get_turf(M)
	new /obj/item/weapon/reagent_containers/food/snacks/soylentgreen/piranha(location)

//VORE FLUFF section and extended gut settings
/mob/living/simple_animal/hostile/piranhaplant/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.vore_verb = "chomp up"
	B.name = "stomach"
	B.desc	= "You're pulled into the tight mouth of the plant. The teeth and walls gnash harshly on you!"
	B.digest_burn = 0
	B.digest_brute = 5
	
/mob/living/simple_animal/hostile/piranhaplant/spitter/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.vore_verb = "slurped up"
	B.desc	= "You're pulled into the tight mouth of the plant. The tongue mulls you about and squishes you around, coating you in a slurry of digestive fluides that burn hotly and smell foul."
	B.digest_burn = 5
	B.digest_brute = 0

/mob/living/simple_animal/hostile/piranhaplant/pitcher
	icon_state = "pitcher-plant"
	icon_living = "pitcher-plant"
	icon_dead = "pitcher-plant_dead"
	name = "Pitcher Plant"
	desc = "It's a plant! How pretty"
	tt_desc = "Brig Flower"
	health = 500
	maxHealth = 500
	var/antispam = 0
	swallowTime = 3 SECONDS //If you get to close to a pitcher, its your own fault ;p

/mob/living/simple_animal/hostile/piranhaplant/pitcher/death()
	..()
	new /obj/item/weapon/reagent_containers/food/snacks/aesirsalad(location)
	new /obj/item/weapon/reagent_containers/food/snacks/aesirsalad(location)
	new /obj/item/weapon/reagent_containers/food/snacks/aesirsalad(location)
	new /obj/item/weapon/reagent_containers/food/snacks/aesirsalad(location)
	qdel(src)

/mob/living/simple_animal/hostile/piranhaplant/pitcher/Life()
	..()
	if(!anchored)
		anchored=1
	if(vore_fullness && !antispam)
		antispam = 1
		spawn(10)
			if(bruteloss >= 1)
				bruteloss -= 1
			antispam = !antispam
			if(prob(3))
				new /obj/item/weapon/reagent_containers/food/snacks/soylentgreen/piranha(src.loc)

	if(size_multiplier!=1*health/100 && health >= 50 && health <= 300)
		size_multiplier=1*health/100
		update_icons()

/mob/living/simple_animal/hostile/piranhaplant/pitcher/New()
    ..()
    bruteloss = 400

/mob/living/simple_animal/hostile/piranhaplant/pitcher/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.desc	= "You're pulled into the tight stomach of the plant. The walls knead weakly around you, coating you in thick, viscous fluids that cling to your body, that soon starts to tingle and burn..."
	B.digest_burn = 0.5
	B.digest_brute = 0
	B.vore_verb = "slurp up"
	B.name = "pitcher"