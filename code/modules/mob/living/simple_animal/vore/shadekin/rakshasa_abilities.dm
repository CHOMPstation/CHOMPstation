/mob/living/simple_animal/shadekin/initialize()
	var/list/ability_types = subtypesof(/obj/effect/shadekin_ability)
	ability_types += subtypesof(/obj/effect/rakshasa_ability)
	shadekin_abilities = list()
	for(var/type in ability_types)
		shadekin_abilities += new type(src)

	update_icon()

	return ..()
	

/obj/effect/rakshasa_ability
	name = ""
	desc = ""
	icon = 'icons/mob/screen_spells.dmi'
	var/ability_name = "FIX ME"
	var/cost = 50
	var/mob/living/simple_animal/shadekin/my_kin
	var/shift_mode = NOT_WHILE_SHIFTED
	var/ab_sound

/obj/effect/rakshasa_ability/New(var/new_kin)
	..()
	my_kin = new_kin
	loc = null

/obj/effect/rakshasa_ability/Destroy()
	my_kin = null
	return ..()

/obj/effect/rakshasa_ability/proc/atom_button_text()
	var/shift_denial

	if(shift_mode == NOT_WHILE_SHIFTED && (my_kin.ability_flags & AB_PHASE_SHIFTED))
		shift_denial = "Physical Only"
	else if(shift_mode == ONLY_WHILE_SHIFTED && !(my_kin.ability_flags & AB_PHASE_SHIFTED))
		shift_denial = "Shifted Only"

	if(shift_denial)
		name = shift_denial
	else
		name = my_kin.energy >= cost ? "Activate" : "No Energy"
	return src

/obj/effect/rakshasa_ability/Click(var/location, var/control, var/params)
	if(my_kin.stat) return

	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		to_chat(my_kin,"<span class='notice'><b>[name]</b> (Cost: [cost]%) - [desc]</span>")
	else
		do_ability(my_kin)

