/obj/item/weapon/service_fab
	name = "\improper Service item disepencer"
	desc = "A device used to dispence service items."
	icon = 'icons/obj/items.dmi'
	icon_state = "rcd"
	var/obj/product
	var/mode = 1

/obj/item/weapon/service_fab/attack_self(mob/user as mob)
	var/mob/M = usr
	var/list/options = list()
	options["Drinking Glass, Pint"] = 1
	options["Coffee Cup"] = 2
	options["Paper"] = 3
	options["Pen"] = 4
	options["Dice Bag"] = 5
	options["Cigarette"] = 6
	var/choice = input(M,"Choose your item!") in options
	if(src && choice && !M.stat && in_range(M,src))
		mode = options[choice]
		M << "You will now dispence [choice]"
		return 1

/obj/item/weapon/service_fab/afterattack(atom/A, mob/user as mob, proximity)
	if(!proximity) return

	if(istype(user,/mob/living/silicon/robot))
		var/mob/living/silicon/robot/R = user
		if(R.stat || !R.cell || R.cell.charge <= 0)
			return
//	else
//		if(stored_matter <= 0)
//			return

	if(!istype(A, /obj/structure/table) && !istype(A, /turf/simulated/floor))
		return

	playsound(src.loc, 'sound/machines/click.ogg', 10, 1)
	var/used_energy = 30
//	var/obj/product

	switch(mode)
		if(1)
			product = new /obj/item/weapon/reagent_containers/food/drinks/glass2/pint()
		if(2)
			product = new /obj/item/weapon/reagent_containers/food/drinks/cup()
		if(3)
			product = new /obj/item/weapon/paper()
		if(4)
			product = new /obj/item/weapon/pen()
		if(5)
			product = new /obj/item/weapon/storage/pill_bottle/dice()
		if(6)
			product = new /obj/item/clothing/mask/smokable/cigarette()

	user << "Dispensing [product ? product : "product"]..."
	product.loc = get_turf(A)

//	if(isrobot(user))
	var/mob/living/silicon/robot/R = user
	if(R.cell)
		R.cell.use(used_energy)