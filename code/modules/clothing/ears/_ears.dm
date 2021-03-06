
//Ears: currently only used for headsets and earmuffs
/obj/item/clothing/ears
	name = "ears"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	slot_flags = ITEM_SLOT_EARS
	resistance_flags = NONE

/obj/item/clothing/ears/earmuffs
	name = "earmuffs"
	desc = "Protects your hearing from loud noises, and quiet ones as well."
	icon_state = "earmuffs"
	inhand_icon_state = "earmuffs"
	clothing_traits = list(TRAIT_DEAF)
	strip_delay = 15
	equip_delay_other = 25
	resistance_flags = FLAMMABLE
	custom_price = PAYCHECK_HARD * 1.5

/obj/item/clothing/ears/earmuffs/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/earhealing)
	/* SEPTIC EDIT REMOVAL
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))
	*/
	//SEPTIC EDIT BEGIN
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_LEAR,ITEM_SLOT_REAR))
	//SEPTIC EDIT END
