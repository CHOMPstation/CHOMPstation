// This is a parody of Cards Against Humanity (https://en.wikipedia.org/wiki/Cards_Against_Humanity)
// which is licensed under CC BY-NC-SA 2.0, the full text of which can be found at the following URL:
// https://creativecommons.org/licenses/by-nc-sa/2.0/legalcode

/obj/item/weapon/deck/cagse
	name = "\improper CAG:SE deck (white)"
	desc = "The ever-popular Cards Against The Galaxy: Special Edition word game. Warning: may include traces of broken fourth wall and obscenity. This is the white deck."
	icon_state = "cag_white"
	var/blanks = 10 //5 extra blank cards than usual to make up for quantity

/obj/item/weapon/deck/cagse/black
	name = "\improper CAG:SE deck (black)"
	desc = "The ever-popular Cards Against The Galaxy: Special Edition word game. Warning: may include traces of broken fourth wall and obscenity. This is the black deck."
	icon_state = "cag_black"
	blanks = 0

/obj/item/weapon/deck/cagse/New()
	..()
	var/datum/playingcard/P
	for(var/cardtext in card_text_list)
		P = new()
		P.name = "[cardtext]"
		P.card_icon = "[icon_state]_card"
		P.back_icon = "[icon_state]_card_back"
		cards += P
	if(!blanks)
		return
	for(var/x=1 to blanks)
		P = new()
		P.name = "Blank Card"
		P.card_icon = "[icon_state]_card_back"
		P.back_icon = "[icon_state]_card_back"