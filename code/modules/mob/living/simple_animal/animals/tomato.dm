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
	anchored =1
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

//When I stop being lazy I'll give this its own file -Shark
//Chompeddit end
