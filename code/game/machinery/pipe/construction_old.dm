/*CONTENTS
Buildable pipes
Buildable meters
*/
#define PIPE_SIMPLE_STRAIGHT	0
#define PIPE_SIMPLE_BENT		1
#define PIPE_HE_STRAIGHT		2
#define PIPE_HE_BENT			3
#define PIPE_CONNECTOR			4
#define PIPE_MANIFOLD			5
#define PIPE_JUNCTION			6
#define PIPE_UVENT				7
#define PIPE_MVALVE				8
#define PIPE_PUMP				9
#define PIPE_SCRUBBER			10
#define PIPE_INSULATED_STRAIGHT	11
#define PIPE_INSULATED_BENT		12
#define PIPE_GAS_FILTER			13
#define PIPE_GAS_MIXER			14
#define PIPE_PASSIVE_GATE       15
#define PIPE_VOLUME_PUMP        16
#define PIPE_HEAT_EXCHANGE      17
#define PIPE_MTVALVE			18
#define PIPE_MANIFOLD4W			19
#define PIPE_CAP				20
///// Z-Level stuff
#define PIPE_UP					21
#define PIPE_DOWN				22
///// Z-Level stuff
#define PIPE_GAS_FILTER_M		23
#define PIPE_GAS_MIXER_T		24
#define PIPE_GAS_MIXER_M		25
#define PIPE_OMNI_MIXER			26
#define PIPE_OMNI_FILTER		27
///// Supply, scrubbers and universal pipes
#define PIPE_UNIVERSAL				28
#define PIPE_SUPPLY_STRAIGHT		29
#define PIPE_SUPPLY_BENT			30
#define PIPE_SCRUBBERS_STRAIGHT		31
#define PIPE_SCRUBBERS_BENT			32
#define PIPE_SUPPLY_MANIFOLD		33
#define PIPE_SCRUBBERS_MANIFOLD		34
#define PIPE_SUPPLY_MANIFOLD4W		35
#define PIPE_SCRUBBERS_MANIFOLD4W	36
#define PIPE_SUPPLY_UP				37
#define PIPE_SCRUBBERS_UP			38
#define PIPE_SUPPLY_DOWN			39
#define PIPE_SCRUBBERS_DOWN			40
#define PIPE_SUPPLY_CAP				41
#define PIPE_SCRUBBERS_CAP			42
///// Mirrored T-valve ~ because I couldn't be bothered re-sorting all of the defines
#define PIPE_MTVALVEM				43
///// Digital Valves sit here because otherwise we're resorting every define.
#define PIPE_DVALVE					44
#define PIPE_DTVALVE				45
#define PIPE_DTVALVEM				46

#define PIPE_PASSIVE_VENT			47

/obj/item/pipe
	name = "pipe"
	desc = "A pipe"
	var/pipe_type = 0
	//var/pipe_dir = 0
	var/pipename
	var/connect_types = CONNECT_TYPE_REGULAR
	force = 7
	icon = 'icons/obj/pipe-item.dmi'
	icon_state = "simple"
	item_state = "buildpipe"
	w_class = ITEMSIZE_NORMAL
	level = 2

