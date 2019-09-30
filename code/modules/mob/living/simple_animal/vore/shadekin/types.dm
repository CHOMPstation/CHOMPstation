/////////////////////////////////////////////////////////////////CHOMPEDIT Custom shadekin mini tutorial
//Proto shadekin; AKA; Basic how to make your own shadekin; -Shark

//Step 1; sprites;
//File for body = icons/mob/vore_shadekin.dmi
//File for tail = icons/mob/vore_shadekin64.dmi
//Sprites can be either made inside of DM or you can use a Program of your choice and save the files as PNG and then import them
//If you need help learning how to use DMs interface to import/export sprites and make states you can always ask in the discord.

//Step 2; Code
//Now this depends on what type of eye colour you want
//For a red we use
///mob/living/simple_animal/shadekin/red
//then we simply add our shadekins name at the end (unless its used already)
/mob/living/simple_animal/shadekin/red/proto
	name ="Proto"
	//This here will be our shadekins name

	desc = "An invisible entity not meant for use."
	//here goes a lil tidbit people can see when examining the shadekin. Multiple lines works just as on the vore part

	icon_state = "proto"
	//this will most likely also be your shadekins name, it corresponds to the name you gave the tail and body state in the DMIs
	//so if you named the body state "proto" and "proto-1" then icon_state should be called "proto"

	vore_stomach_flavor = "You stared into the void,\
	the void decided you look tasty,\
	now you are in the void, pretty wet"
	//This is what people see when they drop into your gut! the backslashes at the end of the sentence indicate the next text will be on its own line!


	player_msg = "Proto is you, Proto shouldn't exist"
	//This message pops up when you are put into your shadekin
	//I recommend you use it as a way to remind yourself of how you want to act generally as your shadekin.

//Step 3; PR
// Assuming you already have a Fork of chompstation, make sure you got your files in order
// and then simply make a new pull request to our github.

//Now once you pushed the new DMIs with your added sprites to our github.
//And you finished writing this code section for your shadekin and pushed that too. You are done.
//If this is your first time I recommend getting someone to look over your work.

/////////////////////////////////////////////////////////////////CHOMPEDIT END

/////////////////////////////////////////////////////////////////
/mob/living/simple_animal/shadekin/red
	name = "red-eyed shadekin"
	eye_state = RED_EYES
	hostile = TRUE
	retaliate = TRUE
	stop_when_pulled = FALSE
	destroy_surroundings = TRUE
	armor = list(
			"melee" = 30,
			"bullet" = 20,
			"laser" = 20,
			"energy" = 50,
			"bomb" = 10,
			"bio" = 100,
			"rad" = 100)

	eye_desc = "red eyes"

	vore_stomach_flavor = "You slip passed pointy triangle teeth and down the slick, \
	slippery gullet of the creature. It's warm, and the air is thick. You can hear \
	its body squelch and shift around you as you settle into its stomach! Thick digestive \
	enzymes cling to you within that dark space, tingling and stinging immediately! The weight of \
	the doughy walls press in around you instantly, churning you up as you begin to digest!"

	player_msg = "You hunt for energy to fuel yourself, not minding in the least \
	if you strip it off unsuspecting prey. You're stronger than other shadekin, faster, and more capable in \
	a brawl, but you barely generate any of your own energy. You can stand in a dark spot to gather scraps \
	of energy in a pinch, but otherwise need to take it, by force if necessary."

/mob/living/simple_animal/shadekin/red/white
	icon_state = "white"
/mob/living/simple_animal/shadekin/red/dark
	icon_state = "dark"
/mob/living/simple_animal/shadekin/red/brown
	icon_state = "brown"

