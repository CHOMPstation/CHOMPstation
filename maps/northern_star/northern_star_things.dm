//TFF: Add new obj for Med Outpost camera network
/obj/machinery/camera/network/medical_outpost
	network = list(NETWORK_MEDICAL_OUTPOST)

//TFF 16/10/19 - Xenobio cameras and console monitoring. Ported from tether_things.dm
/obj/machinery/camera/network/research/xenobio
	network = list(NETWORK_XENOBIO)

/obj/machinery/computer/security/xenobio
	name = "xenobiology camera monitor"
	desc = "Used to access the xenobiology cell cameras."
	icon_keyboard = "mining_key"
	icon_screen = "mining"
	network = list(NETWORK_XENOBIO)
	circuit = /obj/item/weapon/circuitboard/security/xenobio
	light_color = "#F9BBFC"

/obj/item/weapon/circuitboard/security/xenobio
	name = T_BOARD("xenobiology camera monitor")
	build_path = /obj/machinery/computer/security/xenobio
	network = list(NETWORK_XENOBIO)
	req_access = list()

//TFF 26/10/19 - add t-comms network cameras
/obj/machinery/camera/network/tcomms
	network = list(NETWORK_TCOMMS)
