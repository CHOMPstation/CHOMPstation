/obj/item/weapon/robot_module/robot/servore
	name = "vore services module"
	can_buckle = 1
	sprites = list(
					"Service BootyBot" = "servoregreen",
					"BoootyBlue" = "servore"
					)
	channels = list("Service" = 1)
	can_be_pushed = 0

	languages = list(
					LANGUAGE_SOL_COMMON	= 1,
					LANGUAGE_UNATHI		= 1,
					LANGUAGE_SIIK		= 1,
					LANGUAGE_AKHANI		= 1,
					LANGUAGE_SKRELLIAN	= 1,
					LANGUAGE_SKRELLIANFAR = 0,
					LANGUAGE_ROOTLOCAL	= 0,
					LANGUAGE_TRADEBAND	= 1,
					LANGUAGE_GUTTER		= 0,
					LANGUAGE_SCHECHI	= 1,
					LANGUAGE_EAL		= 1,
					LANGUAGE_TERMINUS	= 1,
					LANGUAGE_SIGN		= 0
					)

/obj/item/weapon/robot_module/robot/servore/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/gripper/service(src)
	src.modules += new /obj/item/weapon/reagent_containers/glass/bucket(src)
	src.modules += new /obj/item/weapon/material/minihoe(src)
	src.modules += new /obj/item/weapon/material/knife/machete/hatchet(src)
	src.modules += new /obj/item/device/analyzer/plant_analyzer(src)
	src.modules += new /obj/item/weapon/storage/bag/plants(src)
	src.modules += new /obj/item/weapon/robot_harvester(src)
	src.modules += new /obj/item/weapon/material/knife(src)
	src.modules += new /obj/item/weapon/material/kitchen/rollingpin(src)
	src.modules += new /obj/item/device/multitool(src) //to freeze trays
	src.modules += new /obj/item/device/dogborg/sleeper/general(src)
	src.modules += new /obj/item/weapon/service_fab(src)

	//var/obj/item/weapon/rsf/M = new /obj/item/weapon/rsf(src)
	//M.stored_matter = 30
	//src.modules += M

	src.modules += new /obj/item/weapon/reagent_containers/dropper/industrial(src)

	var/obj/item/weapon/flame/lighter/zippo/L = new /obj/item/weapon/flame/lighter/zippo(src)
	L.lit = 1
	src.modules += L

	src.modules += new /obj/item/weapon/tray/robotray(src)
	src.modules += new /obj/item/weapon/reagent_containers/borghypo/service(src)
	src.emag = new /obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer(src)

	var/datum/reagents/N = new/datum/reagents(50)
	src.emag.reagents = N
	N.my_atom = src.emag
	N.add_reagent("beer2", 50)
	src.emag.name = "Mickey Finn's Special Brew"

	R.icon 		 = 'icons/mob/robots_ch.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	R.ui_style_vr = TRUE
//	R.pixel_x 	 = -16
//	R.old_x 	 = -16
//	R.default_pixel_x = -16
	R.dogborg = TRUE
	R.wideborg = TRUE
	R.resticon = FALSE
	R.verbs |= /mob/living/silicon/robot/proc/ex_reserve_refill
	..()

/obj/item/weapon/robot_module/robot/medical/vore
	name = "crisis robot vore module"
	sprites = list(
					"Medical BootyBot" = "medvore"
					)

/obj/item/weapon/robot_module/robot/medical/vore/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/device/healthanalyzer(src)
	src.modules += new /obj/item/device/reagent_scanner/adv(src)
	src.modules += new /obj/item/roller_holder(src)
	src.modules += new /obj/item/weapon/reagent_containers/borghypo/crisis(src)
	src.modules += new /obj/item/weapon/reagent_containers/glass/beaker/large(src)
	src.modules += new /obj/item/weapon/reagent_containers/dropper/industrial(src)
	src.modules += new /obj/item/weapon/reagent_containers/syringe(src)
	src.modules += new /obj/item/weapon/gripper/no_use/organ(src)
	src.modules += new /obj/item/weapon/gripper/medical(src)
	src.modules += new /obj/item/weapon/shockpaddles/robot(src)
	src.modules += new /obj/item/device/dogborg/sleeper/medical(src)
	src.emag = new /obj/item/weapon/reagent_containers/spray(src)
	src.emag.reagents.add_reagent("pacid", 250)
	src.emag.name = "Polyacid spray"

	var/datum/matter_synth/medicine = new /datum/matter_synth/medicine(15000)
	synths += medicine

	var/obj/item/stack/medical/advanced/ointment/O = new /obj/item/stack/medical/advanced/ointment(src)
	var/obj/item/stack/medical/advanced/bruise_pack/B = new /obj/item/stack/medical/advanced/bruise_pack(src)
	var/obj/item/stack/medical/splint/S = new /obj/item/stack/medical/splint(src)
	O.uses_charge = 1
	O.charge_costs = list(1000)
	O.synths = list(medicine)
	B.uses_charge = 1
	B.charge_costs = list(1000)
	B.synths = list(medicine)
	S.uses_charge = 1
	S.charge_costs = list(1000)
	S.synths = list(medicine)
	src.modules += O
	src.modules += B
	src.modules += S

	R.icon 		 = 'icons/mob/robots_ch.dmi'
	R.hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	R.ui_style_vr = TRUE
//	R.pixel_x 	 = -16
//	R.old_x 	 = -16
//	R.default_pixel_x = -16
	R.dogborg = TRUE
	R.wideborg = TRUE
	R.resticon = FALSE
	R.verbs |= /mob/living/silicon/robot/proc/ex_reserve_refill
	..()

/obj/item/weapon/robot_module/robot/medical/vore/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)

	var/obj/item/weapon/reagent_containers/syringe/S = locate() in src.modules
	if(S.mode == 2)
		S.reagents.clear_reagents()
		S.mode = initial(S.mode)
		S.desc = initial(S.desc)
		S.update_icon()

	if(src.emag)
		var/obj/item/weapon/reagent_containers/spray/PS = src.emag
		PS.reagents.add_reagent("pacid", 2 * amount)

	..()

