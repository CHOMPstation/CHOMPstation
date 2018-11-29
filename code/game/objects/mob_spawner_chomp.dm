/obj/structure/mob_spawner/scanner/mining_animals
	name = "Mining Lazy Spawner"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "wild animal"
	total_spawns = 2
	destructible = 0
	anchored = 1
	invisibility = 101
	spawn_types = list(
		/mob/living/silicon/robot/lost = 2,
		/mob/living/simple_animal/hostile/hivebot/swarm = 1,
		/mob/living/simple_animal/hostile/carp = 20,
		/mob/living/simple_animal/hostile/mimic/crate = 2,
		/mob/living/simple_animal/hostile/scarybat = 70,
		/mob/living/simple_animal/hostile/jelly = 25,
		/mob/living/simple_animal/hostile/bear = 1,
		/mob/living/simple_animal/hostile/deathclaw = 1,
		/mob/living/simple_animal/hostile/goose = 60,
		/mob/living/simple_animal/retaliate/bee = 50,
	)