/obj/effect/rakshasa_ability/proc/do_ability()
	if(my_kin.stat)
		to_chat(my_kin,"<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	if(shift_mode == NOT_WHILE_SHIFTED && (my_kin.ability_flags & AB_PHASE_SHIFTED))
		to_chat(my_kin,"<span class='warning'>Can't use that ability while phase shifted!</span>")
		return FALSE
	else if(shift_mode == ONLY_WHILE_SHIFTED && !(my_kin.ability_flags & AB_PHASE_SHIFTED))
		to_chat(my_kin,"<span class='warning'>Can only use that ability while phase shifted!</span>")
		return FALSE
	else if(my_kin.energy < cost)
		to_chat(my_kin,"<span class='warning'>Not enough energy for that ability!</span>")
		return FALSE

	my_kin.energy -= cost
	if(ab_sound)
		playsound(src,ab_sound,75,1)

	return TRUE




/obj/effect/rakshasa_ability/phase_shift2
	ability_name = "Goo Shift"
	desc = "Shift yourself with goopy effects."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/phase_shift2/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(loc, src)
	playsound(src, 'sound/rakshasa/Corrosion1.ogg', 100, 1)
	my_kin.phase_shift()
	if(my_kin.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
	else
		cost = initial(cost)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		playsound(my_kin.loc, 'sound/rakshasa/Emerge0.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/phase_shift3
	ability_name = "Goo Shift No Emerge"
	desc = "Shift yourself with goopy effects."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/phase_shift3/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(loc, src)
	playsound(src, 'sound/rakshasa/Corrosion1.ogg', 100, 1)
	my_kin.phase_shift()
	if(my_kin.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
	else
		cost = initial(cost)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/drip_oil
	ability_name = "Goo Drip"
	desc = "Drip some goo."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/drip_oil/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
	var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
	var/sound = pick(goo_sounds)
	playsound(my_kin.loc, sound, 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/laugh
	ability_name = "Laugh"
	desc = "Laugh."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/laugh/do_ability()
	if(!..())
		return
	playsound(my_kin.loc, 'sound/rakshasa/Laugh.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/no
	ability_name = "Say No"
	desc = "Say no!"
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/no/do_ability()
	if(!..())
		return
	playsound(my_kin.loc, 'sound/rakshasa/No.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/trap
	ability_name = "Lay Trap"
	desc = "Lay a trap that will notify you when someone steps in it."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/trap/do_ability()
	if(!..())
		return
	var/goo_sounds = list (
			'sound/rakshasa/Corrosion1.ogg',
			'sound/rakshasa/Corrosion2.ogg',
			'sound/rakshasa/Corrosion3.ogg'
			)
	var/sound = pick(goo_sounds)
	playsound(my_kin.loc, sound, 100, 1)
	new /obj/structure/gootrap (my_kin.loc)

































/*
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                            //
//                                                                                                                            //
//                                                      Starting Stuff                                                        //
//                                                                                                                            //
//                                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var/list/rakshasa_abilities

/mob/living/simple_animal/shadekin/rakshasa/initialize()
	//You spawned the prototype, and want a totally random one.
	if(type == /mob/living/simple_animal/shadekin/rakshasa)

		//I'm told by VerySoft these are the liklihood values
		var/list/sk_types = list(
			/mob/living/simple_animal/shadekin/red = 20,	//Actively seek people out to nom, so fairly common to see (relatively speaking),
			/mob/living/simple_animal/shadekin/blue = 15,	//Explorers that like to interact with people, so still fairly common,
			/mob/living/simple_animal/shadekin/purple = 15,	//Also explorers that may or may not homf people,
			/mob/living/simple_animal/shadekin/yellow = 1	//Very rare, usually never leaves their home
		)
		var/new_type = pickweight(sk_types)

		new new_type(loc)
		initialized = TRUE
		return INITIALIZE_HINT_QDEL

	if(icon_state == "map_example")
		icon_state = pick("white","dark","brown")

	icon_living = icon_state

	switch(eye_state)
		if(BLUE_EYES)
			eye_icon_state = "e_blue"
		if(RED_EYES)
			eye_icon_state = "e_red"
		if(PURPLE_EYES)
			eye_icon_state = "e_purple"
		if(YELLOW_EYES)
			eye_icon_state = "e_yellow"
		if(GREEN_EYES)
			eye_icon_state = "e_green"
		if(ORANGE_EYES)
			eye_icon_state = "e_orange"
		else
			eye_icon_state = "e_red"

	tailimage = image('icons/mob/vore_shadekin64.dmi',null,icon_state)
	tailimage.pixel_x = -16

	if(eye_desc)
		desc += " This one has [eye_desc]!"

	var/list/ability_types = subtypesof(/obj/effect/rakshasa_ability)
	rakshasa_abilities = list()
	for(var/type in ability_types)
		rakshasa_abilities += new type(src)

	update_icon()

	return ..()

/mob/living/simple_animal/shadekin/Destroy()
	qdel_null_list(rakshasa_abilities)
	. = ..()
	
	

/mob/living/simple_animal/shadekin/rakshasa/Stat()
	. = ..()
	if(statpanel("Rakshasa"))
		rakshasa_abilities_stat()

/mob/living/simple_animal/shadekin/rakshasa/proc/rakshasa_abilities_stat()
	for(var/A in rakshasa_abilities)
		var/obj/effect/rakshasa_ability/ability = A
		stat("[ability.ability_name]",ability.atom_button_text())




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                            //
//                                                                                                                            //
//                                              Some Procs for Abilities                                                      //
//                                                                                                                            //
//                                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Phase shifting procs (and related procs)
/mob/living/simple_animal/shadekin/rakshasa/proc/rak_phase_shift()
	var/turf/T = get_turf(src)
	if(!T.CanPass(null,T) || loc != T)
		to_chat(src,"<span class='warning'>You can't use that here!</span>")
		return FALSE

	forceMove(T)
	var/original_canmove = canmove
	SetStunned(0)
	SetWeakened(0)
	if(buckled)
		buckled.unbuckle_mob()
	if(pulledby)
		pulledby.stop_pulling()
	stop_pulling()
	canmove = FALSE

	//Shifting in
	if(ability_flags & AB_PHASE_SHIFTED)
		ability_flags &= ~AB_PHASE_SHIFTED
		name = real_name
		for(var/belly in vore_organs)
			var/obj/belly/B = belly
			B.escapable = initial(B.escapable)

		overlays.Cut()
		alpha = initial(alpha)
		invisibility = initial(invisibility)
		see_invisible = initial(see_invisible)
		incorporeal_move = initial(incorporeal_move)
		density = initial(density)
		force_max_speed = initial(force_max_speed)

		//Cosmetics mostly
		flick("tp_in",src)
		custom_emote(1,"phases in!")
		sleep(5) //The duration of the TP animation
		canmove = original_canmove

		//Potential phase-in vore
		if(can_be_drop_pred) //Toggleable in vore panel
			var/list/potentials = living_mobs(0)
			if(potentials.len)
				var/mob/living/target = pick(potentials)
				if(istype(target) && vore_selected)
					target.forceMove(vore_selected)
					to_chat(target,"<span class='warning'>\The [src] phases in around you, [vore_selected.vore_verb]ing you into their [vore_selected.name]!</span>")

		// Do this after the potential vore, so we get the belly
		update_icon()

		//Affect nearby lights
		var/destroy_lights = 0
		if(eye_state == RED_EYES)
			destroy_lights = 80
		if(eye_state == PURPLE_EYES)
			destroy_lights = 25

		for(var/obj/machinery/light/L in machines)
			if(L.z != z || get_dist(src,L) > 10)
				continue

			if(prob(destroy_lights))
				spawn(rand(5,25))
					L.broken()
			else
				L.flicker(10)

	//Shifting out
	else
		ability_flags |= AB_PHASE_SHIFTED
		custom_emote(1,"phases out!")
		real_name = name
		name = "Something"

		for(var/belly in vore_organs)
			var/obj/belly/B = belly
			B.escapable = FALSE

		overlays.Cut()
		flick("tp_out",src)
		sleep(5)
		invisibility = INVISIBILITY_LEVEL_TWO
		see_invisible = INVISIBILITY_LEVEL_TWO
		update_icon()
		alpha = 127

		canmove = original_canmove
		incorporeal_move = TRUE
		density = FALSE
		force_max_speed = TRUE

/mob/living/simple_animal/shadekin/Rakshasa/UnarmedAttack()
	if(ability_flags & AB_PHASE_SHIFTED)
		return FALSE //Nope.

	. = ..()

/mob/living/simple_animal/shadekin/rakshasa/can_fall()
	if(ability_flags & AB_PHASE_SHIFTED)
		return FALSE //Nope!

	return ..()

/mob/living/simple_animal/shadekin/rakshasa/zMove(direction)
	if(ability_flags & AB_PHASE_SHIFTED)
		var/turf/destination = (direction == UP) ? GetAbove(src) : GetBelow(src)
		if(destination)
			forceMove(destination)
		return TRUE

	return ..()

// Healing others
/mob/living/simple_animal/shadekin/rakshasa/proc/rak_mend_other()
	//I hate to crunch a view() but I only want ones I can see
	var/list/viewed = oview(1)
	var/list/targets = list()
	for(var/mob/living/L in viewed)
		targets += L
	if(!targets.len)
		to_chat(src,"<span class='warning'>Nobody nearby to mend!</span>")
		return FALSE

	var/mob/living/target = input(src,"Pick someone to mend:","Mend Other") as null|anything in targets
	if(!target)
		return FALSE

	target.add_modifier(/datum/modifier/shadekin/rakshasa/heal_boop,1 MINUTE)
	visible_message("<span class='notice'>\The [src] gently places a hand on \the [target]...</span>")
	face_atom(target)
	return TRUE
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                            //
//                                                                                                                            //
//                                                      Actual Abilities                                                      //
//                                                                                                                            //
//                                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/rakshasa_ability
	name = ""
	desc = ""
	icon = 'icons/mob/screen_spells.dmi'
	var/ability_name = "FIX ME"
	var/cost = 50
	var/mob/living/simple_animal/rakshasa/my_rak
	var/shift_mode = NOT_WHILE_SHIFTED
	var/ab_sound

/obj/effect/rakshasa_ability/New(var/new_rak)
	..()
	my_rak = new_rak
	loc = null

/obj/effect/rakshasa_ability/Destroy()
	my_rak = null
	return ..()

/obj/effect/rakshasa_ability/proc/atom_button_text()
	var/shift_denial

	if(shift_mode == NOT_WHILE_SHIFTED && (my_rak.ability_flags & AB_PHASE_SHIFTED))
		shift_denial = "Physical Only"
	else if(shift_mode == ONLY_WHILE_SHIFTED && !(my_rak.ability_flags & AB_PHASE_SHIFTED))
		shift_denial = "Shifted Only"

	if(shift_denial)
		name = shift_denial
	else
		name = my_rak.energy >= cost ? "Activate" : "No Energy"
	return src

/obj/effect/rakshasa_ability/Click(var/location, var/control, var/params)
	if(my_rak.stat) return

	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		to_chat(my_rak,"<span class='notice'><b>[name]</b> (Cost: [cost]%) - [desc]</span>")
	else
		do_ability(my_rak)

/obj/effect/rakshasa_ability/proc/do_ability()
	if(my_rak.stat)
		to_chat(my_rak,"<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	if(shift_mode == NOT_WHILE_SHIFTED && (my_rak.ability_flags & AB_PHASE_SHIFTED))
		to_chat(my_rak,"<span class='warning'>Can't use that ability while phase shifted!</span>")
		return FALSE
	else if(shift_mode == ONLY_WHILE_SHIFTED && !(my_rak.ability_flags & AB_PHASE_SHIFTED))
		to_chat(my_rak,"<span class='warning'>Can only use that ability while phase shifted!</span>")
		return FALSE
	else if(my_rak.energy < cost)
		to_chat(my_rak,"<span class='warning'>Not enough energy for that ability!</span>")
		return FALSE

	my_rak.energy -= cost
	if(ab_sound)
		playsound(src,ab_sound,75,1)

	return TRUE

/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/rak_phase_shift
	ability_name = "Phase Shift"
	desc = "Shift yourself out of alignment with realspace to travel quickly between areas."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/rak_phase_shift/do_ability()
	if(!..())
		return
	my_rak.rak_phase_shift()
	if(my_rak.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
	else
		cost = initial(cost)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/goo_phase_shift
	ability_name = "Goo Shift"
	desc = "Shift yourself with goopy effects."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/rak_phase_shift/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(loc, src)
	playsound(src, 'sound/rakshasa/Corrosion1.ogg', 100, 1)
	my_rak.rak_phase_shift()
	if(my_rak.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
	else
		cost = initial(cost)
/////////////////////////////////////////////////////////////////	
/obj/effect/rakshasa_ability/heal_boop
	ability_name = "Regenerate Other"
	desc = "Spend energy to heal physical wounds in another creature."
	icon_state = "tech_biomedaura"
	cost = 50
	shift_mode = NOT_WHILE_SHIFTED
	ab_sound = 'sound/effects/EMPulse.ogg'
/obj/effect/rakshasa_ability/heal_boop/do_ability()
	if(!..())
		return
	if(!my_rak.rak_mend_other())
		my_rak.energy += cost //Refund due to abort

/datum/modifier/rakshasa/heal_boop
	name = "Shadekin Regen"
	desc = "You feel serene and well rested."
	mob_overlay_state = "green_sparkles"

	on_created_text = "<span class='notice'>Sparkles begin to appear around you, and all your ills seem to fade away.</span>"
	on_expired_text = "<span class='notice'>The sparkles have faded, although you feel much healthier than before.</span>"
	stacks = MODIFIER_STACK_EXTEND

/datum/modifier/rakshasa/heal_boop/tick()
	if(!holder.getBruteLoss() && !holder.getFireLoss() && !holder.getToxLoss() && !holder.getOxyLoss() && !holder.getCloneLoss()) // No point existing if the spell can't heal.
		expire()
		return
	holder.adjustBruteLoss(-2)
	holder.adjustFireLoss(-2)
	holder.adjustToxLoss(-2)
	holder.adjustOxyLoss(-2)
	holder.adjustCloneLoss(-2)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/create_shade
	ability_name = "Create Shade"
	desc = "Create a field of darkness that follows you."
	icon_state = "tech_dispelold"
	cost = 25
	shift_mode = NOT_WHILE_SHIFTED
	ab_sound = 'sound/effects/bamf.ogg'
/obj/effect/rakshasa_ability/create_shade/do_ability()
	if(!..())
		return
	my_rak.add_modifier(/datum/modifier/rakshasa/create_shade,20 SECONDS)
/datum/modifier/rakshasa/create_shade
	name = "Shadekin Shadegen"
	desc = "Darkness envelops you."
	mob_overlay_state = ""

	on_created_text = "<span class='notice'>You drag part of The Dark into realspace, enveloping yourself.</span>"
	on_expired_text = "<span class='warning'>You lose your grasp on The Dark and realspace reasserts itself.</span>"
	stacks = MODIFIER_STACK_EXTEND
	var/mob/living/simple_animal/rakshasa/my_rak

/datum/modifier/rakshasa/create_shade/tick()
	if(my_rak.ability_flags & AB_PHASE_SHIFTED)
		expire()

/datum/modifier/rakshasa/create_shade/on_applied()
	my_rak = holder
	holder.glow_toggle = TRUE
	holder.glow_range = 8
	holder.glow_intensity = -10
	holder.glow_color = "#FFFFFF"
	holder.set_light(8, -10, "#FFFFFF")

/datum/modifier/rakshasa/create_shade/on_expire()
	holder.glow_toggle = initial(holder.glow_toggle)
	holder.glow_range = initial(holder.glow_range)
	holder.glow_intensity = initial(holder.glow_intensity)
	holder.glow_color = initial(holder.glow_color)
	holder.set_light(0)
	my_rak = null
/*
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/energy_feast
	ability_name = "Devour Energy"
	desc = "Devour the energy from another creature (potentially fatal)."
	icon_state = "gen_eat"
	cost = 25
	shift_mode = NOT_WHILE_SHIFTED
/obj/effect/rakshasa_ability/energy_feast/do_ability()
	if(!..())
		return
*/


*/