/obj/item/pipe/New(var/loc, var/pipe_type as num, var/dir as num, var/obj/machinery/atmospherics/make_from = null)
	..()
	if (make_from)
		var/is_bent
		if  (make_from.initialize_directions in list(NORTH|SOUTH, WEST|EAST))
			is_bent = 0
		else
			is_bent = 1
		if     (istype(make_from, /obj/machinery/atmospherics/pipe/simple/heat_exchanging/junction))
			src.pipe_type = PIPE_JUNCTION
			connect_types = CONNECT_TYPE_REGULAR|CONNECT_TYPE_HE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/simple/heat_exchanging))
			src.pipe_type = PIPE_HE_STRAIGHT + is_bent
			connect_types = CONNECT_TYPE_HE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/simple/insulated))
			src.pipe_type = PIPE_INSULATED_STRAIGHT + is_bent
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/simple/visible/supply) || istype(make_from, /obj/machinery/atmospherics/pipe/simple/hidden/supply))
			src.pipe_type = PIPE_SUPPLY_STRAIGHT + is_bent
			connect_types = CONNECT_TYPE_SUPPLY
			src.color = PIPE_COLOR_BLUE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/simple/visible/scrubbers) || istype(make_from, /obj/machinery/atmospherics/pipe/simple/hidden/scrubbers))
			src.pipe_type = PIPE_SCRUBBERS_STRAIGHT + is_bent
			connect_types = CONNECT_TYPE_SCRUBBER
			src.color = PIPE_COLOR_RED
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/simple/visible/universal) || istype(make_from, /obj/machinery/atmospherics/pipe/simple/hidden/universal))
			src.pipe_type = PIPE_UNIVERSAL
			connect_types = CONNECT_TYPE_REGULAR|CONNECT_TYPE_SUPPLY|CONNECT_TYPE_SCRUBBER
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/simple))
			src.pipe_type = PIPE_SIMPLE_STRAIGHT + is_bent
		else if(istype(make_from, /obj/machinery/atmospherics/portables_connector))
			src.pipe_type = PIPE_CONNECTOR
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/manifold/visible/supply) || istype(make_from, /obj/machinery/atmospherics/pipe/manifold/hidden/supply))
			src.pipe_type = PIPE_SUPPLY_MANIFOLD
			connect_types = CONNECT_TYPE_SUPPLY
			src.color = PIPE_COLOR_BLUE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/manifold/visible/scrubbers) || istype(make_from, /obj/machinery/atmospherics/pipe/manifold/hidden/scrubbers))
			src.pipe_type = PIPE_SCRUBBERS_MANIFOLD
			connect_types = CONNECT_TYPE_SCRUBBER
			src.color = PIPE_COLOR_RED
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/manifold))
			src.pipe_type = PIPE_MANIFOLD
		else if(istype(make_from, /obj/machinery/atmospherics/unary/vent_pump))
			src.pipe_type = PIPE_UVENT
		else if(istype(make_from, /obj/machinery/atmospherics/valve/digital))
			src.pipe_type = PIPE_DVALVE
		else if(istype(make_from, /obj/machinery/atmospherics/valve))
			src.pipe_type = PIPE_MVALVE
		else if(istype(make_from, /obj/machinery/atmospherics/binary/pump/high_power))
			src.pipe_type = PIPE_VOLUME_PUMP
		else if(istype(make_from, /obj/machinery/atmospherics/binary/pump))
			src.pipe_type = PIPE_PUMP
		else if(istype(make_from, /obj/machinery/atmospherics/trinary/atmos_filter/m_filter))
			src.pipe_type = PIPE_GAS_FILTER_M
		else if(istype(make_from, /obj/machinery/atmospherics/trinary/mixer/t_mixer))
			src.pipe_type = PIPE_GAS_MIXER_T
		else if(istype(make_from, /obj/machinery/atmospherics/trinary/mixer/m_mixer))
			src.pipe_type = PIPE_GAS_MIXER_M
		else if(istype(make_from, /obj/machinery/atmospherics/trinary/atmos_filter))
			src.pipe_type = PIPE_GAS_FILTER
		else if(istype(make_from, /obj/machinery/atmospherics/trinary/mixer))
			src.pipe_type = PIPE_GAS_MIXER
		else if(istype(make_from, /obj/machinery/atmospherics/unary/vent_scrubber))
			src.pipe_type = PIPE_SCRUBBER
		else if(istype(make_from, /obj/machinery/atmospherics/binary/passive_gate))
			src.pipe_type = PIPE_PASSIVE_GATE
		else if(istype(make_from, /obj/machinery/atmospherics/unary/heat_exchanger))
			src.pipe_type = PIPE_HEAT_EXCHANGE
		else if(istype(make_from, /obj/machinery/atmospherics/tvalve/mirrored/digital))
			src.pipe_type = PIPE_DTVALVEM
		else if(istype(make_from, /obj/machinery/atmospherics/tvalve/mirrored))
			src.pipe_type = PIPE_MTVALVEM
		else if(istype(make_from, /obj/machinery/atmospherics/tvalve/digital))
			src.pipe_type = PIPE_DTVALVE
		else if(istype(make_from, /obj/machinery/atmospherics/tvalve))
			src.pipe_type = PIPE_MTVALVE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/manifold4w/visible/supply) || istype(make_from, /obj/machinery/atmospherics/pipe/manifold4w/hidden/supply))
			src.pipe_type = PIPE_SUPPLY_MANIFOLD4W
			connect_types = CONNECT_TYPE_SUPPLY
			src.color = PIPE_COLOR_BLUE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/manifold4w/visible/scrubbers) || istype(make_from, /obj/machinery/atmospherics/pipe/manifold4w/hidden/scrubbers))
			src.pipe_type = PIPE_SCRUBBERS_MANIFOLD4W
			connect_types = CONNECT_TYPE_SCRUBBER
			src.color = PIPE_COLOR_RED
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/manifold4w))
			src.pipe_type = PIPE_MANIFOLD4W
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/cap/visible/supply) || istype(make_from, /obj/machinery/atmospherics/pipe/cap/hidden/supply))
			src.pipe_type = PIPE_SUPPLY_CAP
			connect_types = CONNECT_TYPE_SUPPLY
			src.color = PIPE_COLOR_BLUE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/cap/visible/scrubbers) || istype(make_from, /obj/machinery/atmospherics/pipe/cap/hidden/scrubbers))
			src.pipe_type = PIPE_SCRUBBERS_CAP
			connect_types = CONNECT_TYPE_SCRUBBER
			src.color = PIPE_COLOR_RED
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/cap))
			src.pipe_type = PIPE_CAP
		else if(istype(make_from, /obj/machinery/atmospherics/omni/mixer))
			src.pipe_type = PIPE_OMNI_MIXER
		else if(istype(make_from, /obj/machinery/atmospherics/omni/atmos_filter))
			src.pipe_type = PIPE_OMNI_FILTER
