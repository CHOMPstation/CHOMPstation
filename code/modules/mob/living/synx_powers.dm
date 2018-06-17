mob/living/proc/disguise()
	set name = "Toggle Form"
	set desc = "Switch between amorphous and humanoid forms."
	set category = "Abilities"

	//Blob form
	if(icon_state !="bear")
		icon_state="bear"
		if(icon_state== "bear")
			to_chat(temporary_form,"<span class='warning'>You can only do this while not stunned.</span>")
		else
			to_chat(src,"<span class='warning'>you failed.</span>")

	//Human form
	else if(stat)
		to_chat(src,"<span class='warning'>You can only do this while not stunned.</span>")
		return
	else
		to_chat(src,"<span class='warning'>you failed2.</span>")
		icon_state="synx"