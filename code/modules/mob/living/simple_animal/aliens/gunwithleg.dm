//LEgs with guns
#define LASERS_TO_KILL *30 //how many default lasers are needed to kill them.

//EVIL GUN
/mob/living/simple_animal/hostile/legun
	name = "Legged gun"
	desc = "A true weapon."
	icon = 'icons/mob/hivebot.dmi'
	icon_state = "basic"
	icon_living = "basic"
	icon_dead = "basic"
	
	faction = "gun"
	intelligence_level = SA_ROBOTIC
	maxHealth = 1 LASERS_TO_KILL
	health = 1 LASERS_TO_KILL
	speed = 7
	
	ranged = 1

	melee_damage_lower = 15
	melee_damage_upper = 15

	attacktext = list("bludgeoned")
	projectilesound = 'sound/weapons/Gunshot.ogg'
	projectiletype = /obj/item/projectile/bullet/hivebot

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	cooperative = TRUE
	firing_lines = TRUE
	investigates = TRUE
	run_at_them = FALSE //VOREStation Edit

	speak_chance = 1
	speak = list(
		"Resuming task: Protect area.",
		"No threats found.",
		"Error: No targets found."
		)
	emote_hear = list("hums ominously", "whirrs softly", "grinds a gear")
	emote_see = list("looks around the area", "turns from side to side")
	say_understood = list("Affirmative.", "Positive.")
	say_cannot = list("Denied.", "Negative.")
	say_maybe_target = list("Possible threat detected.  Investigating.", "Motion detected.", "Investigating.")
	say_got_target = list("Threat detected.", "New task: Remove threat.", "Threat removal engaged.", "Engaging target.")
	
//GOODBOY GUN
/mob/living/simple_animal/hostile/legun_goodboy
	name = "Legged gun"
	desc = "A true weapon."
	icon = 'icons/mob/hivebot.dmi'
	icon_state = "basic"
	icon_living = "basic"
	icon_dead = "basic"
	
	faction = "Station"
	intelligence_level = SA_ROBOTIC
	maxHealth = 1 LASERS_TO_KILL
	health = 1 LASERS_TO_KILL
	speed = 7
	
	ranged = 1

	melee_damage_lower = 15
	melee_damage_upper = 15

	attacktext = list("bludgeoned")
	projectilesound = 'sound/weapons/Gunshot.ogg'
	projectiletype = /obj/item/projectile/bullet/hivebot

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	cooperative = TRUE
	firing_lines = TRUE
	investigates = TRUE
	run_at_them = FALSE //VOREStation Edit

	speak_chance = 1
	speak = list(
		"Resuming task: Protect area.",
		"No threats found.",
		"Error: No targets found."
		)
	emote_hear = list("hums ominously", "whirrs softly", "grinds a gear")
	emote_see = list("looks around the area", "turns from side to side")
	say_understood = list("Affirmative.", "Positive.")
	say_cannot = list("Denied.", "Negative.")
	say_maybe_target = list("Possible threat detected.  Investigating.", "Motion detected.", "Investigating.")
	say_got_target = list("Threat detected.", "New task: Remove threat.", "Threat removal engaged.", "Engaging target.")
