client/verb/adminspice() // Essentially copy-pasted from virgo. -Erik
	set category = "Admin"
	set name = "Request Spice"
	set desc = "Request admins to spice round up for you"

	//handle muting and automuting
	if(prefs.muted & MUTE_ADMINHELP)
		to_chat(usr, "<span class='danger'>Error: You cannot request spice (muted from adminhelps).</span>")
		return

	if(alert(usr, "Are you sure you want to request the admins spice things up for you? You accept the consequences if you do.",,"No","Yes") != "No")
		message_admins("[key_name(usr)] has requested the round to be spiced up a little.")
		to_chat(usr, "<span class='notice'>You have requested some more spice in your round.</span>")
	else
		to_chat(usr, "<span class='notice'>Spice request cancelled.</span>")
		return

	//if they requested spice, then remove spice verb temporarily to prevent spamming.
	usr.verbs -= /client/verb/adminspice
	spawn(6000)
		usr.verbs += /client/verb/adminspice // 10 minute cool-down for spice request.