/////////////////////////////////////////////////////////////////
/mob/living/simple_animal/shadekin/blue
	name = "blue-eyed shadekin"
	eye_state = BLUE_EYES
	health = 100
	hostile = FALSE
	retaliate = FALSE
	stop_when_pulled = TRUE
	specific_targets = TRUE //For finding injured people
	destroy_surroundings = FALSE
	vore_default_mode = DM_HEAL
	vore_escape_chance = 75
	vore_standing_too = 1
	vore_pounce_chance = 100
	swallowTime = 4 SECONDS //A little longer to compensate for the above
	vore_ignores_undigestable = FALSE
	attacktext = list("shoved")
	armor = list(
			"melee" = 5,
			"bullet" = 5,
			"laser" = 5,
			"energy" = 5,
			"bomb" = 0,
			"bio" = 100,
			"rad" = 100)

	eye_desc = "blue eyes"
	shy_approach = TRUE
	stalker = TRUE
	vore_stomach_flavor = "You slip passed pointy triangle teeth and down the slick, \
	slippery gullet of the creature. It's warm, and the air is thick. You can hear its body \
	squelch and shift around you as you settle into its stomach! It's oddly calm, and very dark. \
	The doughy flesh rolls across your form in gentle waves. The aches and pains across your form slowly begin to \
	diminish, your body is healing much faster than normal! You’re also soon soaked in harmless slime."

	player_msg = "You've chosen to generate your own energy rather than taking \
	it from others. Most of the time, anyway. You don't have a need to steal energy from others, and gather it up \
	without doing so, albeit slowly. Dark and light are irrelevant to you, they are just different places to explore and \
	discover new things and new people."

/mob/living/simple_animal/shadekin/blue/white
	icon_state = "white"
/mob/living/simple_animal/shadekin/blue/dark
	icon_state = "dark"
/mob/living/simple_animal/shadekin/blue/brown
	icon_state = "brown"

/////////////////////////////////////////////////////////////////
/mob/living/simple_animal/shadekin/purple
	name = "purple-eyed shadekin"
	eye_state = PURPLE_EYES
	health = 150
	hostile = FALSE
	retaliate = TRUE
	stop_when_pulled = FALSE
	destroy_surroundings = TRUE
	vore_default_mode = DM_HOLD
	vore_digest_chance = 25
	vore_absorb_chance = 25
	armor = list(
		"melee" = 15,
		"bullet" = 15,
		"laser" = 15,
		"energy" = 15,
		"bomb" = 15,
		"bio" = 100,
		"rad" = 100)

	eye_desc = "purple eyes"
	shy_approach = TRUE
	stalker = TRUE
	vore_stomach_flavor = "You slip passed pointy triangle teeth and down the slick, slippery gullet of the creature. \
	It's warm, and the air is thick. You can hear its body squelch and shift around you as you settle into its stomach! \
	It’s relatively calm inside the dark organ. Wet and almost molten for how gooey your surroundings feel. \
	You can feel the doughy walls cling to you posessively... It’s almost like you could sink into them. \
	There is also an ominous gurgling from somewhere nearby..."

	player_msg = "You're familiar with generating your own energy, but occasionally \
	steal it from others when it suits you. You generate energy at a moderate pace in dark areas, and staying in well-lit \
	areas is taxing on your energy. You can harvest energy from others in a fight, but since you don't need to, you may \
	just choose to simply not fight."

/mob/living/simple_animal/shadekin/purple/white
	icon_state = "white"
/mob/living/simple_animal/shadekin/purple/dark
	icon_state = "dark"
/mob/living/simple_animal/shadekin/purple/brown
	icon_state = "brown"

/////////////////////////////////////////////////////////////////
/mob/living/simple_animal/shadekin/yellow
	name = "yellow-eyed shadekin"
	eye_state = YELLOW_EYES
	health = 100
	hostile = FALSE
	retaliate = TRUE
	stop_when_pulled = FALSE
	destroy_surroundings = TRUE
	vore_default_mode = DM_DRAIN
	vore_digest_chance = 5
	vore_ignores_undigestable = FALSE
	armor = list(
		"melee" = 5,
		"bullet" = 5,
		"laser" = 5,
		"energy" = 5,
		"bomb" = 0,
		"bio" = 100,
		"rad" = 100)

	eye_desc = "yellow eyes"
	stalker = FALSE
	vore_stomach_flavor = "You slip passed pointy triangle teeth and down the slick, slippery gullet \
	of the creature. It's warm, and the air is thick. You can hear its body squelch and shift around you \
	as you settle into its stomach! The doughy walls within cling to you heavily, churning down on you, wearing \
	you out!! There doesn’t appear to be any actual danger here, harmless slime clings to you, but it’s getting \
	harder and harder to move as those walls press in on you insistently!"

	player_msg = "Your kind rarely ventures into realspace. Being in any well-lit \
	area is very taxing on you, but you gain energy extremely fast in any very dark area. You're weaker than other \
	shadekin, but your fast energy generation in the dark allows you to phase shift more often."

