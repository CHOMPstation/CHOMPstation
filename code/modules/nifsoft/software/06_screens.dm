//TFF: Ports monitors for NIFs from VOREStation. Adding notes for what does what.

/datum/nifsoft/crewmonitor //TFF: Medical access - like with AR-M glasses, allows one to keep track of who needs medical help.
	name = "Crew Monitor"
	desc = "A link to the local crew monitor sensors. Useful for finding people in trouble."
	list_pos = NIF_MEDMONITOR
	access = access_medical
	cost = 1250
	p_drain = 0.025
	var/datum/nano_module/crew_monitor/arscreen

	New()
		..()
		arscreen = new(nif)

	Destroy()
		qdel_null(arscreen)
		return ..()

	activate()
		if((. = ..()))
			arscreen.ui_interact(nif.human,"main",null,1,nif_state)
			return TRUE

	deactivate()
		if((. = ..()))
			return TRUE

	stat_text()
		return "Show Monitor"

/datum/nifsoft/alarmmonitor //TFF: Monitor for station alarms - Engy access
	name = "Alarm Monitor"
	desc = "A link to the local alarm monitors. Useful for detecting alarms in a pinch."
	list_pos = NIF_ENGMONITOR
	access = access_engine
	cost = 1250
	p_drain = 0.025
	var/datum/nano_module/alarm_monitor/engineering/arscreen

	New()
		..()
		arscreen = new(nif)

	Destroy()
		qdel_null(arscreen)
		return ..()

	activate()
		if((. = ..()))
			arscreen.ui_interact(nif.human,"main",null,1,nif_state)
			return TRUE

	deactivate()
		if((. = ..()))
			return TRUE

	stat_text()
		return "Show Monitor"

/datum/nifsoft/cameramonitor //TFF: Sec access - Alarm Monitor, Sec version, allows Sec to see if there's a busted camera or motion where there shouldn't be motion.
	name = "Security Monitor"
	desc = "A link to the local camera alarm monitors. Useful for knowing where the trouble is."
	list_pos = NIF_SECMONITOR
	access = access_security
	cost = 1250
	p_drain = 0.025
	var/datum/nano_module/alarm_monitor/security/arscreen

	New()
		..()
		arscreen = new(nif)

	Destroy()
		qdel_null(arscreen)
		return ..()

	activate()
		if((. = ..()))
			arscreen.ui_interact(nif.human,"main",null,1,nif_state)
			return TRUE

	deactivate()
		if((. = ..()))
			return TRUE

	stat_text()
		return "Show Monitor"
