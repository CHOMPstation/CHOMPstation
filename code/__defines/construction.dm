//
// Frame construction
//

// Frame construction states
#define FRAME_PLACED 0		// Has been placed (can be anchored or not).
#define FRAME_UNFASTENED 1	// Circuit added.
#define FRAME_FASTENED 2	// Circuit fastened.
#define FRAME_WIRED 3		// Frame wired.
#define FRAME_PANELED 4		// Glass panel added.

// The frame classes define a sequence of construction steps.
#define FRAME_CLASS_ALARM "alarm"
#define FRAME_CLASS_COMPUTER "computer"
#define FRAME_CLASS_DISPLAY "display"
#define FRAME_CLASS_MACHINE "machine"

// Does the frame get built on the floor or a wall?
#define FRAME_STYLE_FLOOR "floor"
#define FRAME_STYLE_WALL "wall"

//
// Pipe Construction
//

//Construction Categories
#define PIPE_STRAIGHT			0 //2 directions: N/S, E/W
#define PIPE_BENDABLE			1 //6 directions: N/S, E/W, N/E, N/W, S/E, S/W
#define PIPE_TRINARY			2 //4 directions: N/E/S, E/S/W, S/W/N, W/N/E
#define PIPE_TRIN_M				3 //8 directions: N->S+E, S->N+E, N->S+W, S->N+W, E->W+S, W->E+S, E->W+N, W->E+N
#define PIPE_UNARY				4 //4 directions: N, S, E, W
#define PIPE_ONEDIR				5 //1 direction: N/S/E/W
#define PIPE_UNARY_FLIPPABLE	6 //8 directions: N, S, E, W, N-flipped, S-flipped, E-flipped, W-flipped
#define PIPE_TRIN_T				7 //8 directions: N->S+E, S->N+E, N->S+W, S->N+W, E->W+S, W->E+S, E->W+N, W->E+N

//Disposal pipe relative connection directions
#define DISP_DIR_BASE	0
#define DISP_DIR_LEFT	1
#define DISP_DIR_RIGHT	2
#define DISP_DIR_FLIP	4
#define DISP_DIR_NONE	8

// Temporary Bridge Macros
// Use of these macros will help us smoothly convert from atmospherics horrible
// var/node1,var/node2,... system to using var/list/nodes

// Use to access a list of nodes.  At this point in time its access only! The list should be treated as immutable.
#define ATMOS_NODES(M) M.get_nodes()


// We may switch to this someday! For now we will go halfway ~Leshana
// tg MULTIPIPES
//IF YOU EVER CHANGE THESE CHANGE SPRITES TO MATCH.
// #define PIPING_LAYER_MIN 1
// #define PIPING_LAYER_MAX 3
// #define PIPING_LAYER_DEFAULT 2
// #define PIPING_LAYER_P_X 5
// #define PIPING_LAYER_P_Y 5
// #define PIPING_LAYER_LCHANGE 0.05

// #define PIPING_ALL_LAYER 1					//intended to connect with all layers, check for all instead of just one.
// #define PIPING_ONE_PER_TURF 2 				//can only be built if nothing else with this flag is on the tile already.
// #define PIPING_DEFAULT_LAYER_ONLY 4			//can only exist at PIPING_LAYER_DEFAULT
// #define PIPING_CARDINAL_AUTONORMALIZE 8		//north/south east/west doesn't matter, auto normalize on buil

#define CONNECT_TYPE_REGULAR	1
#define CONNECT_TYPE_SUPPLY		2
#define CONNECT_TYPE_SCRUBBER	4
#define CONNECT_TYPE_HE			8

#define PIPING_LAYER_SUPPLY		1
#define PIPING_LAYER_REGULAR	2
#define PIPING_LAYER_SCRUBBER	3
#define PIPING_LAYER_HE			2
// Virgo Multipipes - Another way of doing the classic scrubbers/normal/supply

#define PIPING_LAYER_MIN 1
#define PIPING_LAYER_MAX 3
#define PIPING_LAYER_DEFAULT 2
#define PIPING_LAYER_P_X 5
#define PIPING_LAYER_P_Y 5
#define PIPING_LAYER_LCHANGE 0.01

#define PIPING_ALL_LAYER 1					//intended to connect with all layers, check for all instead of just one.
#define PIPING_ONE_PER_TURF 2 				//can only be built if nothing else with this flag is on the tile already.
#define PIPING_DEFAULT_LAYER_ONLY 4			//can only exist at PIPING_LAYER_DEFAULT
#define PIPING_CARDINAL_AUTONORMALIZE 8		//north/south east/west doesn't matter, auto normalize on build.


// Macros for calculating the pixel offsets for shifting stuff into the right layer
#define PIPE_PIXEL_OFFSET_X(piping_layer) ((piping_layer - PIPING_LAYER_DEFAULT) * PIPING_LAYER_P_X)
#define PIPE_PIXEL_OFFSET_Y(piping_layer) ((piping_layer - PIPING_LAYER_DEFAULT) * PIPING_LAYER_P_Y)
#define PIPE_LAYER_OFFSET(piping_layer)   ((piping_layer - PIPING_LAYER_DEFAULT) * PIPING_LAYER_LCHANGE)

#define STANDARD_ATMOS_CHOOSE_NODE(node_num, direction) \
	for(var/obj/machinery/atmospherics/target in get_step(src, direction)) { \
		if(can_be_node(target, node_num)) { \
			node##node_num = target; \
			break; \
		} \
	}