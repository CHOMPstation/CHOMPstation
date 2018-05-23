//generic procs copied from obj/effect/alien
/obj/effect/space_expansion
	name = "space"
	desc = "it's dark"
	icon = 'icons/turf/space.dmi'
	anchored = 1
	density = 0
	var/health = 15

/obj/effect/space_expansion/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
		if(2.0)
			if (prob(50))
				qdel(src)
		if(3.0)
			if (prob(5))
				qdel(src)
	return

/obj/effect/space_expansion/attackby(var/obj/item/weapon/W, var/mob/user)
	user.setClickCooldown(user.get_attack_speed(W))

	if(W.attack_verb.len)
		visible_message("<span class='warning'>\The [src] have been [pick(W.attack_verb)] with \the [W][(user ? " by [user]." : ".")]</span>")
	else
		visible_message("<span class='warning'>\The [src] have been attacked with \the [W][(user ? " by [user]." : ".")]</span>")

	if(istype(W, /obj/item/weapon/weldingtool))
		var/obj/item/weapon/weldingtool/WT = W

		if(WT.remove_fuel(0, user))
			playsound(src, W.usesound, 100, 1)

/obj/effect/space_expansion/bullet_act(var/obj/item/projectile/Proj)
	..()

/obj/effect/space_expansion/proc/healthcheck()
	if(health <= 0)
		qdel(src)


/obj/effect/space_expansion/space
	name = "space"
	desc = "it's dark"
	icon_state = "17"
	anchored = 0
	layer = HIDING_LAYER
	health = 3

/obj/effect/space_expansion/space/New(var/location, var/atom/parent)
	processing_objects |= src
	//50% chance to grow up
	get_light_and_color(parent)
	..()

/obj/effect/space_expansion/space/Destroy()
	processing_objects -= src
	walk(src, 0) // Because we might have called walk_to, we must stop the walk loop or BYOND keeps an internal reference to us forever.
	return ..()

/obj/effect/space_expansion/space/Bump(atom/user)
	if(istype(user, /obj/structure/table))
		src.loc = user.loc
	else
		..()

/obj/effect/space_expansion/space/proc/die()
	visible_message("<span class='alert'>[src] dies!</span>")
	new /obj/effect/decal/cleanable/spiderling_remains(src.loc)
	qdel(src)

/obj/effect/space_expansion/space/healthcheck()
	if(health <= 0)
		die()

/obj/effect/space_expansion/space/process()
	if(isturf(loc))
		slide()

/obj/effect/space_expansion/space/proc/slide()
	if(isturf(loc))
		if(prob(25))
			var/list/nearby = trange(5, src) - loc
			if(nearby.len)
				var/target_atom = pick(nearby)
				walk_to(src, target_atom, 5)