/mob/living/simple_animal/shadekin/yellow/white
	icon_state = "white"
/mob/living/simple_animal/shadekin/yellow/dark
	icon_state = "dark"
/mob/living/simple_animal/shadekin/yellow/brown
	icon_state = "brown"

/////////////////////////////////////////////////////////////////
/mob/living/simple_animal/shadekin/green
	name = "green-eyed shadekin"
	eye_state = GREEN_EYES
	health = 125
	hostile = FALSE
	retaliate = TRUE
	stop_when_pulled = FALSE
	destroy_surroundings = TRUE
	vore_default_mode = DM_DRAIN
	vore_digest_chance = 0
	vore_ignores_undigestable = FALSE
	armor = list(
		"melee" = 5,
		"bullet" = 5,
		"laser" = 5,
		"energy" = 5,
		"bomb" = 0,
		"bio" = 100,
		"rad" = 100)

	eye_desc = "green eyes"
	stalker = TRUE
	vore_stomach_flavor = "You slip passed pointy triangle teeth and down the slick, slippery gullet \
	of the creature. It's warm, and the air is thick. You can hear its body squelch and shift around you \
	as you settle into its stomach! The doughy walls within cling to you heavily, churning down on you, wearing \
	you out!! There doesn’t appear to be any actual danger here, harmless slime clings to you, but it’s getting \
	harder and harder to move as those walls press in on you insistently!"

	player_msg = "Your kind rarely ventures into realspace. Being in any well-lit area is very taxing on you, but you \
	have more experience than your yellow-eyed cousins. You gain energy decently fast in any very dark area. You're weaker than other \
	shadekin, but your slight energy generation constnatly, and especially in the dark allows for a good mix of uses."

/mob/living/simple_animal/shadekin/green/white
	icon_state = "white"
/mob/living/simple_animal/shadekin/green/dark
	icon_state = "dark"
/mob/living/simple_animal/shadekin/green/brown
	icon_state = "brown"

/////////////////////////////////////////////////////////////////
/mob/living/simple_animal/shadekin/orange
	name = "orange-eyed shadekin"
	eye_state = ORANGE_EYES
	health = 175
	hostile = TRUE
	retaliate = TRUE
	stop_when_pulled = FALSE
	destroy_surroundings = TRUE
	armor = list(
			"melee" = 20,
			"bullet" = 15,
			"laser" = 15,
			"energy" = 25,
			"bomb" = 10,
			"bio" = 100,
			"rad" = 100)

	eye_desc = "orange eyes"

	vore_stomach_flavor = "You slip passed pointy triangle teeth and down the slick, \
	slippery gullet of the creature. It's warm, and the air is thick. You can hear \
	its body squelch and shift around you as you settle into its stomach! Thick digestive \
	enzymes cling to you within that dark space, tingling and stinging immediately! The weight of \
	the doughy walls press in around you instantly, churning you up as you begin to digest!"

	player_msg = "You usually hunt for energy to fuel yourself, though not as often as your red-eyed cousins. \
	You're stronger than most shadekin, faster, and more capable in a brawl, but you don't generate much of your own energy. \
	You can stand in a dark spot to gather some energy, but otherwise need to take it, by force if necessary."

/mob/living/simple_animal/shadekin/orange/white
	icon_state = "white"
/mob/living/simple_animal/shadekin/orange/dark
	icon_state = "dark"
/mob/living/simple_animal/shadekin/orange/brown
	icon_state = "brown"

