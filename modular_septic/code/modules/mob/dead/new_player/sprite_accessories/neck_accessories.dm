/datum/sprite_accessory/neck_accessory
	icon = 'modular_septic/icons/mob/human/sprite_accessory/neck_accessory.dmi'
	key = "neck_acc"
	generic = "Neck Accessory"
	body_zone = BODY_ZONE_PRECISE_NECK
	relevant_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)
	genetic = TRUE

/datum/sprite_accessory/neck_accessory/is_hidden(mob/living/carbon/human/H, obj/item/bodypart/BP)
	. = ..()
	if(body_zone && !BP?.advanced_rendering)
		return TRUE
	if(H.wear_suit && (HAS_TRAIT(H, TRAIT_HIDING_MUTANTPARTS) || (H.wear_suit.flags_inv & HIDEJUMPSUIT)))
		return TRUE

/datum/sprite_accessory/neck_accessory/none
	name = "None"
	icon_state = "none"
	color_src = null
	factual = FALSE

/datum/sprite_accessory/neck_accessory/sylveon_bow
	name = "Sylveon Neck Bow"
	icon_state = "sylveon_bow"
	recommended_species = list(SPECIES_SYNTHMAMMAL, SPECIES_MAMMAL, SPECIES_HUMAN, SPECIES_SYNTHHUMAN, SPECIES_FELINE, SPECIES_HUMANOID)
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	color_src = USE_MATRIXED_COLORS
