/mob/living/simple_animal/hostile/clown
	name = "clown"
	desc = "A denizen of clown planet"
	tt_desc = "E Homo sapiens corydon" //this is an actual clown, as opposed to someone dressed up as one
	icon_state = "clown"
	icon_living = "clown"
	icon_dead = "clown_dead"
	icon_gib = "clown_gib"
	intelligence_level = SA_HUMANOID

	faction = "clown"
	maxHealth = 75
	health = 75
	speed = -1
	move_to_delay = 2

	run_at_them = 0
	cooperative = TRUE
	firing_lines = TRUE
	investigates = TRUE
	assist_distance = 100

	turns_per_move = 5
	stop_when_pulled = 0

	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "hits"

	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = list("attacked")
	attack_sound = 'sound/items/bikehorn.ogg'

	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 270
	maxbodytemp = 370
	heat_damage_per_tick = 15	//amount of damage applied if animal's body temperature is higher than maxbodytemp
	cold_damage_per_tick = 10	//same as heat_damage_per_tick, only if the bodytemperature it's lower than minbodytemp
	unsuitable_atoms_damage = 10

	speak_chance = 1
	speak = list("HONK", "Honk!", "Welcome to clown planet!")
	emote_see = list("honks")

//CHOMPEDIT: ALL RISE FOR CLOWN CARS, NEVER FEAR BOBO IS HERE
/mob/living/simple_animal/hostile/clown/glorious
	name = "клоун"
	desc = "Zhitel' slavnoy planety-klouna"
	tt_desc = "slav klouna"
	faction = "russian"
	cold_damage_per_tick = 0 //slav fear no cold
	attacktext = list("atakovan")
	var/matryoshka = 1

/mob/living/simple_animal/hostile/clown/glorious/lesser
	matryoshka = 0
	melee_damage_lower = 5
	melee_damage_upper = 5
	run_at_them = 1

/mob/living/simple_animal/hostile/clown/glorious/death()
	..()
	playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 10)
	if(matryoshka)
		visible_message("<span class='notice'>\The [src] opens up revealing another kloun!</span>")
		var/location = get_turf(src)
		new /mob/living/simple_animal/hostile/clown/glorious/lesser(location)

/mob/living/simple_animal/hostile/clown/cluwne
	icon = 'icons/mob/animal_VG.dmi'
	name = "cluwne"
	desc = "This poor creature used to be human.  Before it pissed off the Gods, that is.  Now it is miserable, and has bikehorns for an arm."
	icon_state = "cluwne"
	icon_living = "cluwne"
	icon_dead = "cluwne_dead"
	icon_gib = "clown_gib"
	speak_chance = 50
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speak = list("HONK", "Honk!")
	speak_emote = list("squeals", "cries","sobs")
	emote_hear = list("honks sadly")
	speak_chance = 1
	a_intent = I_HELP
	var/footstep=0 // For clownshoe noises
	//deny_client_move=1 // HONK // Doesn't work right yet

	stop_when_pulled = 1
	maxHealth = 30
	health = 30
	speed = 11

	harm_intent_damage = 1
	melee_damage_lower = 0
	melee_damage_upper = 0.1
	attacktext = "honks at"
	attack_sound = 'sound/items/bikehorn.ogg'

	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 270
	maxbodytemp = 370
	heat_damage_per_tick = 15	//amount of damage applied if animal's body temperature is higher than maxbodytemp
	cold_damage_per_tick = 10	//same as heat_damage_per_tick, only if the bodytemperature it's lower than minbodytemp
	unsuitable_atoms_damage = 10

/mob/living/simple_animal/hostile/clown/cluwne/goblin
	name = "clown goblin"
	desc = "A tiny walking mask and clown shoes. You want to honk his nose!"
	icon_state = "ClownGoblin"
	icon_living = "ClownGoblin"
	icon_dead = null
	response_help = "honks"
	speak = list("Honk!")
	speak_emote = list("sqeaks")
	emote_hear = list("honks")
	maxHealth = 100
	health = 100

	view_range = 30//owo

	speed = 1
	turns_per_move = 1

	//melee_damage_type = "BRAIN" //We dont have this for SA

//Braindamage
/mob/living/simple_animal/hostile/clown/cluwne/DoPunch(var/atom/A)
	. = ..()
	if(.) // If we succeeded in hitting.
		for(var/obj/machinery/light/light in range(5, src))
			light.flicker(10)
			playsound(light.loc, 'sound/items/bikehorn.ogg', 50, 10)
		if(isliving(A))
			var/mob/living/L = A
			L.adjustBrainLoss(rand(1,2))
			L.say("HONK!")
			playsound(L.loc, 'sound/items/bikehorn.ogg', 50, 10)

/mob/living/simple_animal/hostile/retaliate/cluwne/goblin/attackby(obj/item/weapon/W, mob/user)
	if(istype(W,/obj/item/weapon/pen)) //Renaming
		var/n_name = copytext(sanitize(input(user, "What would you like to name this clown goblin?", "Clown Goblin Name", null) as text|null), 1, MAX_NAME_LEN*3)
		if(n_name && Adjacent(user) && !user.stat)
			name = "[n_name]"
		return
	..()

/mob/living/simple_animal/clowngang
	name = "Pandoras box"
	desc = "A honkmotherload of fun"

/mob/living/simple_animal/clowngang/Life()
	death()
/mob/living/simple_animal/clowngang/death()
	..()
	new /mob/living/simple_animal/retaliate/synx/pet/clown(location)
	new /mob/living/simple_animal/hostile/clown(location)
	new /mob/living/simple_animal/hostile/clown(location)
	new /mob/living/simple_animal/hostile/clown(location)
	new /mob/living/simple_animal/hostile/clown/glorious(location)
	new /mob/living/simple_animal/hostile/clown/glorious(location)
	new /mob/living/simple_animal/hostile/clown/cluwne(location)
	new /mob/living/simple_animal/hostile/clown/cluwne/goblin(location)
	playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 10)
	qdel(src)