/////////////////////////////////////////////////////////////////
//Fluffy specific fluffer
/mob/living/simple_animal/shadekin/blue/rivyr
	name = "Rivyr"
	desc = "She appears to be a fluffer of some sort. Deep blue eyes and curious attitude."
	icon_state = "rivyr"
	eye_desc = "deep blue eyes"
	vore_stomach_flavor = "Blue flesh gleams in the fading light as you slip down the little mar’s gullet! \
	Gooey flesh and heat surrounds your form as you’re tucked away into the darkness of her stomach! Thick slimes cling \
	to you, but they seem to be harmless. The organ gently churns around you, clinging to your shape and forcing \
	you to curl up a bit. You can feel her rub at you some through the layers of flesh and fluff, while aches \
	and pains begin to fade away across your body."
	player_msg = "Mar? Mar mar. Mar mar mar. Mar. Mar mar? Mar! Mar. Marrrr."

//thanks john
/mob/living/simple_animal/shadekin/blue/niko
	name = "Niko"
	desc = "They appear to be a Neko of some sort, containing Glowing yellow eyes and cattitude."
	icon_state = "niko"
	eye_desc = "yellow eyes"
	vore_stomach_flavor = "Look, if you had one shot, one opportunity. To seize everything you ever wanted. One moment. Would you capture it or just let it slip?"
	player_msg = "You are NOT a cat, your objective is to... wait this is the wrong game."
	glow_range = 5
	glow_toggle = 1
	luminosity = 5
	energy_adminbuse = 1
	hostile = "FALSE"
	retaliate = "FALSE"
	eye_state = 0
	attacktext = list("clawed")

/mob/living/simple_animal/shadekin/blue/luna
	name = "Luna"
	desc = "She appears to be a fuzzy critter of some sort. Her eyes shimmer a dark blue, glancing around curiously."
	icon_state = "luna"
	eye_desc = "blue eyes"
	vore_stomach_flavor = "Dark blue flesh fills your vision as you slip past the Shadekin's tongue and into the darkness \
	of her gullet. The flesh around you seems squishy and pliable and malleable to say the least, warmth rolling up \
	your body as the humid air rises across the deeper you slide into the darkness of her stomach. As you splash \
	inside, you curl up comfortably inside the walls that churn and squeeze around you, any fidgeting quickly \
	subdued by the strength of the walls, and any movement of your predator seems to coax a light sway from \
	your current prison. The slime inside stuck fairly well, though harmless - your aches and pains slowly soothing \
	up and fading away."
	player_msg = "You are a shadekin that goes by the name of Luna. Curious, you have tasked yourself and yourself alone \
	with studying this foreign world. Learn their language. Learn their culture. Adapt. Everything is wonderful and new, \
	and your mind is set on retaining knowledge of these odd planescape."

//"All your chickens are belong to me!" - Zylas
/mob/living/simple_animal/shadekin/purple/zylas
	name ="Zylas"
	desc = "He's a chubby looking creature, black and grey fur accompanied by purple eyes and a large hoody."
	icon_state = "zylashoody"
	eye_desc = "purple eyes"
	vore_stomach_flavor = "You are trapped in a cramped tight space. The color purple seems to dominate your vision. \
	His walls rolled over your form as you lay trapped in his depths. There wasnt a drop of fluid in sight inside that	\
	stomach. Instead, you could feel your energy slowly draining away over time, like... he was leeching off you."
	player_msg = "You are Zylas. You enjoy scaring the local population and eating every chicken you find."

//"Two scarves. No more, No Less." -Muninn
/mob/living/simple_animal/shadekin/blue/muninn
	name ="Muninn"
	desc = "A gray furred shadekin, a little on the hefty side. Rocks two scarves, one on the neck, one on the tail. \
	He seems eager to take in the various sights and sounds of the station"
	icon_state = "muninn"
	eye_desc = "blue eyes"
	vore_stomach_flavor = "You're stuck in a warm, tight stomach. \
	A blue glow, as soft as the walls surrounding you, illuminates the cramped chamber. \
	Muninn's walls gently squeeze over your form, like a tight, yet comfortable hug. \
	The gut itself was relatively dry, only slightly damp. \
	As Muninn ambles along, you'd gently sway within. It's quite the nice place to stay for a while."
	player_msg = "You are Muninn. Today you feel... Curious."

