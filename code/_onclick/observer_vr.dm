/obj/item/device/paicard/attack_ghost(mob/user as mob)
	if(src.pai != null) //Have a person in them already?
		user.examinate(src)
		return
	var/choice = input(user, "Are you sure you want to inhabit this PAI?") in list("Yes", "No")
	if(choice == "No")
		return
	var/pai_name = input(user, "Choose your character's name", "Character Name") as text|null
	var/actual_pai_name = sanitize_name(pai_name)
	var/pai_key
	if (isnull(pai_name) || pai_name == "")
		return

	var/turf/location = get_turf(src)
	var/obj/item/device/paicard/card = new(location)
	var/mob/living/silicon/pai/pai = new(card)
	qdel(src)

	var/import_flavor = input(user, "Import general flavor text from your currently selected character?") in list("Yes", "No")
	if(import_flavor == "Yes" && user.client)
		pai.flavor_text = user.client.prefs.flavor_texts["general"]
	pai_key = user.key
	pai.key = pai_key
	card.setPersonality(pai)
	pai.SetName(actual_pai_name)