///// Z-Level stuff
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/zpipe/up/supply))
			src.pipe_type = PIPE_SUPPLY_UP
			connect_types = CONNECT_TYPE_SUPPLY
			src.color = PIPE_COLOR_BLUE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/zpipe/up/scrubbers))
			src.pipe_type = PIPE_SCRUBBERS_UP
			connect_types = CONNECT_TYPE_SCRUBBER
			src.color = PIPE_COLOR_RED
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/zpipe/up))
			src.pipe_type = PIPE_UP
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/zpipe/down/supply))
			src.pipe_type = PIPE_SUPPLY_DOWN
			connect_types = CONNECT_TYPE_SUPPLY
			src.color = PIPE_COLOR_BLUE
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/zpipe/down/scrubbers))
			src.pipe_type = PIPE_SCRUBBERS_DOWN
			connect_types = CONNECT_TYPE_SCRUBBER
			src.color = PIPE_COLOR_RED
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/zpipe/down))
			src.pipe_type = PIPE_DOWN
///// Z-Level stuff
		else if(istype(make_from, /obj/machinery/atmospherics/pipe/vent))
			src.pipe_type = PIPE_PASSIVE_VENT
	else
		src.pipe_type = pipe_type
		src.set_dir(dir)
		if (pipe_type == 29 || pipe_type == 30 || pipe_type == 33 || pipe_type == 35 || pipe_type == 37 || pipe_type == 39 || pipe_type == 41)
			connect_types = CONNECT_TYPE_SUPPLY
			src.color = PIPE_COLOR_BLUE
		else if (pipe_type == 31 || pipe_type == 32 || pipe_type == 34 || pipe_type == 36 || pipe_type == 38 || pipe_type == 40 || pipe_type == 42)
			connect_types = CONNECT_TYPE_SCRUBBER
			src.color = PIPE_COLOR_RED
		else if (pipe_type == 2 || pipe_type == 3)
			connect_types = CONNECT_TYPE_HE
		else if (pipe_type == 6)
			connect_types = CONNECT_TYPE_REGULAR|CONNECT_TYPE_HE
		else if (pipe_type == 28)
			connect_types = CONNECT_TYPE_REGULAR|CONNECT_TYPE_SUPPLY|CONNECT_TYPE_SCRUBBER
	//src.pipe_dir = get_pipe_dir()
	update()
	src.pixel_x = rand(-5, 5)
	src.pixel_y = rand(-5, 5)

