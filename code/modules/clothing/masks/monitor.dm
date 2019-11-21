//IPC-face object for FPB.
/obj/item/clothing/mask/monitor

	name = "display monitor"
	desc = "A rather clunky old CRT-style display screen, fit for mounting on an optical output."
	body_parts_covered = FACE|EYES
	dir = SOUTH

	icon = 'icons/mob/monitor_icons.dmi'
	icon_override = 'icons/mob/monitor_icons.dmi'
	icon_state = "monitor"

	var/monitor_state_index = "blank"
	var/global/list/monitor_states = list()

/obj/item/clothing/mask/monitor/set_dir()
	dir = SOUTH
	return

/obj/item/clothing/mask/monitor/equipped()
	..()
	var/mob/living/carbon/human/H = loc
	if(istype(H) && H.wear_mask == src)
		var/obj/item/organ/external/E = H.organs_by_name[BP_HEAD]
		var/datum/robolimb/robohead = all_robolimbs[E.model]
		canremove = 0
		if(robohead.monitor_styles)
			monitor_states = params2list(robohead.monitor_styles)
			icon_state = monitor_states[monitor_state_index]
			H << "<span class='notice'>\The [src] connects to your display output.</span>"

/obj/item/clothing/mask/monitor/dropped()
	canremove = 1
	return ..()

/obj/item/clothing/mask/monitor/mob_can_equip(var/mob/living/carbon/human/user, var/slot)
	if (!..())
		return 0
	if(istype(user))
		var/obj/item/organ/external/E = user.organs_by_name[BP_HEAD]
		var/datum/robolimb/robohead = all_robolimbs[E.model]
		if(istype(E) && (E.robotic >= ORGAN_ROBOT) && robohead.monitor_styles)
			return 1
		user << "<span class='warning'>You must have a compatible robotic head to install this upgrade.</span>"
	return 0

/obj/item/clothing/mask/monitor/verb/set_monitor_state()
	set name = "Set Monitor State"
	set desc = "Choose an icon for your monitor."
	set category = "IC"

	set src in usr
	var/mob/living/carbon/human/H = loc
	if(!istype(H) || H != usr)
		return
	if(H.wear_mask != src)
		usr << "<span class='warning'>You have not installed \the [src] yet.</span>"
		return
	var/choice = input("Select a screen icon.") as null|anything in monitor_states
	if(choice)
		monitor_state_index = choice
		update_icon()

/obj/item/clothing/mask/monitor/update_icon()
	if(!(monitor_state_index in monitor_states))
		monitor_state_index = initial(monitor_state_index)
	icon_state = monitor_states[monitor_state_index]
	var/mob/living/carbon/human/H = loc
	if(istype(H)) H.update_inv_wear_mask()
	
	
//TESHARI FACE MASK //Defning all the procs in one go
/obj/item/clothing/mask/synthfacemask
	name = "Synth Face"
	desc = "A round dark muzzle made of LEDs."
	body_parts_covered = FACE|EYES
	icon = 'icons/mob/species/seromi/synth_facemask.dmi'
	icon_override = 'icons/mob/species/seromi/synth_facemask.dmi'
	icon_state = "synth_facemask"
	origin_tech = list(TECH_ILLEGAL = 1)

	equipped()
		..()
		var/mob/living/carbon/human/H = loc
		if(istype(H) && H.wear_mask == src)
			canremove = 0
	dropped()
		canremove = 1
		return ..()
	mob_can_equip(var/mob/living/carbon/human/user, var/slot)
		if (!..())
			return 0
		if(istype(user))
			var/obj/item/organ/external/E = user.organs_by_name[BP_HEAD]
			if(istype(E) && (E.robotic >= ORGAN_ROBOT))
				return 1
			user << "<span class='warning'>You must have a compatible robotic head to install this upgrade.</span>"
		return 0
	update_icon()
		var/mob/living/carbon/human/H = loc
		if (H.stat == DEAD) icon_state = "synth_facemask_dead"
		if(istype(H)) H.update_inv_wear_mask()
		
