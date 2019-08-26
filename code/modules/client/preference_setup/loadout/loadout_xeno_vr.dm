//CHOMPEDIT; SYNTH FACEMASK
/datum/gear/mask/synthface/
	display_name = "Synth Facemask(Tesh)"
	path = /obj/item/clothing/mask/synthfacemask
	sort_category = "Xenowear"
	whitelisted = SPECIES_TESHARI
	cost = 1
//CHOMPEDIT; END

/datum/gear/mask/synthface/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)

/datum/gear/uniform/voxcasual
	display_name = "casual wear (Vox)"
	path = /obj/item/clothing/under/vox/vox_casual
	sort_category = "Xenowear"
	whitelisted = "Vox"

/datum/gear/uniform/voxrobes
	display_name = "comfy robes (Vox)"
	path = /obj/item/clothing/under/vox/vox_robes
	sort_category = "Xenowear"
	whitelisted = "Vox"

/datum/gear/accessory/vox
	display_name = "storage vest (Vox)"
	path = /obj/item/clothing/accessory/storage/vox
	sort_category = "Xenowear"
	whitelisted = "Vox"

/datum/gear/gloves/vox
	display_name = "insulated gauntlets (Vox)"
	path = /obj/item/clothing/gloves/vox
	sort_category = "Xenowear"
	whitelisted = "Vox"

/datum/gear/shoes/vox
	display_name = "magclaws (Vox)"
	path = /obj/item/clothing/shoes/magboots/vox
	sort_category = "Xenowear"
	whitelisted = "Vox"

/datum/gear/mask/vox
	display_name = "alien mask (Vox)"
	path = /obj/item/clothing/mask/gas/swat/vox
	sort_category = "Xenowear"
	whitelisted = "Vox"

/datum/gear/uniform/loincloth
	display_name = "loincloth"
	path = /obj/item/clothing/suit/storage/fluff/loincloth
	sort_category = "Xenowear"
