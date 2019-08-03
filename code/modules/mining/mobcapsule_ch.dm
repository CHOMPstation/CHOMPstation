/*********************Mob Capsule*************************/

/obj/item/device/mobcapsule
	name = "Morpheus capsule" //Whats a lazarus
	desc = "It allows you to store and deploy Morpheus-injected creatures easier."
	icon = 'icons/obj/mobcap.dmi'
	icon_state = "mobcap0"
	throwforce = 00
	throw_speed = 4
	throw_range = 20
	force = 0
	var/storage_capacity = 1
	var/mob/living/capsuleowner = null
	var/tripped = 0
	var/colorindex = 0
	var/mob/contained_mob

/obj/item/device/mobcapsule/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/weapon/pen))
		if(user != capsuleowner)
			to_chat(user, "<span class='warning'>\The [src] briefly flashes an error.</span>")
			return 0
		spawn()
			var/mname = sanitize(input("Choose a name for your friend.", "Name your friend", contained_mob.name) as text|null)
			if(mname)
				contained_mob.name = mname
				to_chat(user, "<span class='notice'>Renaming successful, say hello to [contained_mob]!</span>")
				name = "Morpheus capsule - [mname]"
	..()

/obj/item/device/mobcapsule/throw_impact(atom/A, speed, mob/user)
	..()
	if(!tripped)
		if(contained_mob)
			dump_contents(user)
			tripped = 1
		else
			take_contents(user)
			tripped = 1

/obj/item/device/mobcapsule/proc/insert(var/atom/movable/AM, mob/user)
	if(contained_mob)
		return -1

	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		//if(L.locked_to)//locked_to doesnt seem to exist in our code/game/atoms_movable.dm
		//	return 0
		if(L.client)
			L.client.perspective = EYE_PERSPECTIVE
			L.client.eye = src
	else if(!istype(AM, /obj/item) && !istype(AM, /obj/effect/dummy/chameleon))
		return 0
	else if(AM.density || AM.anchored)
		return 0
	AM.forceMove(src)
	contained_mob = AM
	name = "Morpheus capsule - [AM.name]"
	return 1

/obj/item/device/mobcapsule/pickup(mob/user)
	tripped = 0
	capsuleowner = user

/obj/item/device/mobcapsule/proc/dump_contents(mob/user)
	/*
	//Cham Projector Exception
	for(var/obj/effect/dummy/chameleon/AD in src)
		AD.forceMove(src.loc)
	for(var/obj/O in src)
		O.forceMove(src.loc)
	for(var/mob/M in src)
		M.forceMove(src.loc)
		if(M.client)
			M.client.eye = M.client.mob
			M.client.perspective = MOB_PERSPECTIVE
*/
	if(contained_mob)
		contained_mob.forceMove(src.loc)

		var/turf/turf = get_turf(src)
		log_attack("[key_name(user)] has released hostile mob [contained_mob] with a capsule in area [turf.loc] ([x],[y],[z]).")
		contained_mob.attack_log += "\[[time_stamp()]\] Released by <b>[key_name(user)]</b> in area [turf.loc] ([x],[y],[z])."
		user.attack_log += "\[[time_stamp()]\] Released hostile mob <b>[contained_mob]</b> in area [turf.loc] ([x],[y],[z])."
		msg_admin_attack("[key_name(user)] has released hostile mob [contained_mob] with a capsule in area [turf.loc] ([x],[y],[z]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</A>).")

		if(contained_mob.client)
			contained_mob.client.eye = contained_mob.client.mob
			contained_mob.client.perspective = MOB_PERSPECTIVE
		contained_mob = null
		name = "Morpheus capsule"

/obj/item/device/mobcapsule/attack_self(mob/user)
	colorindex += 1
	if(colorindex >= 6)
		colorindex = 0
	icon_state = "mobcap[colorindex]"
	update_icon()

/obj/item/device/mobcapsule/proc/take_contents(mob/user)
	for(var/mob/living/simple_animal/AM in src.loc)
		if(istype(AM))
			var/mob/living/simple_animal/M = AM
			var/mob/living/simple_animal/hostile/H = M
			if(!istype(H))
				continue
			for(var/things in H.friends)
				if(capsuleowner in H.friends)
					if(insert(AM, user) == -1) //Limit reached
						break
