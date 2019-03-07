/mob/living/simple_animal/alpha_chocobo
	name = "Alpha Roc"
	desc = "Thats a big roc... Question now if the small ones are just normal or chicks..."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "alpha_chocobo"
	icon_living = "alpha_chocobo"
	icon_dead = "alpha_chocobo_dead"

	faction = "chocobo"
	maxHealth = 350
	health = 350

	harm_intent_damage = 15
	melee_damage_lower = 20
	melee_damage_upper = 30
	attack_armor_pen = 25
	attacktext = list("bit")

	pixel_x = -16
	pixel_y = -16
	old_x = -16
	old_y = -16

	response_help = "rubs the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	speak_chance = 1
	speak = list("Wark!",
				"Chrp?",
				"Kweh!")
	emote_hear = list("squawks.","chirps.")
	emote_see = list("ruffles its feathers","steps in place")

// Activate Noms!
/mob/living/simple_animal/alpha_chocobo
	vore_active = 1
	vore_bump_chance = 25
	vore_bump_emote	= "chirps and pushes over"
	vore_pounce_chance = 100
	vore_default_mode = DM_HOLD
	vore_icons = SA_ICON_LIVING
	vore_capacity = 2

/mob/living/simple_animal/alpha_chocobo/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.name = "Stomach"
	B.desc = "With a quick gulp youre squeezed down into the large roc's spacious belly, though the stomach seems to be able to stretch a lot it still hugs you tightly in an almost possesive way and its owner lets out a satisfied squak."