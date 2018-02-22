//
// New method of handling pipe construction.  Instead of numeric constants and a giant switch statement of doom
// 	every pipe type has a datum instance which describes its name, placement rules and construction method, dispensing etc.
// The advantages are obvious, mostly in simplifying the code of the dispenser, and the ability to add new pipes without hassle.
//

// Abstract pipe type declaration
/datum/pipe_construction
	name = "Abstract Pipe (fixme)"
	var/pipe_id = -1  // The legacy pipe id defined in construction.dm  (Is this needed? We'll see)
	
	var/obj/item/pipe/pipe_type // This is the type PATH to the type of pipe we will construct
	
	var/connect_type // TODO - Do we need this? Can't we read it off of the actual pipe type?
	
	// Things that control construtcion
	var/normalize_dir = FALSE
	

	
/obj/item/pipe/New(var/loc, var/pipe_type as num, var/dir as num, var/obj/machinery/atmospherics/make_from = null)
	// Such
	

// Datum encapsulating the logic for which directions to look when connecting pipes.
// Some of this type of logic is needed in multiple different pipe related areas that aren't in simple type hierarchy (Sigh)
// By categorizing it here, pipes can simply delegate those tasks here to be simple!
/datum/pipe_connection_strategy
	var/name = "Abstract Pipe Connection Strategy"
	var/strategy_id = -1

// Determine what the initialize_dirs should be for a given direction
/datum/pipe_connection_strategy/proc/get_initialize_dirs(var/dir)
	return 0

//4 directions: N, S, E, W
/datum/pipe_connection_strategy/unary
	strategy_id = PIPE_UNARY

/datum/pipe_connection_strategy/unary/get_initialize_dirs(var/dir)
	initialize_directions = dir

//8 directions: N, S, E, W, N-flipped, S-flipped, E-flipped, W-flipped
/datum/pipe_connection_strategy/unary_fippable
	strategy_id = PIPE_UNARY_FLIPPABLE

//2 directions: N/S, E/W
/datum/pipe_connection_strategy/straight
	strategy_id = PIPE_STRAIGHT

/datum/pipe_connection_strategy/straight/get_initialize_dirs(var/dir)
	switch(dir)
		if(SOUTH || NORTH)
			initialize_directions = SOUTH|NORTH
		if(EAST || WEST)
			initialize_directions = EAST|WEST

//6 directions: N/S, E/W, N/E, N/W, S/E, S/W  (Note this is a superset of straight)
/datum/pipe_connection_strategy/bendable
	strategy_id = PIPE_BENDABLE

/datum/pipe_connection_strategy/bendable/get_initialize_dirs(var/dir)
	switch(dir)
		if(SOUTH || NORTH)
			initialize_directions = SOUTH|NORTH
		if(EAST || WEST)
			initialize_directions = EAST|WEST
		if(NORTHEAST)
			initialize_directions = NORTH|EAST
		if(NORTHWEST)
			initialize_directions = NORTH|WEST
		if(SOUTHEAST)
			initialize_directions = SOUTH|EAST
		if(SOUTHWEST)
			initialize_directions = SOUTH|WEST

//4 directions: N/E/S, E/S/W, S/W/N, W/N/E
/datum/pipe_connection_strategy/trinary
	strategy_id = PIPE_TRINARY

/datum/pipe_connection_strategy/trinary/get_initialize_dirs(var/dir)
	switch(dir)
		if(NORTH)
			initialize_directions = EAST|SOUTH|WEST
		if(SOUTH)
			initialize_directions = WEST|NORTH|EAST
		if(EAST)
			initialize_directions = SOUTH|WEST|NORTH
		if(WEST)
			initialize_directions = NORTH|EAST|SOUTH

//8 directions: N->S+E, S->N+E, N->S+W, S->N+W, E->W+S, W->E+S, E->W+N, W->E+N
/datum/pipe_connection_strategy/trinary/mirrorable
	strategy_id = PIPE_TRIN_M

	switch(dir)
		if(NORTH)
			initialize_directions = WEST|NORTH|SOUTH
		if(SOUTH)
			initialize_directions = SOUTH|EAST|NORTH
		if(EAST)
			initialize_directions = EAST|WEST|NORTH
		if(WEST)
			initialize_directions = WEST|SOUTH|EAST

/datum/pipe_connection_strategy/trinary_m/get_initialize_dirs(var/dir)

//1 direction: N/S/E/W
/datum/pipe_connection_strategy/quartenary
	strategy_id = PIPE_ONEDIR

/datum/pipe_connection_strategy/quartenary/get_initialize_dirs(var/dir)
	return NORTH|SOUTH|EAST|WEST