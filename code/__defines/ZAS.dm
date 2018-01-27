// Bitflag values for c_airblock()
#define AIR_BLOCKED 1	// Blocked
#define ZONE_BLOCKED 2	// Not blocked, but zone boundaries will not cross.
#define BLOCKED 3		// Blocked, zone boundaries will not cross even if opened.

#define ZONE_MIN_SIZE 14 // Zones with less than this many turfs will always merge, even if the connection is not direct

// Modes for /atom/movables to declare thier CanPass (and thus c_airblock) behavior; often avoiding the need to call c_airblock() at all.
#define CANPASS_ALWAYS 1	// "My c_airblock() always returns 0"
#define CANPASS_DENSITY 2	// "My c_airblock() returns AIR_BLOCKED if density=1 otherwise 0"
#define CANPASS_PROC 3		// "Just call my c_airblock()"
#define CANPASS_NEVER 4		// "My c_airblock() always returns BLOCKED"

#define TURF_HAS_VALID_ZONE(T) (istype(T, /turf/simulated) && T:zone && !T:zone:invalid)

// Implementation of /turf/c_airblock() as a define for blue hedgehogs.
// Defines can't actually "return" a value, so you have to pass in the variable you want to receive the return value.
#ifdef MULTIZAS

#define ATMOS_CANPASS_TURF(ret,A,B) \
	ret = 0;\
	if (A.blocks_air & AIR_BLOCKED || B.blocks_air & AIR_BLOCKED) { \
		ret = BLOCKED; \
	} \
	else if (B.z != A.z) { \
		if (B.z < A.z) { \
			if (!istype(A, /turf/simulated/open)) { \
				ret = BLOCKED; \
			} else { \
				ret = ZONE_BLOCKED; \
			} \
		} \
		else { \
			if (!istype(B, /turf/simulated/open)) { \
				ret = BLOCKED; \
			} else { \
				ret = ZONE_BLOCKED; \
			} \
		} \
	} \
	if (ret != BLOCKED && (A.blocks_air & ZONE_BLOCKED || B.blocks_air & ZONE_BLOCKED)) { \
		ret = (A.z == B.z) ? ZONE_BLOCKED : AIR_BLOCKED; \
	} \
	else if (ret != BLOCKED && A.contents.len) { \
		for (var/thing in A) { \
			var/atom/movable/AM = thing; \
			switch (AM.atmos_canpass) { \
				if (CANPASS_ALWAYS) { \
					continue; \
				} \
				if (CANPASS_DENSITY) { \
					if (AM.density) { \
						ret |= AIR_BLOCKED; \
					} \
				} \
				if (CANPASS_PROC) { \
					ret |= AM.c_airblock(B); \
				} \
				if (CANPASS_NEVER) { \
					ret = BLOCKED; \
				} \
			} \
			if (ret == BLOCKED) { \
				break;\
			}\
		}\
	}

#else

#define ATMOS_CANPASS_TURF(ret,A,B) \
	if (A.blocks_air & AIR_BLOCKED || B.blocks_air & AIR_BLOCKED) { \
		ret = BLOCKED; \
	} \
	else if (A.blocks_air & ZONE_BLOCKED || B.blocks_air & ZONE_BLOCKED) { \
		ret = ZONE_BLOCKED; \
	} \
	else if (A.contents.len) { \
		ret = 0;\
		for (var/thing in A) { \
			var/atom/movable/AM = thing; \
			switch (AM.atmos_canpass) { \
				if (CANPASS_ALWAYS) { \
					continue; \
				} \
				if (CANPASS_DENSITY) { \
					if (AM.density) { \
						ret |= AIR_BLOCKED; \
					} \
				} \
				if (CANPASS_PROC) { \
					ret |= AM.c_airblock(B); \
				} \
				if (CANPASS_NEVER) { \
					ret = BLOCKED; \
				} \
			} \
			if (ret == BLOCKED) { \
				break;\
			}\
		}\
	}

#endif
