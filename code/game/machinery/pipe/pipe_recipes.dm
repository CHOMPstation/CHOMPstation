//
// Recipies for Pipe Dispenser and (someday) the RPD
//

var/global/list/atmos_pipe_recipes = null

/hook/startup/proc/init_pipe_recipes()
	global.atmos_pipe_recipes = list(
		"Pipes" = list(
			new /datum/pipe_info/pipe("Pipe",				/obj/machinery/atmospherics/pipe/simple),
			new /datum/pipe_info/pipe("Manifold",			/obj/machinery/atmospherics/pipe/manifold),
			new /datum/pipe_info/pipe("Manual Valve",		/obj/machinery/atmospherics/valve),
			new /datum/pipe_info/pipe("Digital Valve",		/obj/machinery/atmospherics/valve/digital),
			new /datum/pipe_info/pipe("Pipe cap",			/obj/machinery/atmospherics/pipe/cap),
			new /datum/pipe_info/pipe("4-Way Manifold",		/obj/machinery/atmospherics/pipe/manifold4w),
			new /datum/pipe_info/pipe("Manual T-Valve",		/obj/machinery/atmospherics/tvalve),
			new /datum/pipe_info/pipe("Digital T-Valve",	/obj/machinery/atmospherics/tvalve/digital),
			new /datum/pipe_info/pipe("Upward Pipe",		/obj/machinery/atmospherics/pipe/zpipe/up),
			new /datum/pipe_info/pipe("Downward Pipe",		/obj/machinery/atmospherics/pipe/zpipe/down),
			new /datum/pipe_info/pipe("Universal Pipe Adaptor",	/obj/machinery/atmospherics/pipe/simple/visible/universal),
		),
		"Devices" = list(
			new /datum/pipe_info/pipe("Connector",			/obj/machinery/atmospherics/portables_connector),
			new /datum/pipe_info/pipe("Unary Vent",			/obj/machinery/atmospherics/unary/vent_pump),
			new /datum/pipe_info/pipe("Passive Vent",		/obj/machinery/atmospherics/pipe/vent),
			new /datum/pipe_info/pipe("Injector",			/obj/machinery/atmospherics/unary/outlet_injector),
			new /datum/pipe_info/pipe("Gas Pump",			/obj/machinery/atmospherics/binary/pump),
			new /datum/pipe_info/pipe("Pressure Regulator",	/obj/machinery/atmospherics/binary/passive_gate),
			new /datum/pipe_info/pipe("High Power Gas Pump",/obj/machinery/atmospherics/binary/pump/high_power),
			new /datum/pipe_info/pipe("Scrubber",			/obj/machinery/atmospherics/unary/vent_scrubber),
			new /datum/pipe_info/meter("Meter"),
			new /datum/pipe_info/pipe("Gas Filter",			/obj/machinery/atmospherics/trinary/atmos_filter),
			new /datum/pipe_info/pipe("Gas Mixer",			/obj/machinery/atmospherics/trinary/mixer),
			new /datum/pipe_info/pipe("Gas Mixer 'T'",		/obj/machinery/atmospherics/trinary/mixer/t_mixer),
			new /datum/pipe_info/pipe("Omni Gas Mixer",		/obj/machinery/atmospherics/omni/mixer),
			new /datum/pipe_info/pipe("Omni Gas Filter",	/obj/machinery/atmospherics/omni/atmos_filter),
		),
		"Heat Exchange" = list(
			new /datum/pipe_info/pipe("Pipe",				/obj/machinery/atmospherics/pipe/simple/heat_exchanging),
			new /datum/pipe_info/pipe("Junction",			/obj/machinery/atmospherics/pipe/simple/heat_exchanging/junction),
			new /datum/pipe_info/pipe("Heat Exchanger",		/obj/machinery/atmospherics/unary/heat_exchanger),
		),
		"Insulated pipes" = list(
			new /datum/pipe_info/pipe("Pipe",				/obj/machinery/atmospherics/pipe/simple/insulated),
		)
	)
	return TRUE

//
// New method of handling pipe construction.  Instead of numeric constants and a giant switch statement of doom
// 	every pipe type has a datum instance which describes its name, placement rules and construction method, dispensing etc.
// The advantages are obvious, mostly in simplifying the code of the dispenser, and the ability to add new pipes without hassle.
//
/datum/pipe_info
	var/name = "Abstract Pipe (fixme)"
	var/obj/item/pipe/pipe_type // This is the type PATH to the type of pipe we will construct
	var/dirtype = PIPE_BENDABLE // Class of possible connection types

// Render an HTML link to select this pipe type
/datum/pipe_info/proc/Render(dispenser)
	var/dat = "<A href='?src=\ref[dispenser]&[Params()]'>[name]</A><BR>"
	// Stationary pipe dispensers don't allow you to pre-select pipe directions.
	// This makes it impossble to spawn bent versions of bendable pipes.
	// We add a "Bent" pipe type with a preset diagonal direction to work around it.
	if(istype(dispenser, /obj/machinery/pipedispenser) && (dirtype == PIPE_BENDABLE || dirtype == /obj/item/pipe/binary/bendable))
		dat += "<A href='?src=\ref[dispenser]&[Params()]&dir=[NORTHEAST]'>Bent [name]</A><BR>"
	return dat

/datum/pipe_info/proc/Params()
	return ""

// Subtype for actual pipes
/datum/pipe_info/pipe/New(label, obj/machinery/atmospherics/path)
	name = label
	pipe_type = path
	var/obj/item/pipe/c = initial(path.construction_type)
	dirtype = initial(c.RPD_type)

/datum/pipe_info/pipe/Params()
	return "makepipe=[pipe_type]"

// Subtype for meters
/datum/pipe_info/meter
	//icon_state = "meterX"
	dirtype = PIPE_ONEDIR

/datum/pipe_info/meter/New(label)
	name = label

/datum/pipe_info/meter/Params()
	return "makemeter=1"
