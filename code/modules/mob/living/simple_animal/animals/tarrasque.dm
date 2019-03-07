/mob/living/simple_animal/hostile/tarrasque
	//icon = bigboygains.dmi
	
	//temporarily gonna use Deathclaw
	icon = 'icons/mob/vore64x64.dmi'
	icon_dead = "deathclaw-dead"
	icon_living = "deathclaw"
	icon_state = "deathclaw"
	size_multiplier = 2
	
	isEdible = 0
	name = "T'rasq"
	desc = "The most dreaded monster. Its purpose is to devour the worlds 1 waking cycle at a time, all it knows is, eat, sleep, repeat."
	health = 1000
	maxHealth = 1000
	
	tt_desc = "Embodiment of Destruction" //Let's avoid Actually labeling these as "Tarrasque" by species, going for a more mythological kinda thing, does this even exyst?
	
	//icon_living = "tarrasque"
	//icon_dead = "" //This wont be needed since one does not simply kill a tarrasque.
	
	//Mob talking settings
	//Rawr rorr, mrawr~!
	//maybe later.

	//Mob movement settings
	wander = 1
	wander_distance = 100
	returns_home = 1
	turns_per_move = 15
	follow_dist = 200
	speed = 20
	
	//Mob interaction
	response_help   = "Sacrifices self to"
	response_harm   = "Weakly flails at"
	harm_intent_damage = 0
	
	//Mob environment settings
	minbodytemp = 0
	maxbodytemp = 100000
	heat_damage_per_tick = 0
	cold_damage_per_tick = 0
	min_oxy = 0
	max_tox = 0
	max_co2 = 0
	unsuitable_atoms_damage = 0

	//Hostility settings
	view_range = 28 //HE knows when you're awake, and also when you sleep, he butchers all of your best friends and churns them to gains
	investigates = 1 //Clever girl
	attack_same = 1 //There can only be one
	grab_resist = 100 //It's a collosal creature... you arent just grabbing that...
	taser_kill = 0 //It's lethals or nothing

	//Melee settings
	melee_damage_lower = 10 //huh not so bad
	melee_damage_upper = 45 //oh, oh no
	attacktext = list("bites","claws","slashes")
	environment_smash = 1000 //It's made for destroying things
	melee_miss_chance = 0
	melee_attack_minDelay = 5
	melee_attack_maxDelay = 30
	attack_armor_pen = 20
	attack_sharp = 1

	//Attack movement settings
	move_to_delay = 20
	destroy_surroundings = 1

	//Damage resistances
	shock_resistance = 1
	resistance = 75

/mob/living/simple_animal/hostile/tarrasque/death()
	..()
	visible_message("<span class='notice'>\The [src] is annoyed with your continued resistance and burrows into the ground!</span>")
	var/scale = /obj/item/clothing/accessory/medal/tarrasque
	new scale(location)
	new scale(location)
	new scale(location)
	new scale(location)
	new scale(location)
	new scale(location)
	qdel(src)

/obj/item/clothing/accessory/medal/tarrasque //IF we ever to make a siege event with this, this will be a permanent medal to win for people that survived
	name = "Scale medal"
	desc = "A T'rasq scale fashioned into a medal."
	icon_state = "bronze" //to be sprited "scale"
	
