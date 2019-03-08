//Mobs that may be USED like objects but are actually internally Mobs
//So the MAIN purpose of this would be something like a Mimic who turns into a crate 
//Basically this will set some vars to use across them like "obj_icon" and "obj_on"

mob/living/simple_animal/mobject
	name = "Metamorphic fox"
	desc = "Something about this seems, off."
	var/animal_icon = 'icons/mob/vore.dmi'
	var/animal_icon_state = "fennec"
	var/obj_icon = 'icons/mob/pai.dmi'
	var/obj_icon_state = "fox"
	var/obj_on
	var/PandL = 1 //Run both Process() and Life //Since Process takes Priority turning the mob off will also turn off Life()
	var/willanchor = 0 //Var that decides if obj state is anchored or not 
	var/norest = 1 //Var that makes mobject in animal state unrest automatically //simple workaround to infinite resting
	var/on = 1 //Just another var to turn off the mob object processing
	var/morphitem = /obj/item/weapon/wrench //Since its the most used item for anchoring this wil be default
	var/powertoggle //off by default
	var/altpowertoggle = 1 //on by default, turn off/on on click by hand
	hostile = 0
	retaliate = 0
	icon_dead = "fennec_dead" //oof

mob/living/simple_animal/mobject/New()
	..()
	animal_icon = icon
	animal_icon_state = icon_state

mob/living/simple_animal/mobject/attack_hand(mob/user as mob) //Togglecode
	if(obj_on)
		if(altpowertoggle)
			if(on)
				on = !on
			else
				on = 1

mob/living/simple_animal/mobject/attackby(obj/item/I, mob/user) //Togglecode
	if(istype(I,morphitem))
		if(obj_on)
			obj_on = !obj_on
		else
			obj_on = 1
	else if(istype(I,powertoggle))
		if(obj_on)
			if(on)
				on = !on
			else
				on = 1
	else
		..()

//Life() process() Duality
mob/living/simple_animal/mobject/Life()
	if(!obj_on && icon != animal_icon)
		icon = animal_icon
		icon_state = animal_icon_state
		update_icons()
	if(obj_on)
		if(icon!=obj_icon)
			icon = obj_icon
			icon_state = obj_icon_state
			update_icons()
		if(willanchor)
			anchored = 1
		process()
		if(PandL)
			..()
	else
		if(norest && resting)
			resting = !resting
		if(anchored)
			anchored = !anchored
		..()

mob/living/simple_animal/mobject/proc/process() //proccess performed instead of Life in OBJ form.
	if(!on)
		return //A way to disable process() //for PandL this will also disable Life()

//Mobject engineering will Probably be first, basically a Synthetic Mob that can be wrenched into active object mode
