/turf/simulated/floor/flesh
	name = "flesh"
	desc = "This slick flesh ripples and squishes under your touch"
	icon_state = "flesh-floor"
	icon = 'icons/turf/stomach_vr.dmi'

/turf/simulated/floor/flesh/colour
	name = "flesh"
	desc = "This slick flesh ripples and squishes under your touch"
	icon_state = "colorable-floor"
	icon = 'icons/turf/stomach_vr.dmi'

/turf/simulated/floor/flesh/attackby()
	return

/turf/simulated/floor/flesh/ex_act(severity)
	return

/turf/simulated/floor/ice
	name = "ice"
	icon = 'icons/turf/outdoors.dmi'
	icon_state = "ice"
	desc = "Looks slippery."

/turf/simulated/floor/ice/Entered(var/mob/living/M)
	sleep(1 * world.tick_lag)
	if(istype(M, /mob/living))
		if(M.stunned == 0)
			to_chat(M, "<span class='warning'>You slide across the ice!</span>")
		M.SetStunned(1)
		step(M,M.dir)
