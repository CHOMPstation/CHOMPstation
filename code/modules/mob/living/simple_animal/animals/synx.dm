/mob/living/simple_animal/retaliate/synx
	name = "Synx"
	desc = "A cold blooded, genderless, parasitic eel from the more distant and stranger areas of the cosmos. Plain, white, perpetually grinning and possessing a hunger as enthusiastic and endless as humanity's sense of exploration."
	tt_desc = "synxus pergulus"

	 //Synx species belongs to ChimeraSynx , Base sprites by: SpitefulCrow
	icon = 'icons/mob/synx.dmi'//giving synxes their own DMI file!
	icon_state = "synx_living"
	icon_living = "synx_living"
	icon_dead = "synx_dead"

	//VAR$ SETUP
	var/poison_per_bite = 5
	var/poison_chance = 99.666
	var/poison_type = "synxchem"//inaprovalin, but evil
	var/transformed_state = "synx_transformed"
	var/transformed = FALSE
	var/memorysize = 50 //Var for how many messages synxes remember if they know speechcode

	faction = "Synx"
	intelligence_level = SA_ANIMAL

	maxHealth = 150
	health = 150
	turns_per_move = 5 //Should just affect how often it wanders, subject to change.
	speed = -2 //Re enabled custom speed
	see_in_dark = 6
	stop_when_pulled = 0
	armor = list(			// will be determined
				"melee" = 20,
				"bullet" = 0,
				"laser" = 0,
				"energy" = 0,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	has_hands = 1

	response_help  = "pets"
	response_disarm = "gently pushes aside"


	pass_flags = PASSTABLE

	melee_damage_lower = 5 //Massive damage reduction, will be balanced with toxin injection
	melee_damage_upper = 5
	attack_armor_pen = 40			// How much armor pen this attack has.
	attack_sharp = 1
	attack_edge = 1

//Vore stuff
	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 50
	vore_bump_chance = 10
	vore_bump_emote = "Slowly wraps its tongue around, and slides its drooling maw over the head of"
	vore_standing_too = 1 //I believe this lets it vore standing people, rather than only resting.
	vore_ignores_undigestable = 0 //Synx don't care if you digest or not, you squirm fine either way.
	vore_default_mode = DM_HOLD
	vore_digest_chance = 45		// Chance to switch to digest mode if resisted
	vore_absorb_chance = 0
	vore_escape_chance = 10
	vore_icons = 0 //no vore icons
	swallowTime = 6 SECONDS //Enter the eel you nerd

/mob/living/simple_animal/retaliate/synx/init_vore()
	..()
	var/obj/belly/B = vore_selected
	//B.human_prey_swallow_time = 6 SECONDS //doesnt work
	//B.nonhuman_prey_swallow_time = 3 SECONDS //doesnt work
	B.vore_verb = "swallow"
	B.name = "stomach"
	B.desc	= "You're pulled into the snug stomach of the synx. The walls knead weakly around you, coating you in thick, viscous fluids that cling to your body, that soon starts to tingle and burn..."
	B.digest_burn = 1
	B.digest_brute = 0
	B.emote_lists[DM_HOLD] = list(
	"The walls churn around you, soaking you in thick, smelling fluid as you're kneaded and rolled about in the surprisingly roomy, but still snug, space.",
	"The unusually cool stomach rolls around you slowly and lazily, trying to almost knead you to sleep gently as the synx pulses around you.",
	"The thick, viscous fluids cling to your body soaking in deep, giving you a full bath with the kneading of the walls helping to make sure you'll be smelling like synx stomach for days."
	)
	B.emote_lists[DM_DIGEST] = list(
	"The stomach kneads roughly around you, squishing and molding to your shape, with the thick fluids clinging to your body and tingling, making it hard to breathe.",
	"Firm churns of the stomach roll and knead you around, your body tingling as fur sizzles all around you, your body getting nice and tenderized for the stomach.",
	"Your body tingles and the air smells strongly of acid, as the stomach churns around you firmly and slowly, eager to break you down.",
	"You're jostled in the stomach as the synx lets out what can only described as an alien belch, the space around you getting even more snug as the thick acids rise further up your body."
	)
	B.digest_messages_prey = list(
	"Your eyes grow heavy as the air grows thin in the stomach, the burning of the acids slowly putting you into a final slumber, adding you to the synx's hips and tail.",
	"Slowly, the stinging and burning of the acids, and the constant churning is just too much, and with a few final clenches, your body is broken down into fuel for the synx.",
	"The acids and fluids rise up above your head, quickly putting an end to your squirming and conciousness.. the stomach eager to break you down completely.",
	"The synx lets out an audible belch, the last of your air going with it, and with a few audible crunches from the outside, the stomach claims you as food for the parasite."
	)

//Shouldn't be affected by lack of atmos, it's a space eel.
	min_oxy = 0
	max_oxy = 0 //Maybe add a max
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0 //Maybe add a max
	min_n2 = 0
	max_n2 = 0 //Maybe add a max
	minbodytemp = 0
	// TODO: Set a max temperature of about 20-30 above room temperatures. Synx don't like the heat.


//    to be added
/*	speak_chance = 2
	speak = list()
	speak_emote = list()
	emote_hear = list()
	emote_see = list()
	*/

/mob/living/simple_animal/retaliate/synx/New()
    ..()
    verbs |= /mob/living/proc/ventcrawl
    verbs |= /mob/living/simple_animal/proc/contort
    verbs +=  /mob/living/simple_animal/retaliate/synx/proc/disguise

mob/living/simple_animal/synx/PunchTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "bites [target_mob]") ) )

	var/damage = rand(melee_damage_lower, melee_damage_upper)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_TORSO, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), H.get_armor_soak(affecting, "melee"), sharp=1, edge=1)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L
	else
		..()

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// PASSIVE POWERS!!!! /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
/mob/living/simple_animal/retaliate/synx/DoPunch(var/atom/A)
	. = ..()
	if(.) // If we succeeded in hitting.
		if(isliving(A))
			var/mob/living/L = A
			if(L.reagents)
				var/target_zone = pick(BP_TORSO,BP_TORSO,BP_TORSO,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
				if(L.can_inject(src, null, target_zone))
					L.reagents.add_reagent(poison_type, poison_per_bite)
					if(prob(poison_chance))
						to_chat(L, "<span class='warning'>You feel a strange substance on you.</span>")
						L.reagents.add_reagent(poison_type, poison_per_bite)


//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// POWERS!!!! /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

/mob/living/simple_animal/proc/contort()
	set name = "contort"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities"

	if(stat == DEAD || paralysis || weakened || stunned || restrained())
		return

	if(status_flags & HIDING)
		status_flags &= ~HIDING
		reset_plane_and_layer()
		to_chat(src,"<span class='notice'>You have stopped hiding.</span>")
		speed = -3
	else
		status_flags |= HIDING
		layer = HIDING_LAYER //Just above cables with their 2.44
		plane = OBJ_PLANE
		to_chat(src,"<span class='notice'>You are now hiding.</span>")
		speed = 2

/mob/living/simple_animal/retaliate/synx/proc/disguise()
	set name = "Toggle Form"
	set desc = "Switch between amorphous and humanoid forms."
	set category = "Abilities"

	if(stat == DEAD || paralysis || weakened || stunned || restrained())
		return

	// If transform isn't true
	if(!transformed)
		to_chat(src,"<span class='warning'>you changed back into your disguise.</span>")
		icon_living = transformed_state //Switch state to transformed state
	else // If transformed is true.
		to_chat(src,"<span class='warning'>now they see your true form.</span>")
		icon_living = initial(icon_living) //Switch state to what it was originally defined.


	transformed = !transformed
	update_icons()


////////////////////////////////////////
////////////////PET VERSION/////////////
////////////////////////////////////////
/mob/living/simple_animal/retaliate/synx/pet


	faction = "Cargonia" //Should not share a faction with those pesky non station synxes.//This is so newspaper has a failchance
	name = "Prototype pet synx"
	desc = "if you see this tell a a dev"
	tt_desc = "synxus pergulus"
	glow_range = 4
	glow_toggle = 1
	player_msg = "You aren't supposed to be in this. Wrong mob."
/mob/living/simple_animal/retaliate/synx/pet/init_vore()
    ..()
    var/obj/belly/B = vore_selected
    B.vore_verb = "swallow"
    B.digest_burn = 1
    B.digest_brute = 0

/mob/living/simple_animal/retaliate/synx/pet
	speak_chance = 1.0666
	speak = list()

//PET speechcode, simplistic but more than enough for the PET
/mob/living/simple_animal/retaliate/synx/pet/hear_say(message)
	. = ..()
	if(!message)    return
	if(resting)
		resting = !resting
	if(message=="Up up down down left right left right b a select start")//shhh no spoilers yet
		icon_state = "synx_pet_rainbow"
		icon_living = "synx_pet_rainbow"
		playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 1)
		return
	if(message=="Shock on"||"shock on")//Voice activated collar//new
		anchored=1 //Shocked nerd
		return//dont want the synx to start shocking itself
	if(message=="shock off"||"Shock off")//new
		anchored=0
		return
	if(message)
		if(speak.len>=memorysize)
			speak -= (pick(speak))//making the list more dynamic
	speak += message
	return


