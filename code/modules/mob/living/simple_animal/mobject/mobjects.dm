//Mobs that may be USED like objects but are actually internally Mobs
//So the MAIN purpose of this would be something like a Mimic who turns into a crate 
//Basically this will set some vars to use across them like "obj_icon" and "obj_form"

mob/living/simple_animal/mobject
	name = "Mobject"
	desc = "Something about this seems, off."
	var/animal_icon
	var/animal_icon_state
	var/obj_icon
	var/obj_icon_state
	var/obj_on

mob/living/simple_animal/mobject/New()
	..()
	animal_icon = icon
	animal_icon_state = icon_state

mob/living/simple_animal/mobject/Life()
	if(obj_on)
		icon = obj_icon
		icon_state = obj_icon_sate
		anchored = 1
		process()
	if(!obj_on && anchored)
		icon = animal_icon
		icon_state = animal_icon_state
		anchored = !anchored
	..()

mob/living/simple_animal/mobject/proc/process()
	//proccess performed instead of Life in OBJ form.
	return //Currently does nothing

//Mobject engineering will Probably be first, basically a Synthetic Mob that can be wrenched into active object mode
