/*
*	Here is where any supply packs
*	related to recreation live.
*/


/datum/supply_packs/recreation
	group = "Recreation"

/datum/supply_packs/randomised/recreation
	group = "Recreation"
	access = access_security

/datum/supply_packs/recreation/foam_weapons
	name = "Foam Weapon Crate"
	contains = list(
			/obj/item/weapon/material/sword/foam = 2,
			/obj/item/weapon/material/twohanded/baseballbat/foam = 2,
			/obj/item/weapon/material/twohanded/spear/foam = 2,
			/obj/item/weapon/material/twohanded/fireaxe/foam = 2
			)
	cost = 50
	containertype = /obj/structure/closet/crate
	containername = "foam weapon crate"

/datum/supply_packs/recreation/lasertag
	name = "Lasertag equipment"
	contains = list(
			/obj/item/weapon/gun/energy/lasertag/red,
			/obj/item/clothing/suit/redtag,
			/obj/item/weapon/gun/energy/lasertag/blue,
			/obj/item/clothing/suit/bluetag
			)
	containertype = /obj/structure/closet
	containername = "Lasertag Closet"
	cost = 10

/datum/supply_packs/recreation/artscrafts
	name = "Arts and Crafts supplies"
	contains = list(
			/obj/item/weapon/storage/fancy/crayons,
			/obj/item/weapon/storage/fancy/markers,
			/obj/item/device/camera,
			/obj/item/device/camera_film = 2,
			/obj/item/weapon/storage/photo_album,
			/obj/item/weapon/packageWrap,
			/obj/item/weapon/reagent_containers/glass/paint/red,
			/obj/item/weapon/reagent_containers/glass/paint/green,
			/obj/item/weapon/reagent_containers/glass/paint/blue,
			/obj/item/weapon/reagent_containers/glass/paint/yellow,
			/obj/item/weapon/reagent_containers/glass/paint/purple,
			/obj/item/weapon/reagent_containers/glass/paint/black,
			/obj/item/weapon/reagent_containers/glass/paint/white,
			/obj/item/weapon/contraband/poster,
			/obj/item/weapon/wrapping_paper = 3
			)
	cost = 10
	containertype = "/obj/structure/closet/crate"
	containername = "Arts and Crafts crate"

/datum/supply_packs/recreation/painters
	name = "Station Painting Supplies"
	cost = 10
	containername = "station painting supplies crate"
	containertype = /obj/structure/closet/crate
	contains = list(
			/obj/item/device/pipe_painter = 2,
			/obj/item/device/floor_painter = 2,
			/obj/item/device/closet_painter = 2
			)
//Chompstation add: adding a pack with 1 of each type of collar
/datum/supply_packs/recreation/collars
	name = "Collar bundle"
	contains = list(
			/obj/item/clothing/accessory/collar/shock = 1,
			/obj/item/clothing/accessory/collar/spike = 1,
			/obj/item/clothing/accessory/collar/silver = 1,
			/obj/item/clothing/accessory/collar/gold = 1,
			/obj/item/clothing/accessory/collar/bell = 1,
			/obj/item/clothing/accessory/collar/pink = 1,
			/obj/item/clothing/accessory/collar/holo = 1
			)
	cost = 25
	containertype = /obj/structure/closet/crate
	containername = "collar crate"
