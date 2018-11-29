/mob/living/simple_animal/minimouse/enraged
	name = "minimouse"
	real_name = "minimouse"
	desc = "A small brown mouse, that looks incredibly musclar."
	tt_desc = "Mus muscular"
	icon_state = "mouse_brown"
	item_state = "mouse_brown"
	icon_living = "mouse_brown"
	icon_dead = "mouse_brown_dead"
	intelligence_level = SA_ANIMAL

	maxHealth = 1200
	health = 1200

	turns_per_move = 5
	see_in_dark = 7
	universal_understand = 1

	mob_size = 15 //carbons is 20 normally. Mice default to 1
	pass_flags = PASSTABLE
	can_pull_size = 5 //Normal is 100.
	can_pull_mobs = 3 //assuming mobs of this size or higher?
	layer = MOB_LAYER
	density = 0

	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stamps on"

	min_oxy = 1 //Minimouse doesn't need much air, but can't survive in space.
	minbodytemp = 0		//Stronk fur
	maxbodytemp = 700	//Stronk fur

	has_langs = list("Mouse")
	speak_chance = 1
	speak = list("Squeek!","SQUEEK!","Squeek?")
	speak_emote = list("squeeks","squeeks","squiks")
	emote_hear = list("squeeks","squeaks","squiks")
	emote_see = list("runs in a circle", "shakes", "scritches at something")

	retaliate = 1

	harm_intent_damage = 25
	melee_damage_lower = 30
	melee_damage_upper = 30
	vore_active = FALSE
	no_vore = 1