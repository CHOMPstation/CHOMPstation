/mob/living/simple_animal/hostile/wolf
	name = "grey wolf"
	desc = "My, what big jaws it has!"
	tt_desc = "Canis lupus"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "wolf-dead"
	icon_living = "wolf"
	icon_state = "wolf"

	speed = 5

	run_at_them = 0
	cooperative = 1
	investigates = 1
	returns_home = 1
	reacts = 1

	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 25

	minbodytemp = 200

// Activate Noms!
/mob/living/simple_animal/hostile/wolf
	vore_active = 1
	vore_ignores_undigestable = 0
	vore_icons = SA_ICON_LIVING

//CHOMPStation Addition Start TFF 26/10/19 - passive wolf addition - Amaterasu, nerf damage, increased size. Copy-pasted code from rat.dm
/mob/living/simple_animal/hostile/wolf/passive
	follow_dist = 1
	var/mob/living/carbon/human/food
	var/hunger = 0
	var/life_since_foodscan = 0

/mob/living/simple_animal/hostile/wolf/passive/Life()
	. = ..()
	if(!. || ai_inactive)
		return

	if(hunger > 0 && life_since_foodscan++ > 5) //Only look for floor food when hungry.
		life_since_foodscan = 0
		for(var/obj/item/weapon/reagent_containers/food/snacks/S in oview(src,3)) //Accept thrown offerings and scavenge surroundings.
			if(get_dist(src,S) <=1)
				visible_emote("hungrily devours \the [S].")
				playsound(src.loc,'sound/items/eatfood.ogg', rand(10,50), 1)
				qdel(S)
				hunger = 0
				food = null
			else
				WanderTowards(S.loc)
			break

	if(!food)
		return

	var/food_dist = get_dist(src,food)

	if(food_dist > world.view) //Lose interest on this person.
		food = null
		hunger = Clamp(hunger+5, 0, 25)

	if(food_dist > 1)
		if(stance == STANCE_IDLE)
			if(set_follow(food,10 SECONDS))
				handle_stance(STANCE_FOLLOW)
				if(resting)
					lay_down()

	if(food_dist <= 1)
		if(hunger < 15)
			if(prob(25))
				visible_emote(pick("sniffs curiously at [food].",
								   "stares at [food], seeming to want something.",
								   "sniffs at [food]'s hands.",
								   "sniffs curiously at [food]'s pockets.",
								   "sits down for a moment, reaching towards [food] with its paws."))
				hunger += 5
		else if(hunger < 30)
			if(prob(25))
				visible_emote(pick("sniffs intently against [food], especially their pockets and gear.",
								   "stands up to beg [food] for snacks.",
								   "attempts to burrow into [food]'s pockets.",
								   "leans against [food], licking its chops.",
								   "hungrily nibbles onto [food]."))
				hunger += 5
		else if(hunger < 45)
			if(prob(25))
				visible_emote(pick("growls at [food], sounding rather hangry!",
								   "aggressively bumps and nudges against [food], trying to make something fall out.",
								   "salivates at [food] in an unsettling manner.",
								   "pushes hard against [food], licking its chops.",
								   "almost sinks its teeth into [food], just stopping to give them another chance."))
				hunger += 5
		else if(hunger < 50)
			visible_emote("appears to have had enough and prepares to strike!")
		else
			food.Weaken(5)
			food.visible_message("<span class='danger'>\the [src] pounces on \the [food]!</span>!")
			target_mob = food
			EatTarget()
			hunger = 0
			food = null

/mob/living/simple_animal/hostile/wolf/passive/attackby(var/obj/item/O, var/mob/user) // Feed the rat your food to satisfy it.
	if(istype(O, /obj/item/weapon/reagent_containers/food/snacks))
		qdel(O)
		playsound(src.loc,'sound/items/eatfood.ogg', rand(10,50), 1)
		hunger = 0
		food = null
		return
	. = ..()
	//TFF - Time to let Ammy react to newspapers. Yayyyyyyy!
	if(istype(O, /obj/item/weapon/newspaper))
		if (retaliate && prob(vore_pounce_chance/2)) // This is a gamble!
			user.Weaken(5) //They get tackled anyway whether they're edible or not.
			user.visible_message("<span class='danger'>\the [user] swats \the [src] with \the [O] and promptly gets tackled!</span>!")
			if (will_eat(user))
				stop_automated_movement = 1
				animal_nom(user)
				update_icon()
				stop_automated_movement = 0
			else if (!target_mob) // no using this to clear a retaliate mob's target
				target_mob = user //just because you're not tasty doesn't mean you get off the hook. A swat for a swat.
				AttackTarget()
				LoseTarget() // only make one attempt at an attack rather than going into full rage mode
		else
			user.visible_message("<span class='info'>\the [user] swats \the [src] with \the [O]!</span>!")
			release_vore_contents()
			for(var/mob/living/L in living_mobs(0)) //add everyone on the tile to the do-not-eat list for a while
				if(!(L in prey_excludes)) // Unless they're already on it, just to avoid fuckery.
					prey_excludes += L
					spawn(3600)
						if(src && L)
							prey_excludes -= L
		..()

/mob/living/simple_animal/hostile/wolf/passive/Found(var/atom/found_atom)
	if(!SA_attackable(found_atom))
		return null
	else if(ishuman(found_atom) && will_eat(found_atom))
		var/mob/living/carbon/human/H = found_atom
		for(var/obj/item/weapon/reagent_containers/food/snacks/S in H)
			if(!food)
				visible_emote("sniffs around the air intently, seeming to have caught a whiff of food!")
			if(resting)
				lay_down()
			food = H
			return found_atom
			break
	return null

/mob/living/simple_animal/hostile/wolf/passive/FindTarget()
	var/atom/T = null
	for(var/atom/A in ListTargets(view_range))
		if(A == src)
			continue
		var/atom/F = Found(A)
		if(F)
			T = F
			break
	return T

/mob/living/simple_animal/hostile/wolf/passive/Amaterasu
	name = "Amaterasu"
	desc = "It's a very large canine wearing a collar inscribed with 'Amaterasu' on the tag."

//Nerf the damage, increase the size

	size_multiplier = 1.5
	harm_intent_damage = 5
	melee_damage_lower = 2.5
	melee_damage_upper = 5

	//Allow survival in vacuum. You're a goddess, technically.
	max_co2 = 0
	min_co2 = 0
	max_n2 = 0
	min_n2 = 0
	max_oxy = 0
	min_oxy = 0
	max_tox = 0
	min_tox = 0
	minbodytemp = 0
	maxbodytemp = 350
	health = 50
	maxHealth = 50
//CHOMPStation Addition End
