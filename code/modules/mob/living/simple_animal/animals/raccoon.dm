//raccoon
/mob/living/simple_animal/raccoon
	name = "raccoon"
	desc = "A raccoon, also known as a trash panda."
	tt_desc = "E purgamentum raccoonus"
	intelligence_level = SA_ANIMAL
	icon = 'icons/mob/animal_vr.dmi'
	icon_state = "raccoon"
	item_state = "raccoon"
	icon_living = "raccoon"
	icon_dead = "raccoon_dead"

	investigates = 1
	specific_targets = 1 //Only targets with Found()
	run_at_them = 0 //DOMESTICATED
	view_range = 5

	turns_per_move = 5
	see_in_dark = 6

	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"

	min_oxy = 16 //Require atleast 16kPA oxygen
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius


	speak_chance = 1
	speak = list("HSSSSS")
	speak_emote = list("purrs")
	emote_see = list("shakes their head", "shivers","grooms self", "nibbles on some trash")
	say_maybe_target = list("Hss?")
	say_got_target = list("HSSSS!","REEER!")

	meat_amount = 1
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat

	var/turns_since_scan = 0
	var/mob/flee_target

/mob/living/simple_animal/raccoon/proc/handle_flee_target()
	//see if we should stop fleeing
	if (flee_target && !(flee_target in ListTargets(view_range)))
		flee_target = null
		GiveUpMoving()

	if (flee_target && !stat && !buckled)
		if (resting)
			lay_down()
		if(prob(25)) say("HSSSSS")
		stop_automated_movement = 1
		walk_away(src, flee_target, 7, 2)

/mob/living/simple_animal/raccoon/react_to_attack(var/atom/A)
	if(A == src) return
	flee_target = A
	turns_since_scan = 5

/mob/living/simple_animal/raccoon/ex_act()
	. = ..()
	react_to_attack(src.loc)