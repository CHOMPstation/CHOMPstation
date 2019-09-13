//TFF 13/9/19 - ChompStation Edit - Slight rework of how T-Ray scanners
//are spawned in with Engineers/Atmos Techs

/decl/hierarchy/outfit/job/engineering/chief_engineer
	name = OUTFIT_JOB_NAME("Chief engineer")
	head = /obj/item/clothing/head/hardhat/white
	uniform = /obj/item/clothing/under/rank/chief_engineer
	r_pocket = /obj/item/device/t_scanner
	l_ear = /obj/item/device/radio/headset/heads/ce
	gloves = /obj/item/clothing/gloves/black
	id_type = /obj/item/weapon/card/id/engineering/head
	pda_type = /obj/item/device/pda/heads/ce

/decl/hierarchy/outfit/job/engineering/engineer
	name = OUTFIT_JOB_NAME("Engineer")
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/rank/engineer
	r_pocket = /obj/item/device/t_scanner
	id_type = /obj/item/weapon/card/id/engineering/engineer
	pda_type = /obj/item/device/pda/engineering

/decl/hierarchy/outfit/job/engineering/atmos
	name = OUTFIT_JOB_NAME("Atmospheric technician")
	uniform = /obj/item/clothing/under/rank/atmospheric_technician
	belt = /obj/item/weapon/storage/belt/utility/atmostech
	id_type = /obj/item/weapon/card/id/engineering/atmos
	pda_type = /obj/item/device/pda/atmos