//Hardcoded pets
/mob/living/simple_animal/retaliate/synx/pet/holo
	//var/HOLO_LIVING = "synx_hardlight_living"
	//var/HOLO_DEAD = "synx_hardlight_shards"
	name = "Hardlight synx"
	desc = "A cold blooded, genderless, space eel.. or a hologram of one. Guess the current synx are undergoing re-training? Either way this one is probably infinitely more friendly.. and less deadly."
	icon_state = "synx_hardlight_living"
	icon_living = "synx_hardlight_living"
	icon_dead = "synx_hardlight_shards"
	icon_gib = null
	alpha = 127
	faction = "Station"//Can be safely bapped with newspaper.
	melee_damage_lower = 0 //Holos do no damage
	melee_damage_upper = 0
	environment_smash = 0
	destroy_surroundings = 0
	//Vore Section
	vore_capacity = 2
	vore_digest_chance = 0    //Holos cannot digest
	vore_pounce_chance = 90 //Shouldn't fight
	vore_bump_chance = 1 //lowered bump chance
	vore_escape_chance = 30 //Much higher escape chance.. it's a hologram.
	swallowTime = 10 SECONDS //Much more time to run

/mob/living/simple_animal/retaliate/synx/pet/holo/New()
	set_light(2, 2, "#00FFFF") //hologram lighting


