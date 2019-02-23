/mob/living/simple_animal/hostile/lizardman //CHOMPERS addition, an aggressive angry lizardman.
	name = "lizardman"
	desc = "That is one buff, angry lizard."
	tt_desc = "E Anolis cuvieri muscular"
	icon = 'icons/mob/vore32x64.dmi'
	icon_state = "lizardman"
	icon_living = "lizardman"
	icon_dead = "lizardman-dead"
	faction = "lizard"

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
	response_help = "pets the"
	response_disarm = "bops the"
	response_harm = "hits the"
	attacktext = list("bit")
	friendly = list("nuzzles", "licks", "noses softly at", "noseboops", "headbumps against", "leans on", "nibbles affectionately on")


	vore_active = TRUE
	vore_capacity = 1
	vore_pounce_chance = 1
	vore_icons = SA_ICON_LIVING