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
//Yes I'm basing this shit on the tomato, sue me. -shark
/mob/living/simple_animal/hostile/tomato/piranha
	//icon = overridefile to be made
	//icon_state = "piranha" //to be made
	//icon_living = "piranha" //to be made
	//icon_dead = "piranha_dead" //to be made
	name = "Piranha Plant"
	desc = "It's a plant, that eats people!"
	tt_desc = "Packun Flower"
	maxHealth = 100
	health = 100
	harm_intent_damage = 1
	melee_damage_upper = 1
	melee_damage_lower = 1
	attacktext = list("chomped","bit","hompfed","crunched","cronched")
	meat_type = null

	//Vore stuff
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 80
	vore_standing_too = 1
	vore_ignores_undigestable = 0 
	vore_default_mode = DM_DIGEST
	vore_digest_chance = 99	
	vore_absorb_chance = 0
	vore_escape_chance = 5
	vore_icons = 0 //no vore icons
	swallowTime = 10 SECONDS //CHOMPED

	//Movement Stuff
	wander = 0		// Does the mob wander around when idle?
	wander_distance = 0	// How far the mob will wander before going home (assuming they are allowed to do that)
	returns_home = 1	// Mob knows how to return to wherever it started
	turns_per_move = 1	// How many life() cycles to wait between each wander mov?
	stop_when_pulled = 0 	// When set to 1 this stops the animal from moving when someone is pulling it.
	follow_dist = 2		// Distance the mob tries to follow a friend
	speed = 4		// Higher speed is slower, negative speed is faster.

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

	/* //Attack ranged settings, This will be used for the second time, the piranha spitters
	var/ranged = 1		// Do I attack at range?
	var/shoot_range = 5	// How far away do I start shooting from?
	var/rapid = 0		// Three-round-burst fire mode
	var/firing_lines = 0	// Avoids shooting allies
	var/projectiletype	// The projectiles I shoot
	var/projectilesound	// The sound I make when I do it
	var/casingtype		// What to make the hugely laggy casings pile out of*/
	
//When I stop being lazy I'll give this its own file -Shark
