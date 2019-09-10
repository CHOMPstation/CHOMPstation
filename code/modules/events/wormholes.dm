/datum/event/wormholes
	startWhen	= 0
	endWhen		= 80

	var/list/pick_turfs = list()
	var/list/wormholes = list()
	var/shift_frequency = 3
	var/number_of_wormholes = 400


/datum/event/wormholes/setup()
	endWhen = rand(40, 80)

/datum/event/wormholes/start()
	for(var/turf/simulated/floor/T in turfs)
		if(T.z in using_map.station_levels)
			pick_turfs += T

	for(var/i in 1 to number_of_wormholes)
		var/turf/T = pick(pick_turfs)
		wormholes += new /obj/effect/portal/worm(T, null, null, -1)

/datum/event/wormholes/tick()
	if(activeFor % shift_frequency == 0)
		for(var/obj/effect/portal/worm/O in wormholes)
			var/turf/T = pick(pick_turfs)
			if(T)	O.loc = T

/datum/event/wormholes/end()
	for(var/obj/effect/portal/worm/O in wormholes)
		qdel(O)
	command_announcement.Announce("There are no more space-time anomalies detected on the station.", "Anomaly Alert")




/obj/effect/portal/worm
	name = "wormhole"
	icon_state = "anom"
	icon = 'icons/obj/objects.dmi'
	desc = "It looks highly unstable; It could close at any moment."
	failchance = 0

/obj/effect/portal/worm/attack_hand(mob/user)
	teleport(user)

/obj/effect/portal/worm/attackby(obj/item/I, mob/user, params)
	teleport(user)

/obj/effect/portal/worm/teleport(atom/movable/M)
	if(istype(M, /mob/observer))
		return
	if(istype(M, /obj/effect))	//sparks don't teleport
		return
	if(M.anchored && istype(M, /obj/mecha))
		return

	if(istype(M, /atom/movable))
		var/turf/target
		if(portals.len)
			var/obj/effect/portal/P = pick(portals)
			if(P && isturf(P.loc))
				target = P.loc
		if(!target)	return
		do_teleport(M, target, 1, 1, 0, 0) ///You will appear adjacent to the beacon