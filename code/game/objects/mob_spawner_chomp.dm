/obj/structure/mob_spawner/scanner/mining_animals
	name = "Mining Lazy Spawner"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = -1
	destructible = 0
	anchored = 1
	invisibility = 101
	spawn_types = list(
		/mob/living/silicon/robot/lost = 10,
		/mob/living/simple_animal/hostile/hivebot/swarm = 1,
		/mob/living/simple_animal/hostile/carp = 5,
		/mob/living/simple_animal/hostile/mimic/crate = 1,
		/mob/living/simple_animal/hostile/scarybat = 10,
		/mob/living/simple_animal/hostile/bear = 2,
		/mob/living/simple_animal/hostile/goose = 10,
		/mob/living/simple_animal/retaliate/bee = 10,
	)