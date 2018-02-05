//
// Controller handling icon updates of open space turfs
//

/turf/Entered(atom/movable/AM)
	. = ..()
	if(SSopen_space.initialized && !AM.invisibility && isobj(AM))
		var/turf/T = GetAbove(src)
		if(isopenspace(T))
			// log_debug("[T] ([T.x],[T.y],[T.z]) queued for update for [src].Entered([AM])")
			SSopen_space.add_turf(T, 1)

/turf/Exited(atom/movable/AM)
	. = ..()
	if(SSopen_space.initialized && !AM.invisibility && isobj(AM))
		var/turf/T = GetAbove(src)
		if(isopenspace(T))
			// log_debug("[T] ([T.x],[T.y],[T.z]) queued for update for [src].Exited([AM])")
			SSopen_space.add_turf(T, 1)

/obj/update_icon()
	. = ..()
	if(SSopen_space.initialized && !invisibility && isturf(loc))
		var/turf/T = GetAbove(src)
		if(isopenspace(T))
			// log_debug("[T] ([T.x],[T.y],[T.z]) queued for update for [src].update_icon()")
			SSopen_space.add_turf(T, 1)

// Ouch... this is painful. But is there any other way?
/* - No for now
/obj/New()
	. = ..()
	if(SSopen_space.initialized && !invisibility)
		var/turf/T = GetAbove(src)
		if(isopenspace(T))
			// log_debug("[T] ([T.x],[T.y],[T.z]) queued for update for [src]New()")
			SSopen_space.add_turf(T, 1)
*/

// Just as New() we probably should hook Destroy() If we can think of something more efficient, lets hear it.
/obj/Destroy()
	if(SSopen_space.initialized && !invisibility && isturf(loc))
		var/turf/T = GetAbove(src)
		if(isopenspace(T))
			SSopen_space.add_turf(T, 1)
	. = ..() // Important that this be at the bottom, or we will have been moved to nullspace.
