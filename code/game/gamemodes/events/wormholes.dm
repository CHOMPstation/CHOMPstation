/proc/wormhole_event(var/wormholeAmount = 600, var/event_duration = 3000)
	spawn()
		// Begone you disgusting fucking piece of garbage - Jon
		/*
		var/list/pick_turfs = list()
		for(var/turf/simulated/floor/T in turfs)
			if(T.z in using_map.station_levels)
				pick_turfs += T
		*/

		if(pick_turfs.len)
			//All ready. Announce that bad juju is afoot.
			command_announcement.Announce("Space-time anomalies detected on the station. There is no additional data.", "Anomaly Alert", new_sound = 'sound/AI/spanomalies.ogg')

		var/end_time = world.time + event_duration
		var/list/wormholes = list()

		// Unfortunately, this code is shit. I will not explain why but I'll give one reason. While(1)
		// I dont want to explain why I think that that fucking line is retarded. I think it's self
		// explanatory, I can write for over 2000 words explaining why no programmer should EVER do that
		// unless they want to lag the game intentionally like a douchebag. Remember this proc is being
		// called on WORLD. MEANING, IF YOU MAKE WORLD SLEEP. YOU MAKE THE SERVER SLEEP YOU DINGUS.
		// OH MY GOD WHO THE FUCK WOULD EVEN THINK OF THIS!!!
		//
		// - Jon, better code below this.

/*
			//prob(20) can be approximated to 1 wormhole every 5 turfs!
			//admittedly less random but totally worth it >_<
			var/event_duration = 3000	//~5 minutes in ticks
			var/number_of_selections = (pick_turfs.len/5)+1	//+1 to avoid division by zero!
			var/sleep_duration = round( event_duration / number_of_selections )
			var/end_time = world.time + event_duration	//the time by which the event should have ended

			var/increment =	max(1,round(number_of_selections/50))
//			world << "DEBUG: number_of_selections: [number_of_selections] | sleep_duration: [sleep_duration]"

			var/i = 1
			while( 1 )

				//we've run into overtime. End the event
				if( end_time < world.time )
//					world << "DEBUG: we've run into overtime. End the event"
					return
				if( !pick_turfs.len )
//					world << "DEBUG: we've run out of turfs to pick. End the event"
					return

				//loop it round
				i += increment
				i %= pick_turfs.len
				i++

				//get our enter and exit locations
				var/turf/simulated/floor/enter = pick_turfs[i]
				pick_turfs -= enter							//remove it from pickable turfs list
				if( !enter || !istype(enter) )	continue	//sanity

				var/turf/simulated/floor/exit = pick(pick_turfs)
				pick_turfs -= exit
				if( !exit || !istype(exit) )	continue	//sanity

				create_wormhole(enter,exit)

				sleep(sleep_duration)						//have a well deserved nap!
				*/

		// Now that we made the announcement, might as well get the wormholes spawning!
		for(var/i in 0 to wormholeAmount) // For every 0 to wormhole amount.
			var/turf/T = pick(pick_turfs) //Pick random turfs from the list we made earlier.
			wormholes += new /obj/effect/portal/worm(T, null, null, 1)// Spawn the wormhole, ITS THAT EASY?!?!

		while(wormholes.len > 0)
			if(end_time < world.time)
				wormholes.Cut() //we've run into overtime. End the event


//maybe this proc can even be used as an admin tool for teleporting players without ruining immulsions?
/proc/create_wormhole(var/turf/enter as turf, var/turf/exit as turf)
	var/obj/effect/portal/P = new /obj/effect/portal( enter )
	P.target = exit
	P.creator = null
	P.icon = 'icons/obj/objects.dmi'
	P.failchance = 0
	P.icon_state = "anom"
	P.name = "wormhole"
	spawn(rand(300,600))
		qdel(P)

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