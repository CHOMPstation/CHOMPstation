/*
 * Code designed for a specific halloween event for Kona. Janky code, shouldn't be used unless specifically for events.
 */


/mob/living/carbon/proc/ToggleGhostMode()
	set name = "Ghost Invisiblity"
	set desc = "Prototype."
	set category = "Abilities"

	if(stat == DEAD || paralysis || weakened || stunned || restrained())
		return

	if(status_flags & HIDING)
		status_flags &= ~HIDING
		alpha = 0
		to_chat(src,"<span class='notice'>You are now a spook.</span>")
	else
		status_flags |= HIDING
		alpha = 120
		to_chat(src,"<span class='notice'>You are not a spook.</span>")


/mob/living/carbon/proc/HealUp()
	set name = "Heal'up"
	set desc = "Prototype."
	set category = "Abilities"

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		for(var/obj/item/organ/affecting in H.organs)
			if(affecting && istype(affecting))
				affecting.rejuvenate() //ha, scuffed, oh well.
		H.adjustBrainLoss(-200)
		H.radiation = 0
		H.bodytemperature = initial(H.bodytemperature)
	//
	adjustOxyLoss(-200)
	adjustToxLoss(-200)
	adjustBruteLoss(-200)
	adjustFireLoss(-200)
	//
	return 1