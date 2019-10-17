/obj/machinery/button
	name = "button"
	icon = 'icons/obj/objects.dmi'
	icon_state = "launcherbtt"
//	plane = TURF_PLANE //Can't have them under tables, oh well.
//	layer = ABOVE_TURF_LAYER
	desc = "A remote control switch for something."
	var/id = null
	var/active = 0
	anchored = 1.0
	use_power = 1
	idle_power_usage = 2
	active_power_usage = 4

/obj/machinery/button/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/button/attackby(obj/item/weapon/W, mob/user as mob)
	return attack_hand(user)

// VOREStation Edit Begin
/obj/machinery/button/attack_hand(obj/item/weapon/W, mob/user as mob)
	if(..()) return 1
	playsound(loc, 'sound/machines/button.ogg', 100, 1)
// VOREStation Edit End

/obj/machinery/button/emergencydoorpulse
	name = "Emergency Door override"
	desc = "A remote control for providing a short burst of power to all nearby doors and sending unbolt and open signals. Automatically recloses after 60 seconds. WARNING: System does not relock doors."
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0

/obj/machinery/button/emergencydoorpulse/attack_hand(obj/item/weapon/W, mob/user as mob)
	for(var/obj/machinery/door/airlock/door in range(5, src))
		door.unlock(1)
		sleep(10)
		door.open(1)
		spawn(600)
			door.close(1)

/obj/item/device/buttonofnormal
	name = "Chaos button"
	desc = "It radiates an aura of chaotic size energy."
	icon = 'icons/obj/mobcap.dmi'
	icon_state = "mobcap0"
	matter = list(DEFAULT_WALL_MATERIAL = 1000)
	throwforce = 00
	throw_speed = 4
	throw_range = 20
	force = 0
	var/colorindex = 0
	var/mob/living/capsuleowner = null //taken from Capsule Code
	var/sizetouse = 0.25

	pickup(mob/user)
		if(!capsuleowner)
			capsuleowner = user

	attack_self(mob/user)
		if(colorindex)
			nonrandom()
		sleep(10)
		capsuleowner.resize(sizetouse)
		sizetouse = rand(25,200)/100 //randmization occurs after press

	throw_impact(atom/A, speed, mob/user)
		..()
		if(isliving(A))
			if(colorindex)
				nonrandom()
			sleep(5)
			var/mob/living/capsulehit = A
			capsulehit.resize(sizetouse)
			sizetouse = rand(25,200)/100 //randmization occurs after press

	attackby(obj/item/W, mob/user)
		if(istype(W, /obj/item/weapon/pen))
			colorindex += 1
			if(colorindex >= 6)
				colorindex = 0
			icon_state = "mobcap[colorindex]"
			update_icon()
		..()

/obj/item/device/buttonofnormal/proc/nonrandom() //Secret ball randmoizer rig code
	switch(colorindex)
		if(1)	sizetouse = RESIZE_HUGE
		if(2)	sizetouse = RESIZE_BIG
		if(3)	sizetouse = RESIZE_NORMAL
		if(4)	sizetouse = RESIZE_SMALL
		if(5)	sizetouse = RESIZE_TINY

/obj/item/device/daredevice
	name = "Dare button"
	desc = "A strange button, the only distinguishing feature being an engraved text reading 'Suffer to Gain.'."
	icon = 'icons/obj/mobcap.dmi'
	icon_state = "mobcap1"
	matter = list(DEFAULT_WALL_MATERIAL = 5000)
	throwforce = 00
	throw_speed = 2
	throw_range = 20
	force = 0
	var/luckynumber7 = 0
	var/colorindex = 1
	
	var/list/winitems = list(
				/obj/item/weapon/reagent_containers/food/snacks/cookie,
				/obj/item/weapon/spacecasinocash,
				/obj/item/weapon/reagent_containers/syringe/drugs,
	)

	attackby(obj/item/W, mob/user)
		if(istype(W, /obj/item/weapon/pen))
			colorindex += 1
			if(colorindex >= 6)
				colorindex = 0
			icon_state = "mobcap[colorindex]"
			update_icon()
		..()

	attack_self(mob/user)
		var/mob/living/capsuleowner = user
		playsound(src, 'sound/effects/splat.ogg', 30, 1)
		var/item = pick(winitems)
		sleep(100)
		switch(luckynumber7)
			if(1)	capsuleowner.resize(RESIZE_TINY) //Loss Shrinking!
			if(2)	capsuleowner.apply_damage(5, BRUTE) //Loss Damaging!
			if(3)	capsuleowner.Weaken(5) //Loss Knee spaghetti!
			if(4)	capsuleowner.hallucination += 66 //loss woah, dude.
			if(5)	new	item(capsuleowner.loc) //Win!
			if(7)	
				new	/obj/item/weapon/material/butterfly/switchblade(capsuleowner.loc)
				capsuleowner.apply_damage(10, BRUTE) //Loss Damaging! WIN KNIVE!
			if(9)	
				new	/obj/item/weapon/gun/energy/sizegun/not_advanced(capsuleowner.loc)
				qdel(src)
			if(777)	new	/obj/item/weapon/spacecash/c1000(capsuleowner.loc) //for rigging
			else luckynumber7 = (rand(0,10))
		luckynumber7 = rand(0,10)
		sleep(100)
		playsound(src.loc, 'sound/machines/slotmachine.ogg', 25, 1)
