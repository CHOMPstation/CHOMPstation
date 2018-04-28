/**
 *  A vending machine
 */
/obj/machinery/vending_mining
	name = "Mining Redemption Machine"
	desc = "A place for you to spend your hard earned lucre"
	icon = 'icons/obj/vending_vr.dmi' //VOREStation Edit - Eris vending machine sprites
	icon_state = "engivend"
	layer = 2.9
	anchored = 1
	density = 1

	var/icon_vend //Icon_state when vending
	var/icon_deny = "engivend-deny" //Icon_state when denying access

	// Power
	use_power = 1
	idle_power_usage = 10
	var/vend_power_usage = 150 //actuators and stuff

	// Vending-related
	var/points = 0 //number of supply points
	var/active = 1 //No sales pitches if off!
	var/vend_ready = 1 //Are we ready to vend?? Is it time??
	var/vend_delay = 10 //How long does it take to vend?
	var/status_message = "" // Status screen messages like "insufficient funds", displayed in NanoUI

	/*
		Variables used to initialize the product list
		These are used for initialization only, and so are optional if
		product_records is specified
	*/
	var/list/products	= list(
	/obj/item/stack/marker_beacon/thirty = 10,
	/obj/item/weapon/storage/fancy/cigar = 5,
	/obj/item/weapon/rig/industrial = 5,
	/obj/item/clothing/accessory/storage/brown_vest = 5,
	/obj/item/toy/plushie/face_hugger = 3,
	/obj/item/weapon/storage/firstaid/regular = 5,
	///obj/item/weapon/reagent_containers/hypospray/autoinjector/beltminer = 5,
	/obj/machinery/mining/drill = 5,
	/obj/machinery/mining/brace = 16,
	/obj/mecha/working/ripley/mining = 3,
	/obj/mecha/working/ripley/deathripley = 1,
	/obj/item/weapon/pickaxe/drill = 5,
	/obj/item/weapon/pickaxe/jackhammer = 5,
	/obj/item/weapon/pickaxe/plasmacutter = 5,
	/obj/item/device/gps/mining = 5,
	/obj/item/rig_module/device/drill = 3,
	)

	// For each, use the following pattern:
	// list(/type/path = amount,/type/path2 = amount2)
	// Prices for each item, list(/type/path = price), items not in the list don't have a price.
	var/list/prices     = list(
	/obj/item/weapon/storage/fancy/cigar = 1,
	/obj/item/weapon/rig/industrial = 40,
	/obj/item/clothing/accessory/storage/brown_vest = 4,
	/obj/item/toy/plushie/face_hugger = 4,
	/obj/item/weapon/storage/firstaid/regular = 8,
	///obj/item/weapon/reagent_containers/hypospray/autoinjector/beltminer = 12,
	/obj/machinery/mining/drill = 4,
	/obj/machinery/mining/brace = 4,
	/obj/mecha/working/ripley/mining = 60,
	/obj/mecha/working/ripley/deathripley = 200,
	/obj/item/weapon/pickaxe/drill = 15,
	/obj/item/weapon/pickaxe/jackhammer = 25,
	/obj/item/weapon/pickaxe/plasmacutter = 42,
	/obj/item/device/gps/mining = 8,
	/obj/item/rig_module/device/drill = 12,
	)

	var/list/coins	= list(
	/obj/item/weapon/coin/iron,
	/obj/item/weapon/coin/gold,
	/obj/item/weapon/coin/silver,
	/obj/item/weapon/coin/phoron,
	/obj/item/weapon/coin/uranium,
	/obj/item/weapon/coin/platinum,
	//does not accept diamond
	)

	// List of vending_product items available.
	var/list/product_records = list()

/obj/machinery/vending_mining/New()
	..()
	spawn(4)

		build_inventory()
		power_change()

		return
	return

/**
 *  Build produdct_records from the products lists
 *
 *  products, contraband, and prices allow specifying
 *  products that the vending machine is to carry without manually populating
 *  product_records.
 */
