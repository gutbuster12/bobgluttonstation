/datum/supply_pack/security
	group = "Security"
	access = FALSE
	access_view = FALSE
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/security/armorII
	name = "Type II Armored Vest"
	desc = "A bulletproof ceramic armor vest for basic protection against most pistol and revolver rounds"
	cost = 4000
	contains = list(/obj/item/clothing/suit/armor/vest/alt)
	crate_name = "type II armor crate"

/datum/supply_pack/security/armorIII
	name = "Type III+ \"Escapador\" Armored Vest"
	desc = "A bulletproof ceramic armor vest for intermediate protection against 5.45 and 4.92 rifle rounds and basic slashing and stabbing."
	cost = 15000
	contains = list(/obj/item/clothing/suit/armor/vest/alt/medium)
	crate_name = "type III+ armor crate"

/datum/supply_pack/security/armorIV
	name = "Type IV \"Defesa Total\" Armored Vest"
	desc = "A bulletproof plate-carrier vest for professional protection against 7.62, 7.62x54R, and 7.62x51, and moderate slashing and stabbing, more durable then most armors."
	cost = 25000
	contains = list(/obj/item/clothing/suit/armor/vest/alt/heavy)
	crate_name = "type IV armor crate"

/datum/supply_pack/security/helmetII
	name = "Type II Ballistic Helmet"
	desc = "A bulletproof helmet for protection against pistols and revolvers."
	cost = 8000
	contains = list(/obj/item/clothing/head/helmet)
	crate_name = "type II helmet crate"

/datum/supply_pack/security/helmetIII
	name = "Type III \"Evacuador\" Ballistic Helmet"
	desc = "A bulletproof helmet for intermediate protection against 5.45 and 4.92 rifle rounds and basic slashing and stabbing."
	cost = 19000
	contains = list(/obj/item/clothing/head/helmet/medium)
	crate_name = "type III helmet crate"

/datum/supply_pack/security/helmetIV
	name = "Type IV \"Touro-5\" Ballistic Helmet"
	desc = "A bulletproof helmet for professional protection against 7.62, 7.62x54R, and 7.62x51 rifle rounds and moderate slashing and stabbing. more durable then most helmets and can have a faceshield attached."
	cost = 30000
	contains = list(/obj/item/clothing/head/helmet/heavy)
	crate_name = "type IV helmet crate"

/datum/supply_pack/security/faceshield
	name = "General Chest Rig"
	desc = "A tactical rig that goes around your body to allow magazine and device storage with utility and convenience"
	cost = 3000
	contains = list(/obj/item/storage/belt/military)
	crate_name = "Chest Rig"

/datum/supply_pack/security/faceshield
	name = "\"Touro-5\" Faceshield"
	desc = "A ballistic, multi-hit faceshield for the \"Touro-5\""
	cost = 18000
	contains = list(/obj/item/ballistic_mechanisms/visor)
	crate_name = "type IV faceshield crate"
