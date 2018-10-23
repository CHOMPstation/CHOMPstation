//GLOBAL_LIST_BOILERPLATE(all_portals, /obj/effect/portal)
// No fucking idea what this proc does but it doesn't seem to
// help when we need to refere to the global portals list.

var/global/list/portals = list()					// Just a list for portals <3


/obj/effect/portal
	name = "portal"
	desc = "Looks unstable. Best to test it with the clown."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "portal"
	density = 1
	unacidable = 1//Can't destroy energy portals.
	var/failchance = 5
	var/obj/item/target = null
	var/creator = null
	anchored = 1.0

/obj/effect/portal/Bumped(mob/M as mob|obj)
//	spawn(0)
//		src.teleport(M)
//		return
//	return
	teleport(M)

/obj/effect/portal/Crossed(AM as mob|obj)
//	spawn(0)
//		src.teleport(AM)
//		return
//	return
	teleport(AM)

/obj/effect/portal/attack_hand(mob/user as mob)
//	spawn(0)
//		src.teleport(user)
//		return
//	return
	teleport(user)

/obj/effect/portal/New(loc, turf/target, creator=null, lifespan=300)
	//I'm actually concerned with the ammount of spaghet on my plate today. - Jon
//	spawn(300)
//		qdel(src)
//		return
//	return
	portals += src
	src.loc = loc
	src.target = target
	src.creator = creator
	if(lifespan > 0)
		spawn(lifespan)
			qdel(src)

/obj/effect/portal/Destroy()
	portals -= src
	return ..()

/obj/effect/portal/proc/teleport(atom/movable/M as mob|obj)
	if(istype(M, /obj/effect)) //sparks don't teleport
		return
	if (M.anchored&&istype(M, /obj/mecha))
		return
	if (icon_state == "portal1")
		return
	if (!( target ))
		qdel(src)
		return
	if (istype(M, /atom/movable))
		if(prob(failchance)) //oh dear a problem, put em in deep space
			src.icon_state = "portal1"
			do_teleport(M, locate(rand(5, world.maxx - 5), rand(5, world.maxy -5), 3), 0)
		else
			do_teleport(M, target, 1) ///You will appear adjacent to the beacon

// New addition to remove portals via multitools like on codebases like Paradise. - Jon
/obj/effect/portal/attackby(obj/item/A, mob/user)
	if(istype(A, /obj/item/device/multitool))
		qdel(src)


