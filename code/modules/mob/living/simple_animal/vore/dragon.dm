/mob/living/simple_animal/hostile/dragon
	name = "red dragon"
	desc = "Here to pillage stations and kidnap princesses, and there probably aren't any princesses."
	icon = 'icons/mob/vore64x64.dmi'
	icon_dead = "reddragon-dead"
	icon_living = "reddragon"
	icon_state = "reddragon"
	isEdible = 0

	faction = "dragon"
	maxHealth = 500 // Boss
	health = 500

	melee_damage_lower = 10
	melee_damage_upper = 60

	//Space dragons aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

//CHOMPEDIT Just an easteregg on a mob that isnt really used but still.
/mob/living/simple_animal/hostile/dragon/New()
	..()
	if(prob(1))//almost forgot this woops
		name = "Slackwyrm" //Just an itty bitty easteregg dont mind me
		desc = "A fierce dragon, well this one seems a bit more lazy. http://www.joshuawright.net/slack-wyrm-001.html" //
		//Thanks to Josh Wright, the maker of slackwyrm for allowing this easteregg to exist.


/mob/living/simple_animal/hostile/dragon/Process_Spacemove(var/check_drift = 0)
	return 1 //No drifting in space for space dragons!

/mob/living/simple_animal/hostile/dragon/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"snaps at [.]")

// Activate Noms!
/mob/living/simple_animal/hostile/dragon
	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_ignores_undigestable = 0
	vore_icons = SA_ICON_LIVING

// Why a weaker subtype?
///mob/living/simple_animal/hostile/dragon/virgo3b
//	maxHealth = 200
//	health = 200
//	faction = "virgo3b"


/mob/living/simple_animal/hostile/dragon/phoron
	name = "phoron dragon"
	desc = "A big imposing phoron dragon, it looks tough and would likely not go down without a fierce fight."
	icon_dead = "phoron_dragon_dead"
	icon_living = "phoron_dragon"
	icon_state = "phoron_dragon"
	maxHealth = 1000 // Super Boss
	health = 1000
	var/image/eye_layer = null

/mob/living/simple_animal/hostile/dragon/phoron/New(var/location, var/atom/parent)
	if(!eye_layer)
		get_light_and_color(parent)
		add_glow()
	..()

/mob/living/simple_animal/hostile/dragon/phoron/proc/add_glow()
	eye_layer = image(icon, "[icon_state]-glow")
	eye_layer.plane = PLANE_LIGHTING_ABOVE

	overlays |= eye_layer

/mob/living/simple_animal/hostile/dragon/phoron/death()
	remove_glow()
	..()

/mob/living/simple_animal/hostile/dragon/phoron/proc/remove_glow()
	overlays -= eye_layer

/mob/living/simple_animal/hostile/dragon/phoron/update_icon()
	. = ..()
	if(stat >= DEAD)
		return
	add_glow()


/mob/living/simple_animal/hostile/dragon/phoron/init_vore()
	..()

	var/obj/belly/B = vore_selected
	B.name = "Belly"
	B.desc = "The phoron dragon tackles you to the ground with a mighty roar, swiftly gobbling up your head! You feel the gravity shift as it raises it's head up in pride, bobbing you up and down as it busily swallowed around your form. You start to realise that the warm fluid that you mistook for it's saliva has a strong and somewhat familiar scent, but before you can identify it, your ride is over - with a powerful swallow, the dragon pushes the entirety of your body down into it's stomach, with more of that strange liquid pooling up on the bottom. As you push out in protest against the surrounding walls, you realise that the flesh feels squishy and sponge-like under your digits, coating them in dark, pink substance... A pleased rumble from above tells you that the dragon clearly doesn't seem to mind your futile struggles, clenching its stomach around you possessively!"

	B.emote_lists[DM_HOLD] = list(
		"The sway of the dragon's belly sloshes the purple tinted fluid around you, splashing it all over your body.",
		"You can feel a small prod from the outside as the dragon accidentally brushes his gut against a wall. The soft flesh cushions it just enough for it to be barely noticeable...",
		"You briefly get lost in thoughts as you listen to the noises the dragon's body emits... A slightly muffled snort from above that is enough for you to snap back.",
		"A sizeable paw smacks on the side of the dragon's belly, kneading into you through the thick layer of flesh while a low, ominous chuckle can be heard.",
		"A low, guttural grumble can be heard all around you as the dragon idly flumps down, bringing its weight down to smoosh you against the bottom of its gut!",
		"You can feel a faint, rythmic thumping coming off from the sides of the belly - it doesn't take long to realise that the dragon is drumming on its stuffed gut with its wings.",
		"The dragon sways its hips briefly, making its stomach - and by extension, you - sway along, letting out an ammused rumble!",
		"You can feel the stomach clench around you, briefly pushing you out towards the dragon's gullet, but before you can gather your wits, it simply swallows you back down with a taunting rumble.",
		"You sigh and idly drag your hand over the stomach walls, silently pondering your life choices. It surprises you to feel a large paw tracing your movements from outside!")

	B.emote_lists[DM_DIGEST] = list(
		"The sway of the dragon's belly sloshes the purple tinted fluid around you, splashing it all over your body.",
		"You can feel a small prod from the outside as the dragon accidentally brushes his gut against a wall. The soft flesh cushions it just enough for it to be barely noticeable...",
		"A sizeable paw smacks on the side of the dragon's belly, kneading into you through the thick layer of flesh while a low, ominous chuckle can be heard.",
		"A low, guttural grumble can be heard all around you as the dragon idly flumps down, bringing its weight down to smoosh you against the bottom of its gut!",
		"You can feel a faint, rythmic thumping coming off from the sides of the belly - it doesn't take long to realise that the dragon is drumming on its stuffed gut with its wings.",
		"The dragon sways its hips briefly, making its stomach - and by extension, you - sway along, letting out an ammused rumble!",
		"You can feel the stomach clench around you, briefly pushing you out towards the dragon's gullet, but before you can gather your wits, it simply swallows you back down with a taunting rumble.")

 //Didnt put in since it works better as active struggle messages, but not gonna write any at the moment :c
 //You struggle to push out against the surrounding flesh, but as soon as you ease up on the pressure, the dragon's gut simply pushes back to hide the bulge.
