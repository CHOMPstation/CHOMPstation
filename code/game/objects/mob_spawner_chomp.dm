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
		/mob/living/simple_animal/hostile/deathclaw/minor = 1,
		/mob/living/simple_animal/hostile/goose = 60,
		/mob/living/simple_animal/retaliate/bee = 50,
		/mob/living/simple_animal/hostile/metroid/mine = 20,
	)

/obj/structure/mob_spawner/scanner/mining_animals/do_spawn(var/mob_path)
	if(!ispath(mob_path))
		return 0
	var/mob/living/L = new mob_path(get_turf(src))
	if (ispath(L, /mob/living/simple_animal))
		L/simple_animal.vore_escape_time = 15 SECONDS // Mob vore nerf!
	L.source_spawner = src
	spawned_mobs.Add(L)
	last_spawn = world.time
	if(total_spawns > 0)
		total_spawns--
	if(mob_faction)
		L.faction = mob_faction
	return L
