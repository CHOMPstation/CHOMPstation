//
// These two variables need to be defined for all atmos machines so it knows how to make the pipe item
// These values ought to be in the right files along with the rest of the atmos machine definitions of course.
// But for the sake of testing I have put them all here for easy working.
//

/obj/machinery/atmospherics
	var/construction_type // Type path of the pipe item.
	var/pipe_state // icon_state as a pipe item

// Pipes
/obj/machinery/atmospherics/pipe
	pipe_flags = 0 // Does not have PIPING_DEFAULT_LAYER_ONLY flag

/obj/machinery/atmospherics/pipe/simple
	pipe_state = "simple"
	construction_type = /obj/item/pipe/binary/bendable
	pipe_flags = PIPING_CARDINAL_AUTONORMALIZE
/obj/machinery/atmospherics/pipe/manifold
	pipe_state = "manifold"
	construction_type = /obj/item/pipe/trinary
/obj/machinery/atmospherics/pipe/manifold4w
	pipe_state = "manifold4w"
	construction_type = /obj/item/pipe/quaternary
/obj/machinery/atmospherics/pipe/cap
	pipe_state = "cap"
	construction_type = /obj/item/pipe/directional
/obj/machinery/atmospherics/pipe/simple/visible/universal
	pipe_state = "universal"
	construction_type = /obj/item/pipe/binary
	pipe_flags = PIPING_ALL_LAYER|PIPING_CARDINAL_AUTONORMALIZE

/obj/machinery/atmospherics/pipe/zpipe
	pipe_state = "cap"
	construction_type = /obj/item/pipe
/obj/machinery/atmospherics/pipe/simple/insulated
	pipe_state = "insulated"
	construction_type = /obj/item/pipe/binary/bendable

// HE Pipes
/obj/machinery/atmospherics/pipe/simple/heat_exchanging
	pipe_flags = 0 // Does not have PIPING_DEFAULT_LAYER_ONLY flag
	pipe_state = "he"
	construction_type = /obj/item/pipe/binary/bendable
/obj/machinery/atmospherics/pipe/simple/heat_exchanging/junction
	pipe_state = "junction"
	construction_type = /obj/item/pipe/binary

// Unary
/obj/machinery/atmospherics/unary
	construction_type = /obj/item/pipe/directional
/obj/machinery/atmospherics/unary/heat_exchanger
	pipe_state = "heunary"
/obj/machinery/atmospherics/unary/vent_scrubber
	pipe_state = "scrubber"
/obj/machinery/atmospherics/unary/vent_pump
	pipe_state = "uvent"
/obj/machinery/atmospherics/unary/outlet_injector
	pipe_state = "injector"
// Unary-ish
/obj/machinery/atmospherics/portables_connector
	construction_type = /obj/item/pipe/directional
	pipe_state = "connector"
/obj/machinery/atmospherics/pipe/vent
	pipe_state = "passive vent"
	construction_type = /obj/item/pipe/directional

// Binary
/obj/machinery/atmospherics/binary/passive_gate
	construction_type = /obj/item/pipe/directional
	pipe_state = "passivegate"
/obj/machinery/atmospherics/binary/pump
	construction_type = /obj/item/pipe/directional
	pipe_state = "pump"
/obj/machinery/atmospherics/binary/pump/high_power
	construction_type = /obj/item/pipe/directional
	pipe_state = "volumepump"

// Trinary
// TODO - Make some be flippable in hand by using construction_type = /obj/item/pipe/trinary/flippable
/obj/machinery/atmospherics/trinary/mixer
	construction_type = /obj/item/pipe/trinary/flippable
	pipe_state = "mixer"
/obj/machinery/atmospherics/trinary/mixer/t_mixer
	construction_type = /obj/item/pipe/trinary  // Can't flip a "T", its symmetrical
	pipe_state = "t_mixer"
/obj/machinery/atmospherics/trinary/mixer/m_mixer
	construction_type = /obj/item/pipe/trinary/flippable
	pipe_state = "m_mixer"
/obj/machinery/atmospherics/trinary/atmos_filter
	construction_type = /obj/item/pipe/trinary/flippable
	pipe_state = "filter"
/obj/machinery/atmospherics/trinary/atmos_filter/m_filter
	construction_type = /obj/item/pipe/trinary/flippable
	pipe_state = "m_filter"

// Omni
/obj/machinery/atmospherics/omni/atmos_filter
	construction_type = /obj/item/pipe/quaternary
/obj/machinery/atmospherics/omni/atmos_filter
	pipe_state = "omni_filter"
/obj/machinery/atmospherics/omni/mixer
	pipe_state = "omni_mixer"

// Valves
/obj/machinery/atmospherics/valve
	construction_type = /obj/item/pipe/binary
	pipe_state = "mvalve"
/obj/machinery/atmospherics/valve/digital
	pipe_state = "dvalve"

/obj/machinery/atmospherics/tvalve
	construction_type = /obj/item/pipe/trinary/flippable
	pipe_state = "mtvalve"
/obj/machinery/atmospherics/tvalve/digital
	pipe_state = "dtvalve"

/obj/machinery/atmospherics/tvalve/mirrored
	pipe_state = "mtvalvem"
/obj/machinery/atmospherics/tvalve/digital/mirrored
	pipe_state = "dtvalvem"
