/mob/living/simple_animal/lizard
	name = "lizard"
	desc = "A cute tiny lizard."
	faction = "lizard"
	tt_desc = "E Anolis cuvieri"
	icon = 'icons/mob/critter.dmi'
	icon_state = "lizard"
	icon_living = "lizard"
	icon_dead = "lizard-dead"
	intelligence_level = SA_ANIMAL

	health = 5
	maxHealth = 5
	mob_size = 1

	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "stomps on"

	attacktext = list("bitten")
	melee_damage_lower = 1
	melee_damage_upper = 2

	speak_chance = 1
	speak_emote = list("hisses")
	var/amount_grown = 0



/mob/living/simple_animal/lizard/event
	desc = "This one looks like it is growing huge!"

/mob/living/simple_animal/lizard/event/Life()
	. = ..()
	if(amount_grown >= 0)
		amount_grown += rand(0,2)
	if(amount_grown >= 100 && icon_state != icon_dead)
		lizardman()
		return

/mob/living/simple_animal/lizard/event/proc/lizardman()
	visible_message("<span class='warning'>\The [src] suddenly evolves!</span>")
	if(prob(99.999))
		new /mob/living/simple_animal/hostile/lizardman(get_turf(src))
		qdel(src)
	else
		new /mob/living/simple_animal/hostile/deathclaw(get_turf(src))
		qdel(src)

