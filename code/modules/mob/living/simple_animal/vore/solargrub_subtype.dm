//What belongs here? all non grubs that reuse grub code, Let's start off with grub like SMES mimics

/mob/living/simple_animal/retaliate/solargrub/smes
	name = "juvenile SMESgrub"
	desc = "A young sparkling SMESgrub"
	icon = 'icons/obj/power.dmi'
	icon_state = "smes"
	icon_living = "smes"
	icon_dead = "smes"

/mob/living/simple_animal/retaliate/solargrub/smes/big
	name = "Greater SMESgrub"
	desc = "A big sparkling SMESgrub"
	icon = 'icons/obj/power.dmi'
	icon_state = "smes"
	icon_living = "smes"
	icon_dead = "smes"

/mob/living/simple_animal/retaliate/solargrub/smes/big/New()
	expand_size(2)

/mob/living/simple_animal/retaliate/solargrub/smes/proc/expand_size(var/size=null)
	size_multiplier = size
	update_icons()

/mob/living/simple_animal/retaliate/solargrub/smes/death()
	..()
	new /obj/machinery/power/smes(location)
	qdel(src)