/mob/living/simple_animal/retaliate/synx/pet/greed
	//var/GREED_LIVING = "synx_greed_living"
	//var/GREED_DEAD = "synx_greed_dead"
	name = "Greed"
	desc = "A cold blooded, genderless, parasitic eel from the more distant and stranger areas of the cosmos. Plain, white, perpetually grinning and possessing a hunger as enthusiastic and endless as humanity's sense of exploration.. This one has the name Greed burnt into its back, the burnt in name seems to be luminescent making it harder for it to blend into the dark."
	//icon= //icon= would just set what DMI we are using, we already have our special one set.
	icon_state = "synx_greed_living"
	icon_living = "synx_greed_living"
	icon_dead = "synx_greed_dead"
	speak = list("Who is there?")//preset unique words Greed remembers, to be defined more
	player_msg = "You Hunger."
	health = 100//Slightly lower health due to being damaged permanently.
	speak_chance = 5
	//Vore Section
	vore_capacity = 4 //What a fat noodle.
	vore_digest_chance = 1	//Multivore but lower digest chance
	vore_pounce_chance = 90 //Fighting is effort, engulf them whole.
	vore_bump_chance = 2 //lowered bump chance
	vore_escape_chance = 5 //Multivore allows for people to shove eachother out so lower normal escape chance.

/mob/living/simple_animal/retaliate/synx/pet/grins
	//var/GRINS_LIVING = "synx_grins_living"
	//var/GRINS_DEAD = "synx_grins_dead"
	name = "Grins"
	desc = "A cold blooded, genderless, parasitic eel from the more distant and stranger areas of the cosmos. Plain, white, perpetually grinning and possessing a hunger as enthusiastic and endless as humanity's sense of exploration.. This one has a small shock collar on it that reads 'Grins' with a bell that doesn't seem to work."
	icon_state = "synx_grins_living"
	icon_living = "synx_grins_living"
	icon_dead = "synx_grins_dead"
	speak = list("What are you?", "Strange.", "Let me out!", "No, you." ) //custom favorite messages
	emote_hear = list("gurgles.","screams!", "glrks.")
	emote_see = list("stares intently", "pulses slowly", "stretches its jaws", "flops")
	player_msg = "You want to watch, learn... and eat..."
	//Vore Section
	vore_capacity = 2 //Might lower to 1

//SPAWNING
/obj/random/mob/synx
	name = "This is synxes"

/obj/random/mob/synx/item_to_spawn()
	return pick(prob(50);/mob/living/simple_animal/retaliate/synx/pet/greed,
		prob(50);/mob/living/simple_animal/retaliate/synx/pet/grins,
		prob(1);/mob/living/simple_animal/retaliate/synx/pet/holo,)
