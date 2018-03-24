/mob/living/silicon/robot/update_hud()
	..()//lemme smash?
	if(ui_style_vr)
		hands.icon = 'icons/mob/screen1_robot_vr.dmi'
	if(modtype)
		hands.icon_state = lowertext(modtype)
	if(dogborg)//giving doggos their own harm/help intent icon
		hands.icon_state = 'icons/mob/screen1_robot_wideborg_chomp.dmi'
