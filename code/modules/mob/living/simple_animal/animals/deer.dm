/mob/living/simple_animal/deer
	name = "deer"
	desc = "An animal with impressive antlers and skittish personality, though this one seems domesticated."
	tt_desc = "Cervus elaphus"
	icon_state = "Deer"
	icon_living = "Deer"
	icon_dead = "Deer_dead"
	icon_gib = "generic_gib"
	intelligence_level = SA_ANIMAL

	specific_targets = 1 //Only targets with Found()

	view_range = 5
	health = 50
	turns_per_move = 5
	see_in_dark = 6

	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "gores"
	attacktext = list("gored")

	speak_chance = 1
	speak = list("meer?","meer","MEEEEER")
	speak_emote = list("bellows","bellows loudly")
	emote_hear = list("bellows")
	emote_see = list("wiggles its tail")

	meat_amount = 3
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat

	var/turns_since_scan = 0
	var/mob/flee_target

/mob/living/simple_animal/deer/New()

	if(prob(1))
		name = "Kyle"
		desc = "A deer with no antlers and a very skittish personality, it seems to be a male even though its a doe."
		tt_desc = "Cervus flailicus"
		icon_state = "Kyle"
		icon_living = "Kyle"
		icon_dead = "Kyle_dead"
		icon_gib = "generic_gib"
		intelligence_level = SA_ANIMAL

		health = 100
		turns_per_move = 1
		see_in_dark = 6

		response_help  = "pets"
		response_disarm = "barely manage to push aside"
		response_harm   = "hits"
		attacktext = list("nibbled")

		speak_chance = 20
		speak = list("wh-?","wh-!","WH-?!","aaaaa","HELP MAINTS","SPOHGJPDFHDFH!","EEP","!!!!!","gposdjafgpmgd","y e e t")
		speak_emote = list("Bleats","Bleats loudly","Wh-s","Flails","Flails a lot")
		emote_hear = list("Bleats", "Bleats loudly","Wh-s")
		emote_see = list("wiggles his tail","Flails around","Flails","Runs around in a circle")
	..()
/mob/living/simple_animal/deer/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.name = "Stomach"
	B.desc = "Your curled up inside Kyle's belly, and he doesnt seem very quite eager about the idea judging from all the bleating..."

	B.emote_lists[DM_HOLD] = list(
		"The tight belly rubs your body as the panicking deer runs around.",
		"You hear the sounds of his stomach squishing your form and his heart thundering away nearby.",
		"Kyle doesnt seem to know where to go. The constant turning around in place is pressing you against the walls, its a miracle your not getting dizzy.",
		"All the moving about is making you a little sleepy, its like a tight and warm hammock that you constantly swing back and forth in thanks to your unwilling predator.",
		"Kyle tries again to cough you up and fails, one has to wonder if you will ever get out.")

	B.emote_lists[DM_DIGEST] = list(
		"His herbivore belly isnt suited for a meal like you, but he moves so much that fresh stomach juices are always kneaded into your form to break you down.",
		"While the distressed deer is trying to get his unwelcome guest out of his stomach, his stomach is busy claiming its food by tightening around you to grind you into mush.",
		"Its hard to see inside the dark and damp belly, but the sound of sloshing liquids grows louder by every minute, and the same goes for the ominous gurgling noises.",
		"Everytime Kyle stops to bleat nervously his belly tightens around you, forcing you to curl up tighter than before. Will you get out before its to late, get digested first, or even crushed into a paste?",
		"The deer tries his best to regurgitate you, but all it does is excite his stomach even more and fill up the organ with more liquids to churn you up with.")

// All them complicated deer procedures.
/mob/living/simple_animal/deer/Life()
	. = ..()
	if(!.) return

	handle_flee_target()

/mob/living/simple_animal/deer/proc/handle_flee_target()
	//see if we should stop fleeing
	if (flee_target && !(flee_target in ListTargets(view_range)))
		flee_target = null
		GiveUpMoving()

	if (flee_target && !stat && !buckled)
		if (resting)
			lay_down()
		if(prob(25)) say("!Bleats!")
		stop_automated_movement = 1
		walk_away(src, flee_target, 7, 2)

/mob/living/simple_animal/deer/react_to_attack(var/atom/A)
	if(A == src) return
	flee_target = A
	turns_since_scan = 5

/mob/living/simple_animal/deer/ex_act()
	. = ..()
	react_to_attack(src.loc)