//"Here's a little lesson in the trickeries" -Muninn
/mob/living/simple_animal/shadekin/purple/muninn
	name ="Muninn"
	desc = "A gray furred shadekin, a little on the hefty side. Rocks two scarves, one on the neck, one on the tail.\
	He seems a little mischevious... better keep an eye on him."
	icon_state = "muninn"
	eye_desc = "purple eyes"
	vore_stomach_flavor = "You're stuck in a warm, tight stomach. \
	A purple glow, as soft as the walls surrounding you, illuminates the cramped chamber. \
	Muninn's walls gently squeeze over your form, like a tight hug. \
	The gut itself was relatively dry, only slightly damp.  \
	It didn't seem that Muninn was digesting you. More like... sapping your energy and making you feel tired. \
	A nap in this comfortable chamber wouldn't be the worst thing, would it?"
	player_msg = "You are Muninn. Today you feel... Mischevious."

//"Hunger." - Rakshasa
/mob/living/simple_animal/shadekin/red/rakshasa
	name ="Rakshasa"
	desc = "A scary, black shadekin. Thier body oozes whatever goop they are made of.\
	He seems a little mischevious... better keep an eye on him."
	icon_state = "rakshasa"
	eye_desc = "red eyes"
	eye_state = "RED_EYES"
	vore_stomach_flavor = "You're floating in a warm, viscous goop, too dark to see. \
	Your efforts to find light have failed. Darkness consumes you. \
	Rakshasa's gelatenous body squeezes over your form, leaving no inch unmolested. \
	The hot goop you float in makes it hard to breathe; all consuming of space and light.  \
	Your body feels hot, growing weaker, more tired. Draining. Darkness coming. \
	You struggle to stay awake while floating helplessly in the goo."
	player_msg = "You are Rakshasa. You are not to directly harm crew, only consume. You never speak a language."
	energy_adminbuse = 1
	maxHealth = 999999999999
	health = 999999999999
	eye_icon_state = "e_rakshasa"

//Whealty's shadekin anno!
/mob/living/simple_animal/shadekin/purple/anno
	name ="Anno"
	desc = "A white furred shadekin with a chubby form. His ears seem to be close to even in length and his snout seems longer than the usual.\
	He seems energetic and playful."
	icon_state = "anno"
	eye_desc = "purple eyes"
	vore_stomach_flavor = "You're stuck in a warm, tight stomach. \
	A purple glow, as soft as the walls surrounding you, illuminates the cramped chamber. \
	Anno's stomach walls squeeze and hug over your form somewhat tightly. \
	The gut itself was wetish and slightly slick.  \
	The gut seemed somewhat inviting with the warmth and softness, yet there was an ominous feeling to it with all the noises it made.\
	You'll probably be safe in here. Probably."
	player_msg = "You are Anno, you are energetic and playful"

/mob/living/simple_animal/shadekin/blue/roti
	name ="Roti"
	desc = "Roti is a shadekin with blue eyes, is chubby since he has eaten others before hand. He enjoys chocolate, the taste of it, the smell of it, he just wants anything sweet and chocolately to be in his belly. So be careful around him this is also a way to summon him by laying around chocolate and calling him out."
	icon_state = "roti"
	eye_desc = "blue eyes"
	vore_stomach_flavor = "You stare into Roti's maw as he moves it towards your head, putting it in and tasting your sweet delicious chocolately flavor. \
	Wet saliva covers your head as he pushes you inward, gulping down your head and shoulders into his pulsating throat. It pulses and eases you downward towards your destination \
	cramming your torso into his maw and taking wet SCHLURP, GLUK, to get it down and up to your waist. Roti continues to taste you all over wanting that succulent flavor \
	to himself. Another loud wet swallow and down goes your waist into his hungry maw, lifting up the legs high into the sky while allowing gravity and his gulps \
	to send you packing away into his chubby gut that now expands to fit you inside of the wet chamber. At least you were safe for now that is."
	player_msg = "You are Roti, a curious shadekin that wishes to learn from the station and eventually speak with them."