/obj/item/pipe/attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)

	var/pipe_dir = get_pipe_dir()

	for(var/obj/machinery/atmospherics/M in src.loc)
		if((M.initialize_directions & pipe_dir) && M.check_connect_types_construction(M,src))	// matches at least one direction on either type of pipe & same connection type
			user << "<span class='warning'>There is already a pipe of the same type at this location.</span>"
			return 1
	// no conflicts found

	var/pipefailtext = "<span class='warning'>There's nothing to connect this pipe section to!</span>" //(with how the pipe code works, at least one end needs to be connected to something, otherwise the game deletes the segment)"

	//TODO: Move all of this stuff into the various pipe constructors.
	switch(pipe_type)
		if(PIPE_SIMPLE_STRAIGHT, PIPE_SIMPLE_BENT)
		if(PIPE_SUPPLY_STRAIGHT, PIPE_SUPPLY_BENT)
		if(PIPE_SCRUBBERS_STRAIGHT, PIPE_SCRUBBERS_BENT)
		if(PIPE_UNIVERSAL)
		if(PIPE_HE_STRAIGHT, PIPE_HE_BENT)
		if(PIPE_CONNECTOR)		// connector
		if(PIPE_MANIFOLD)		//manifold
		if(PIPE_SUPPLY_MANIFOLD)		//manifold
		if(PIPE_SCRUBBERS_MANIFOLD)		//manifold
		if(PIPE_MANIFOLD4W)		//4-way manifold
		if(PIPE_SUPPLY_MANIFOLD4W)		//4-way manifold
		if(PIPE_SCRUBBERS_MANIFOLD4W)		//4-way manifold
		if(PIPE_JUNCTION)
		if(PIPE_UVENT)		//unary vent
		if(PIPE_MVALVE)		//manual valve
		if(PIPE_PUMP)		//gas pump
		if(PIPE_GAS_FILTER)		//gas filter
		if(PIPE_GAS_MIXER)		//gas mixer
		if(PIPE_GAS_FILTER_M)		//gas filter mirrored
		if(PIPE_GAS_MIXER_T)		//gas mixer-t
		if(PIPE_GAS_MIXER_M)		//gas mixer mirrored
		if(PIPE_SCRUBBER)		//scrubber
		if(PIPE_INSULATED_STRAIGHT, PIPE_INSULATED_BENT)
		if(PIPE_MTVALVE)		//manual t-valve
		if(PIPE_MTVALVEM)		//manual t-valve
		if(PIPE_CAP)
		if(PIPE_SUPPLY_CAP)
		if(PIPE_SCRUBBERS_CAP)
		if(PIPE_PASSIVE_GATE)		//passive gate
		if(PIPE_VOLUME_PUMP)		//volume pump
		if(PIPE_HEAT_EXCHANGE)		// heat exchanger
		if(PIPE_DVALVE)		//digital valve
		if(PIPE_DTVALVE)		//digital t-valve
		if(PIPE_DTVALVEM)		//mirrored digital t-valve
		if(PIPE_UP)
		if(PIPE_DOWN)
		if(PIPE_SUPPLY_UP)
		if(PIPE_SUPPLY_DOWN)
		if(PIPE_SCRUBBERS_UP)
		if(PIPE_SCRUBBERS_DOWN)
		if(PIPE_OMNI_MIXER)
		if(PIPE_OMNI_FILTER)
		if(PIPE_PASSIVE_VENT)
	return

/obj/item/pipe_meter
	name = "meter"
	desc = "A meter that can be laid on pipes"
	icon = 'icons/obj/pipe-item.dmi'
	icon_state = "meter"
	item_state = "buildpipe"
	w_class = ITEMSIZE_LARGE

/obj/item/pipe_meter/attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
	..()

	if (!istype(W, /obj/item/weapon/wrench))
		return ..()
	if(!locate(/obj/machinery/atmospherics/pipe, src.loc))
		user << "<span class='warning'>You need to fasten it to a pipe</span>"
		return 1
	new/obj/machinery/meter( src.loc )
	playsound(src, W.usesound, 50, 1)
	user << "<span class='notice'>You have fastened the meter to the pipe</span>"
	qdel(src)
//not sure why these are necessary
#undef PIPE_SIMPLE_STRAIGHT
#undef PIPE_SIMPLE_BENT
#undef PIPE_HE_STRAIGHT
#undef PIPE_HE_BENT
#undef PIPE_CONNECTOR
#undef PIPE_MANIFOLD
#undef PIPE_JUNCTION
#undef PIPE_UVENT
#undef PIPE_MVALVE
#undef PIPE_PUMP
#undef PIPE_SCRUBBER
#undef PIPE_INSULATED_STRAIGHT
#undef PIPE_INSULATED_BENT
#undef PIPE_GAS_FILTER
#undef PIPE_GAS_MIXER
#undef PIPE_PASSIVE_GATE
#undef PIPE_VOLUME_PUMP
#undef PIPE_OUTLET_INJECT
#undef PIPE_MTVALVE
#undef PIPE_MTVALVEM
#undef PIPE_GAS_FILTER_M
#undef PIPE_GAS_MIXER_T
#undef PIPE_GAS_MIXER_M
#undef PIPE_SUPPLY_STRAIGHT
#undef PIPE_SUPPLY_BENT
#undef PIPE_SCRUBBERS_STRAIGHT
#undef PIPE_SCRUBBERS_BENT
#undef PIPE_SUPPLY_MANIFOLD
#undef PIPE_SCRUBBERS_MANIFOLD
#undef PIPE_UNIVERSAL
//#undef PIPE_MANIFOLD4W
