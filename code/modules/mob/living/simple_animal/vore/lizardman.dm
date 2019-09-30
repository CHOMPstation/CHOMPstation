/mob/living/simple_animal/hostile/lizardman //CHOMPERS addition, an aggressive angry lizardman.
	name = "lizardman"
	desc = "That is one buff, angry lizard."
	tt_desc = "E Anolis cuvieri muscular"
	icon = 'icons/mob/vore32x64.dmi'
	icon_state = "lizardman"
	icon_living = "lizardman"
	icon_dead = "lizardman-dead"
	faction = "lizard"
	isEdible = 0

	maxHealth = 50
	health = 50
	speed = 4

	investigates = TRUE
	melee_damage_lower = 5
	melee_damage_upper = 15
	grab_resist = 100
	attack_sound = 'sound/weapons/bite.ogg'

	speak_chance = 4
	speak = list("Gwar!","Rawr!","Hiss.")
	speak_emote = list("growls","hisses")
	say_maybe_target = list("Rawr?")
	say_got_target = list("GWAR!!")
	response_help = "pets"
	response_disarm = "bops"
	response_harm = "hits"
	attacktext = list("bit")
	friendly = list("nuzzles", "licks", "noses softly at", "noseboops", "headbumps against", "leans on", "nibbles affectionately on")

	//Variables for when people play as the lizardmen.
	show_stat_health = 1	// Does the percentage health show in the stat panel for the mob
	ai_inactive = 0 	// Set to 1 to turn off most AI actions
	has_hands = 1		// Set to 1 to enable the use of hands and the hands hud
	humanoid_hands = 1	// Can a player in this mob use things like guns or AI cards?

	vore_active = TRUE
	vore_capacity = 1
	vore_pounce_chance = 1
	vore_icons = SA_ICON_LIVING
