/obj/item/weapon/gun/energy/taser
	charge_cost = 160
	fire_delay = 4

/obj/item/weapon/gun/energy/stunrevolver
	charge_cost = 400

//CHOMPEDIT: 
/obj/item/weapon/gun/energy/stunrevolver/oneshot
	desc = "A heavily modified LAEP20 Zeus. It fires a beam instead of an electrode. The massive recoil makes it only useful as a last resort weapon."
	charge_cost = 2400
	projectile_type = /obj/item/projectile/beam/stun/oneshot
	
/obj/item/weapon/gun/energy/stunrevolver/oneshot/Fire(atom/target, mob/living/user, clickparams, pointblank=0, reflex=0)
	..()
	if(iscarbon(user))
		var/mob/living/carbon/nerd = user
		var/mysize = nerd.size_multiplier 
		nerd.Weaken(3-mysize) //200% gets the knockdown micros usually get now from firing a gun. Micros get their base knockdown + this.
		nerd.adjustBruteLoss(10-mysize*4) //This means 200% = 10-8; 100% = 10-4; etc


