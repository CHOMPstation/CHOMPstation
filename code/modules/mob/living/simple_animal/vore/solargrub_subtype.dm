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

/obj/machinery/power/smes/buildable/outpost_substation/grub/New()
	..(0)
	component_parts += new /obj/item/weapon/smes_coil/weak(src)
	RCon_tag = "Unidentified_Power_Storage"
	recalc_coils()
	charge = 600000 //Let's do this after recalc to avoid overload issues

/mob/living/simple_animal/retaliate/solargrub/smes/death()
	..()
	/*var/obj/machinery/power/drop = */new /obj/machinery/power/smes/buildable/outpost_substation/grub(location)
	//drop.charge = charge //Solargrubs dont fucking keep track of charge wtf
	qdel(src)
