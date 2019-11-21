/obj/effect/portal/admin
	desc = "A stable looking portal. Best to test it with the clown anyways."
	failchance = 0
	var/teleport_x = 0
	var/teleport_y = 0
	var/teleport_z = 0
	// var/teleport_sparks = 1 // Causes sparks upon teleporting.
	var/teleport_innacuracy = 1 // Up to how far away they could spawn from the target. 0 for precision.
	var/removable = 0 // If the portal can be removed by a multitool.

/obj/effect/portal/admin/New(loc, lifespan=0)
	portals += src
	src.loc = loc
	if(lifespan > 0)
		spawn(lifespan)
			qdel(src)

/obj/effect/portal/admin/teleport(atom/movable/M as mob|obj)
	if(istype(M, /obj/effect))
		return
	if(M.anchored && istype(M, /obj/mecha))
		return
	if(icon_state == "portal1")
		return

	if(istype(M, /atom/movable))
		if(prob(failchance)) // Bad luck, enjoy space!
			src.icon_state = "portal1"
			do_teleport(M, locate(rand(5, world.maxx - 5), rand(5, world.maxy - 5), 3), 0)
		else
			if(teleport_x && teleport_y && teleport_z)
				do_teleport(M, locate(teleport_x, teleport_y, teleport_z), teleport_innacuracy)
			else
				to_chat(M, "<span class='warning'>The portal shimmers as you bump into it, as if it were a mirror. (Something is configured incorrectly, contact an admin!)</span>")

/obj/effect/portal/admin/attackby(obj/item/A, mob/user)
	if(!removable)
		return

	. = ..()