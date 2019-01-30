/datum/gear/eyes/arglasses/visor
	display_name = "AR visor"
	path = /obj/item/clothing/glasses/omnihud/visor
	cost = 0


/datum/gear/eyes/arglasses/visor/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)