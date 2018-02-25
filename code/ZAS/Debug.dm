var/image/assigned = image('icons/Testing/Zone.dmi', icon_state = "assigned")
var/image/created = image('icons/Testing/Zone.dmi', icon_state = "created")
var/image/merged = image('icons/Testing/Zone.dmi', icon_state = "merged")
var/image/invalid_zone = image('icons/Testing/Zone.dmi', icon_state = "invalid")
var/image/air_blocked = image('icons/Testing/Zone.dmi', icon_state = "block")
var/image/zone_blocked = image('icons/Testing/Zone.dmi', icon_state = "zoneblock")
var/image/blocked = image('icons/Testing/Zone.dmi', icon_state = "fullblock")
var/image/mark = image('icons/Testing/Zone.dmi', icon_state = "mark")

/connection_edge/var/dbg_out = 0

/turf/var/tmp/dbg_img
/turf/proc/dbg(image/img, d = 0)
	if(d > 0) img.dir = d
	overlays -= dbg_img
	overlays += img
	dbg_img = img

proc/soft_assert(thing,fail)
	if(!thing) message_admins(fail)




/obj/tattletale
	name = "Default Name"
	New(loc, name)
		..()
		if(!isnull(name))
			src.name = name
		world.log << "Tattletale [src] New()ing"
	initialize(mapload)
		. = ..()
		world.log << "Tattletale [src] initialize([mapload])"

proc/typeof(var/var_value)
	if(isnull(var_value))
		. = "*null*"
	else if (isnum(var_value))
		. = "VV_NUM"
	else if (istext(var_value))
		if (findtext(var_value, "\n"))
			. = "VV_MESSAGE"
		else
			. = "VV_TEXT"
	else if (isicon(var_value))
		. = "VV_ICON"
	else if (ismob(var_value))
		. = "VV_MOB_REFERENCE"
	else if (istype(var_value, /image))
		. = "VV_IMAGE"
	else if (isloc(var_value))
		. = "VV_ATOM_REFERENCE"
	else if (istype(var_value, /client))
		. = "VV_CLIENT"
	else if (istype(var_value, /datum))
		. = "VV_DATUM_REFERENCE"
	else if (ispath(var_value))
		if (ispath(var_value, /atom))
			. = "VV_ATOM_TYPE"
		else if (ispath(var_value, /datum))
			. = "VV_DATUM_TYPE"
		else
			. = "VV_TYPE"
	else if (islist(var_value))
		. = "VV_LIST"
	else if (isfile(var_value))
		. = "VV_FILE"
	else
		. = "????"
