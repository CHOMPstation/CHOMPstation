/mob/living/simple_animal/chocobo
	name = "Roc"
	desc = "Some kind of large yellow avian, it seems pretty friendly even if it sometimes nibbles on people."
	icon = 'icons/mob/vore.dmi'
	icon_state = "chocobo"
	icon_living = "chocobo"
	icon_dead = "chocobo_dead"

	faction = "chocobo"
	maxHealth = 50
	health = 50

	response_help = "rubs the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	
	harm_intent_damage = 4
	melee_damage_lower = 5
	melee_damage_upper = 10
	attacktext = list("bit")
	
	speak_chance = 1
	speak = list("Wark!",
				"Chrp?",
				"Kweh!")
	emote_hear = list("squawks.","chirps.")
	emote_see = list("ruffles its feathers","steps in place")

// Activate Noms!
/mob/living/simple_animal/chocobo
	vore_active = 1
	vore_bump_chance = 10
	vore_bump_emote	= "chirps and bumps into"
	vore_pounce_chance = 25
	vore_default_mode = DM_HOLD
	vore_icons = SA_ICON_LIVING
	
/mob/living/simple_animal/chocobo/init_vore()	
	..()	
	var/obj/belly/B = vore_selected
	B.name = "Stomach"
	B.desc = "With a few gulps youre squeezed down into the roc's belly, the stomach hugs you tightly and its owner lets out a satisfied squak."

