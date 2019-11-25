// Eventually we should move all the Northern Star-centric areas here so future maps can have a less polluted area list but that involves a lot of work and headaches.

// Solars are 'sticking out' from the rock and so shouldn't have rock underneath them.
/area/solar
	base_turf = /turf/space

//TFF: Add a new area for Synth Morgue we got here.
/area/rnd/synth_morgue
	name = "\improper Synthmorph Morgue"
	icon_state = "research"

//TFF: Add Dorm Atmos Area, part of Engy areas.
/area/engineering/dorm_atmos
	name = "\improper Dormitory Atmospherics"
	icon_state = "atmos"

//TFF: Add Mime/Clown areas so vines in this area don't spawn inside an inaccessible place.
/area/Mime
	name = "\improper Mime Office"

/area/Clown
	name = "\improper Clown Room"

//TFF 22/9/19 - Add new area for Mining Outpost Emergency Storage
/area/outpost/mining_main/emergency_storage
	name = "Mining Outpost Emergency Storage"

//TFF 28/9/19 - Add more areas. Again.
/area/crew_quarters/bar_backroom
	name = "Bar Backroom"
	icon_state = "bar"

/area/security/prison/bathroom
	name = "Brig Restroom"
	flags = RAD_SHIELDED

/area/prison/solitary1
	name = "Solitary Confinement 1"

/area/prison/solitary2
	name = "Solitary Confinement 2"

/area/engineering/gear_storage
	name = "\improper Engineering Gear Storage"
	icon_state = "engineering_storage"



//TFF 28/9/19 - Prevent Atmos Leak event from going into these areas.
/datum/event/atmos_leak/setup()
	excluded |= /area/gateway
	..()