/obj/machinery/vending_mining/proc/build_inventory()
	var/list/all_products = list(
		list(products, CAT_NORMAL))

	for(var/current_list in all_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/stored_item/vending_product/product = new/datum/stored_item/vending_product(src, entry)

			product.price = (entry in prices) ? prices[entry] : 0
			product.amount = (current_list[1][entry]) ? current_list[1][entry] : 1
			product.category = category

			product_records.Add(product)

/obj/machinery/vending_mining/Destroy()
	for(var/datum/stored_item/vending_product/R in product_records)
		qdel(R)
	product_records = null
	return ..()

/obj/machinery/vending_mining/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if(prob(50))
				qdel(src)
				return
		if(3.0)
			if(prob(25))
				spawn(0)
					malfunction()
					return
				return
		else
	return

/obj/machinery/vending_mining/attackby(obj/item/weapon/W as obj, mob/user as mob)

	if(istype(W, /obj/item/weapon/coin))
		var/obj/item/weapon/coin/C = W
		insert_coin(C, user)

	else if(istype(W, /obj/item/weapon/wrench))
		playsound(src, W.usesound, 100, 1)
		if(anchored)
			user.visible_message("[user] begins unsecuring \the [src] from the floor.", "You start unsecuring \the [src] from the floor.")
		else
			user.visible_message("[user] begins securing \the [src] to the floor.", "You start securing \the [src] to the floor.")

		if(do_after(user, 20 * W.toolspeed))
			if(!src) return
			to_chat(user, "<span class='notice'>You [anchored? "un" : ""]secured \the [src]!</span>")
			anchored = !anchored
		return
	else
		..()

/**
 *  Receive payment with coin
 */
/obj/machinery/vending_mining/proc/insert_coin(var/obj/item/weapon/coin/C, mob/user)

	var/accepted = 0
	for(var/type in coins)
		if(istype(C, type))
			accepted = 1
			break
	if(!accepted)
		visible_message("<span class='danger'>\The [src] beeps harshly, refusing to accept the coin.</span>")
		return 1

	visible_message("<span class='info'>\The [usr] inserts a coin into \the [src].</span>")
	points += C.mining_value
	usr.drop_from_inventory(C)
	qdel(C)
	return 1

/obj/machinery/vending_mining/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/vending_mining/attack_hand(mob/user as mob)
	if(stat & (BROKEN|NOPOWER))
		return

	ui_interact(user)

/**
 *  Display the NanoUI window for the vending machine.
 *
 *  See NanoUI documentation for details.
 */
/obj/machinery/vending_mining/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	user.set_machine(src)

	var/list/data = list()
	data["points"] = points
	var/list/listed_products = list()

	for(var/key = 1 to product_records.len)
		var/datum/stored_item/vending_product/I = product_records[key]

		listed_products.Add(list(list(
			"key" = key,
			"name" = I.item_name,
			"price" = I.price,
			"color" = I.display_color,
			"amount" = I.get_amount())))

		data["products"] = listed_products

	ui = nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "vending_machine_mining.tmpl", name, 440, 600)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/vending_mining/Topic(href, href_list)
	if(stat & (BROKEN|NOPOWER))
		return
	if(usr.stat || usr.restrained())
		return

	if((usr.contents.Find(src) || (in_range(src, usr) && istype(src.loc, /turf))))
		if((href_list["vend"]) && (vend_ready))

			var/key = text2num(href_list["vend"])
			var/datum/stored_item/vending_product/R = product_records[key]

			if(R.price <= points)
				points -= R.price
				vend(R, usr)
			else
				to_chat(usr, "<span class='danger'>Not enough points. Requisition Denied.</span>")

		add_fingerprint(usr)
		nanomanager.update_uis(src)

/obj/machinery/vending_mining/proc/vend(datum/stored_item/vending_product/R, mob/user)

	vend_ready = 0 //One thing at a time!!
	status_message = "Vending..."
	nanomanager.update_uis(src)

	use_power(vend_power_usage)	//actuators and stuff
	if(icon_vend) //Show the vending animation if needed
		flick(icon_vend,src)

	visible_message("<span class='notice'>\The [src]'s motors wirr, retreiving an item.</span>")
	spawn(vend_delay)
		R.get_product(get_turf(src))
		if(prob(1))
			sleep(3)
			if(R.get_product(get_turf(src)))
				visible_message("<span class='notice'>\The [src] clunks as it vends an additional item.</span>")

		status_message = ""
		vend_ready = 1
		nanomanager.update_uis(src)
	return 1

/obj/machinery/vending_mining/power_change()
	..()
	if(stat & BROKEN)
		icon_state = "[initial(icon_state)]-broken"
	else
		if(!(stat & NOPOWER))
			icon_state = initial(icon_state)
		else
			spawn(rand(0, 15))
				icon_state = "[initial(icon_state)]-off"

//Oh no we're malfunctioning!  Dump out some product and break.
/obj/machinery/vending_mining/proc/malfunction()
	for(var/datum/stored_item/vending_product/R in product_records)
		while(R.get_amount()>0)
			R.get_product(loc)
		break

	stat |= BROKEN
	icon_state = "[initial(icon_state)]-broken"
	return
