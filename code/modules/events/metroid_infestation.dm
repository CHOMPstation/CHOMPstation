/var/global/sent_metroids_to_station = 0

/datum/event/metroid_infestation
	announceWhen	= 30
	var/spawncount = 1


/datum/event/metroid_infestation/setup()
	announceWhen = rand(announceWhen, announceWhen + 30)
	spawncount = rand(2 * severity, 4 * severity)
	sent_metroids_to_station = 0

/datum/event/metroid_infestation/announce()
	command_announcement.Announce("Unidentified high-energy lifesigns detected coming aboard [station_name()]. Repel and exterminate.", "Lifesign Alert", new_sound = 'sound/misc/alarm1.ogg')


/datum/event/metroid_infestation/start()
	var/list/vents = list()
	for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in machines)
		if(!temp_vent.welded && temp_vent.network && temp_vent.loc.z in using_map.station_levels)
			if(temp_vent.network.normal_members.len > 50)
				vents += temp_vent

	while((spawncount >= 1) && vents.len)
		var/obj/vent = pick(vents)
		new /mob/living/simple_animal/hostile/metroid/evolution/baby(vent.loc)
		vents -= vent
		spawncount--