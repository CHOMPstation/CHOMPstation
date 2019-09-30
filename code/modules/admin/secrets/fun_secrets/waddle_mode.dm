var/global/waddleToggle = 0

/datum/admin_secret_item/fun_secret/waddle_mode
	name = "South Park Mode"

/datum/admin_secret_item/fun_secret/waddle_mode/execute(var/mob/user)
	..()
	if(!waddleToggle)
		log_and_message_admins("[user] enabled waddling!", user)
		waddleToggle = TRUE
	else
		log_and_message_admins("[user] disabled waddling!", user)
		waddleToggle = FALSE

