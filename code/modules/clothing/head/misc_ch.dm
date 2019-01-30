/obj/item/clothing/head/wiggler
	icon_override = 'icons/vore/misc_ch.dmi'
	icon = 'icons/vore/misc_ch.dmi'//lets use our own DMI with blackjack and deers
	icon_state = "flailing_helmet"
	item_state = "flailing_helmet_worn"
	name = "Flailing hat"
	desc = "It's a hat, it flails."
	body_parts_covered = 0

/obj/item/clothing/head/wiggler/make_worn_icon(var/body_type,var/slot_name,var/inhands,var/default_icon,var/default_layer)
	var/image/so_far = ..()
	so_far.pixel_y += 16
	so_far.pixel_x += 0
	return so_far