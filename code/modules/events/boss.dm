#define LOC_ATMOS 0
#define LOC_CHAPEL 1
#define LOC_LIBRARY 2
#define LOC_GARDEN 3
#define LOC_MAINTENANCE 4
#define LOC_CONSTR 5

#define BOSS_METROID 0
#define BOSS_XENOMORPH 1
#define BOSS_CARP 2
#define BOSS_SPIDER 3
#define BOSS_CRAB 4
#define BOSS_DRAGON 5
#define BOSS_PANTHER 6
#define BOSS_MOTHER 7
#define BOSS_CHUNGUS 8

/datum/event/boss
	announceWhen = 10
	endWhen = 11
	var/location
	var/locstring
	var/boss
	var/bossstring

/datum/event/boss/start()

	location = rand(0,5)
	var/list/turf/simulated/floor/turfs = list()
	var/spawn_area_type
	switch(location)
		if(LOC_ATMOS)
			spawn_area_type = /area/engineering/atmos
			locstring = "atmospherics"
		if(LOC_CHAPEL)
			spawn_area_type = /area/chapel/main
			locstring = "the chapel"
		if(LOC_LIBRARY)
			spawn_area_type = /area/library
			locstring = "the library"
		if(LOC_GARDEN)
			spawn_area_type = /area/hydroponics/garden
			locstring = "the public garden"
		if(LOC_MAINTENANCE)
			spawn_area_type = /area/maintenance/chapel_fore
			locstring = "far northern maintenance tunnels"
		if(LOC_CONSTR)
			spawn_area_type = /area/construction
			locstring = "the construction area"

	for(var/areapath in typesof(spawn_area_type))
		var/area/A = locate(areapath)
		for(var/turf/simulated/floor/F in A.contents)
			if(turf_clear(F))
				turfs += F

	var/list/spawn_types = list()
	boss = rand(0,8)
	switch(boss)
		if(BOSS_METROID)
			spawn_types = list(/mob/living/simple_animal/hostile/metroid/combat/queen)
			bossstring = "metroid"
		if(BOSS_XENOMORPH)
			spawn_types = list(/mob/living/simple_animal/hostile/alien/queen/empress)
			bossstring = "xenomorph"
		if(BOSS_CARP)
			spawn_types = list(/mob/living/simple_animal/hostile/carp/large/huge)
			bossstring = "carp"
		if(BOSS_SPIDER)
			spawn_types = list(/mob/living/simple_animal/hostile/giant_spider/nurse/queen)
			bossstring = "spider"
		if(BOSS_CRAB)
			spawn_types = list(/mob/living/simple_animal/hostile/giant_crab)
			bossstring = "crab"
		if(BOSS_DRAGON)
			spawn_types = list(/mob/living/simple_animal/hostile/dragon)
			bossstring = "dragon"
		if(BOSS_PANTHER)
			spawn_types = list(/mob/living/simple_animal/hostile/panther)
			bossstring = "panther"
		if(BOSS_MOTHER)
			spawn_types = list(/mob/living/simple_animal/hostile/alien/queen/empress/mother)
			bossstring = "xenomorph mother"
		if(BOSS_CHUNGUS)
			spawn_types = list(/mob/living/simple_animal/hostile/chungus)
			bossstring = "chungus"

	spawn(0)
		var/num = 1
		while(turfs.len > 0 && num > 0)
			var/turf/simulated/floor/T = pick(turfs)
			turfs.Remove(T)
			num--
			var/spawn_type = pick(spawn_types)
			new spawn_type(T)


/datum/event/boss/announce()
	command_announcement.Announce("Bioscans indicate a giant enemy [bossstring] in [locstring]. Handle with extreme caution.", "Boss Fight", new_sound = 'sound/misc/alarm1.ogg')

#undef LOC_ATMOS
#undef LOC_CHAPEL
#undef LOC_LIBRARY
#undef LOC_GARDEN
#undef LOC_MAINTENANCE
#undef LOC_CONSTR

#undef BOSS_METROID
#undef BOSS_XENOMORPH
#undef BOSS_CARP
#undef BOSS_SPIDER
#undef BOSS_CRAB
#undef BOSS_DRAGON
#undef BOSS_PANTHER
#undef BOSS_MOTHER
#undef BOSS_CHUNGUS
