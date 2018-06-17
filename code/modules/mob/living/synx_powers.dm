mob/living/proc/disguise()
	set name = "Toggle Form"
	set desc = "Switch between amorphous and humanoid forms."
	set category = "Abilities"

	//Transformed form
	if(icon_state !="bear")
		icon_state="bear"
		to_chat(src,"<span class='warning'>you changed back into your disguise.</span>")
		if(icon_state== "bear")
			to_chat(temporary_form,"<span class='warning'>You can only do this while not stunned.</span>")
		else
			to_chat(src,"<span class='warning'>you failed.</span>")

	//Normal form form
	else if(stat)
		to_chat(src,"<span class='warning'>You can only do this while not stunned.</span>")
		return
	else
		to_chat(src,"<span class='warning'>now they see your true form.</span>")
		icon_state="synx"