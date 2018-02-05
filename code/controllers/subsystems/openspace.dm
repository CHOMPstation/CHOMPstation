//
// Controller handling icon updates of open space turfs
//

var/global/image/over_OS_darkness = image('icons/turf/open_space.dmi', "black_open")

SUBSYSTEM_DEF(open_space)
	name = "Open Space"
	priority = 5
	init_order = INIT_OPEN_SPACE
	var/list/turfs_to_process = list()		// List of turfs queued for update.
	var/list/turfs_to_process_old = null	// List of turfs currently being updated.
	var/static/initialized = FALSE

/datum/controller/subsystem/open_space/Initialize()
	wait = world.tick_lag // every tick
	over_OS_darkness.plane = OVER_OPENSPACE_PLANE
	over_OS_darkness.layer = MOB_LAYER
	initialize_open_space()
	. = ..()

/datum/controller/subsystem/open_space/fire(resumed = 0)
	if(!resumed)
		// We use a different list so any additions to the update lists during a delay from scheck()
		// don't cause things to be cut from the list without being updated.
		turfs_to_process_old = turfs_to_process
		turfs_to_process = list()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.turfs_to_process_old
	while(currentrun.len)
		var/turf/T = currentrun[currentrun.len]
		currentrun.len--
		update_turf(T)
		if (MC_TICK_CHECK)
			return

/datum/controller/subsystem/open_space/proc/update_turf(var/turf/T)
	for(var/atom/movable/A in T)
		A.fall()
	T.update_icon()

/datum/controller/subsystem/open_space/proc/add_turf(var/turf/T, var/recursive = FALSE)
	ASSERT(isturf(T))
	turfs_to_process += T
	if(recursive)
		var/turf/above = GetAbove(T)
		if(above && isopenspace(above))
			add_turf(above, recursive)

// Queue the initial updates of open space turfs when the game starts.
/datum/controller/subsystem/open_space/proc/initialize_open_space()
	// Do initial setup from bottom to top.
	for(var/zlevel = 1 to world.maxz)
		for(var/turf/simulated/open/T in block(locate(1, 1, zlevel), locate(world.maxx, world.maxy, zlevel)))
			add_turf(T)
		CHECK_TICK
	initialized = TRUE
