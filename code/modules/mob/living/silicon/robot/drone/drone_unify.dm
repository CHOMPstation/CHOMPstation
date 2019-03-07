//Multi purpose DRONE TYPE DM
//CONTENTS: DRONE actual drones. DRONE modules. DRONE laws. DRONE roundstart info. DRONE items.DRONE Fabricators. DRONE Procs.
//Formatting: Indents= Tab; Tabspacing = 8; Do not use space indenting in this file. -Shark

//Instead of doing a clean rewrite of drone Code we'll be making our own subtype of drones
//Then we'll strip drone of things we dont want every drone to have, drone/unify is basically our new main object to work with.
//In the future we'll have things like drone/unify/dronetype
//Also the fact that im writing this should show my annoyance at how spread drone code is, that's why I'm trying to collect it all here now.

////////////////////////////////////////
//DRONE TYPES //TODO: extract clown egg: https://github.com/tgstation/tgstation/blob/master/icons/mob/robots.dmi
////////////////////////////////////////
/mob/living/silicon/robot/drone/unify //Hello world~
	name = "drone"
	real_name = "drone"
	icon = 'icons/mob/robots.dmi'
	
	law_type = /datum/ai_laws/drone
	module_type = /obj/item/weapon/robot_module/drone
	
	hat_x_offset = 0	//This is the base X offset for hats of the normal drone// X= Horizontal
	hat_y_offset = -13	//This is the base Y offset for hats of the normal drone// Y = Vertical
	
	holder_type = /obj/item/weapon/holder/drone
	//var/selected_icon = null //Can be compared to "Wideborg" will tell us in the future if we ar eusing non standardized icon.
////////////////////////////////////////
//DRONE MODULES
////////////////////////////////////////
/obj/item/weapon/robot_module/drone/unify
	//yup this is nothing for now until we build more drone versions

////////////////////////////////////////
//DRONE LAWS
////////////////////////////////////////
//TODO: Remake drone laws, Add subroutine clause "If no maintenance are active nor maintenance crew your duties include maintenance"
//TODO: Unify Drone law system, might be impossible due to how the ..() are structured may need to look into how to add additional laws if add_inherent fails.

////////////////////////////////////////
//DRONE HELLO WORLD
////////////////////////////////////////
//TODO: Rewrite all hello worlds to be more accurate to our lore. Make Drone spawntext more lore heavy in general
/mob/living/silicon/robot/drone/unify/welcome_drone()
	src << "<b>You are a Unified Drone Module, an autonomous maintenance and fabrication system.</b>."
	src << "You are assigned to a Sol Central maintenance project. The name is irrelevant. Your task is to complete maintenance and subsystem integration as soon as possible."
	src << "Use <b>:d</b> to talk to other drones and <b>say</b> to speak silently to your nearby fellows."
	src << "<b>You do not follow orders from anyone; not the AI, not humans, and not other synthetics.</b>."


////////////////////////////////////////
//DRONE ITEMS (mostly mods of other items)
////////////////////////////////////////
//TODO: Move Advanced soap here.

////////////////////////////////////////
//DRONE FABRICATOR, ONE FOR ALL SYSTEM.
////////////////////////////////////////
//TODO: Actually write this
/obj/machinery/drone_fabricator/unify
	name = "Unified Drone Module fabricator"
	fabricator_tag = "Prototype UNIFY Fabricator"
	desc = "A large automated factory for producing Unified Drone Modules."
	drone_type = null //Gonna try to set this later
	var/global/list/possible_drones = list("UNIFY Module" = /obj/item/weapon/robot_module/drone/unify,
	"Construction Module" = /mob/living/silicon/robot/drone/construction,)


////////////////////////////////////////
//DRONE PROCS
////////////////////////////////////////
//Drone Drone Procs
/mob/living/silicon/robot/drone/unify/New()
	..()
	possible_chassis +=  "PROTOTYPE" = "miningdrone" 
	//This list populates the drone sprite selection, Left side is Displayed names, Right side is icon_state names.
	//TODO: Find someone willing to sell their soul to actively document the PX offset for each of these for hatcode

/mob/living/silicon/robot/drone/unify/updatename()
	real_name = "Unified Drone Module ([rand(100,999)])" //UDMs, sounds kinda nice, maybe call them this Lore wise?
	name = real_name

//Fabricator procs
/obj/machinery/drone_fabricator/unify/create_drone(var/client/player)
	choose_dronetype()//code for dronetypes goes here
	..()

/obj/machinery/drone_fabricator//proc/choose_dronetype()
	var/choice
	choice = input(usr,"What module would you like to use?") as null|anything in possible_drones
	if(!choice) return
	drone_type = possible_drones[choice]
