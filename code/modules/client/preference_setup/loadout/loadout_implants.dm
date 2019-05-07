//TFF 29/4/19: Add implants category, includes reagent implanters


/datum/gear/implant
	display_name = "implant, tracking"
	path = /obj/item/weapon/implant/tracking/weak
	cost = 0 //VOREStation Edit. Changed cost to 0
	slot = "implant"
	exploitable = 1
	sort_category = "Implants"

/* VOREStation Edit - Make languages great again
/datum/gear/utility/implant/eal //This does nothing if you don't actually know EAL.
	display_name = "implant, language, EAL"
	path = /obj/item/weapon/implant/language/eal
	cost = 2
	slot = "implant"
	exploitable = 1*/

//Reagent implants - cost of 2 to reduce chance of abuse
//TFF 7/5/19 - bugfix for implanters appearing inside of chars rather than their bag. Switches to being the implant instead.
/datum/gear/implant/reagent_generator
	display_name = "implant, milk production"
	path = /obj/item/weapon/implant/reagent_generator/milk
	exploitable = 0
	cost = 2

/datum/gear/implant/reagent_generator/egg
	display_name = "implant, egg production"
	path = /obj/item/weapon/implant/reagent_generator/egg
