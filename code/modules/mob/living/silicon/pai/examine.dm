//Chompstation edit

/mob/living/silicon/pai/examine(mob/user)
	var/msg = "<span class='info'>*---------*<br>This is "
	if(icon)
		msg += "\icon[icon] "

	msg += "<EM>[src.name]</EM>, a <EM>[chassis_names[src.chassis]]</EM> personal AI</span>\n"

	if(health == 100)
		msg += "<span class='notice'>It's in pristine condition.</span>\n"
	else
		msg += "<span class='warning'>"
		if (src.getBruteLoss())
			if (src.getBruteLoss() < 50)
				msg += "It looks slightly dented.\n"
			else
				msg += "<B>It looks severely dented!</B>\n"
		if (src.getFireLoss())
			if (src.getFireLoss() < 50)
				msg += "It looks slightly charred.\n"
			else
				msg += "<B>It looks severely burnt and heat-warped!</B>\n"
		msg += "</span>"

	switch(src.stat)
		if(CONSCIOUS)
			if(!src.client)	msg += "\nIt appears to be in stand-by mode.\n" //afk
		if(UNCONSCIOUS)		msg += "\n<span class='warning'>It doesn't seem to be responding.</span>\n"
		if(DEAD)			msg += "\n<span class='deadsay'>It looks completely unsalvageable.</span>\n"
	msg += attempt_vr(src,"examine_bellies",args) //VOREStation Edit

	// VOREStation Edit: Start
	if(ooc_notes)
		msg += "<span class = 'deptradio'>OOC Notes:</span> <a href='?src=\ref[src];ooc_notes=1'>\[View\]</a>\n"
	// VOREStation Edit: End

	if(print_flavor_text()) msg += "\n[print_flavor_text()]\n"


	msg += "\n*---------*"

	if (pose)
		if( findtext(pose,".",lentext(pose)) == 0 && findtext(pose,"!",lentext(pose)) == 0 && findtext(pose,"?",lentext(pose)) == 0 )
			pose = addtext(pose,".") //Makes sure all emotes end with a period.
		msg += "\nIt is [pose]"

	user << msg


/obj/item/device/paicard/examine(mob/user)
	..(user)
	if(pai)//If we have a personality inside
		user << "<span class='emote'>Inside \the [src] is...</span>"
		pai.examine(user)//Examine that as well

//Chompstation edit end
// : )
