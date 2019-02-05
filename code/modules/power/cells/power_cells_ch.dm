/obj/item/weapon/cell/high/hightech
	name = "Self-charging power cell"
	origin_tech = list(TECH_POWER = 7)
	icon_state = "hcell"
	maxcharge = 2000//Trade in charge for recharge
	matter = list(DEFAULT_WALL_MATERIAL = 1000, "glass" = 100)
	description_info = "This 'cell' holds a max charge of 1k and self recharges over time."

/obj/item/weapon/cell/high/hightech/empty/New()
	..()
	charge = 0
