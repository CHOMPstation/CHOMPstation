/obj/item/weapon/cell/high/hightech
	name = "Self-charging power cell"
	origin_tech = list(TECH_POWER = 7)
	icon_state = "hcell"
	maxcharge = 2000//Trade in charge for recharge
	matter = list(DEFAULT_WALL_MATERIAL = 1000, "glass" = 100)
	description_info = "This 'cell' holds a max charge of 2k and self recharges over time."
	self_recharge = TRUE

/obj/item/weapon/cell/high/hightech/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/device/weapon/hightech
	name = "Self-charging weapon power cell"
	icon_state = "wcell"
	maxcharge = 1000
	charge_amount = 20
	desc = "This 'cell' holds a max charge of 1k and self recharges over time. It is specialized for weaponary although a bit too msall for some weapons"
	self_recharge = TRUE
	origin_tech = list(TECH_POWER = 7, TECH_MATERIAL = 6,TECH_BLUESPACE = 6,TECH_COMBAT = 1)

/obj/item/weapon/cell/device/weapon/hightech/empty/initialize()
	. = ..()
	charge = 0
	update_icon()
	
//////DESIGN SECTION TO BE MOVED TO DESIGNS//////////////

/datum/design/item/powercell/high/hightech
	name = "Self-charging weapon cell"
	id = "selfch_cell_weapon"
	req_tech = list(TECH_POWER = 5, TECH_MATERIAL = 5,TECH_BLUESPACE = 5,TECH_COMBAT = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 2000,"glass" = 500, "silver" = 500)
	build_path = /obj/item/weapon/cell/device/weapon/hightech
	category = "Misc"
	sort_string = "DAAAF" //Unique Letter String, this decides how the list of printable items is arranged
