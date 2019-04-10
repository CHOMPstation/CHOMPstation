/obj/machinery/button
	name = "button"
	icon = 'icons/obj/objects.dmi'
	icon_state = "launcherbtt"
//	plane = TURF_PLANE //Can't have them under tables, oh well.
//	layer = ABOVE_TURF_LAYER
	desc = "A remote control switch for something."
	var/id = null
	var/active = 0
	anchored = 1.0
	use_power = 1
	idle_power_usage = 2
	active_power_usage = 4

/obj/machinery/button/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/button/attackby(obj/item/weapon/W, mob/user as mob)
	return attack_hand(user)

// VOREStation Edit Begin
/obj/machinery/button/attack_hand(obj/item/weapon/W, mob/user as mob)
	if(..()) return 1
	playsound(loc, 'sound/machines/button.ogg', 100, 1)
// VOREStation Edit End

/obj/machinery/button/emergencydoorpulse
	name = "Emergency Door override"
	desc = "A remote control for providing a short burst of power to all nearby doors and sending unbolt and open signals. Automatically recloses after 60 seconds. WARNING: System does not relock doors."
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0

/obj/machinery/button/emergencydoorpulse/attack_hand(obj/item/weapon/W, mob/user as mob)
	for(var/obj/machinery/door/airlock/door in range(5, src))
		door.unlock(1)
		sleep(10)
		door.open(1)
		spawn(600)
			door.close(1)
	
