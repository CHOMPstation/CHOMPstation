/datum/trait/transformer
	name = "Transformer"
	desc = "Allows you to change your body at will!"
	cost = 4

/datum/trait/transformer/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/transform_select_shape
	H.verbs |= /mob/living/carbon/human/proc/transform_select_colour
	H.verbs |= /mob/living/carbon/human/proc/transform_select_hair
	H.verbs |= /mob/living/carbon/human/proc/transform_select_eye_colour
	H.verbs |= /mob/living/carbon/human/proc/transform_select_hair_colors
	H.verbs |= /mob/living/carbon/human/proc/transform_select_gender
	H.verbs |= /mob/living/carbon/human/proc/transform_select_wings
	H.verbs |= /mob/living/carbon/human/proc/transform_select_tail
	H.verbs |= /mob/living/carbon/human/proc/transform_select_ears
