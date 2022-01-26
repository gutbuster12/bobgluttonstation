/obj/machinery/vending/killbitches
	name = "\improper Atire-Putas"
	desc = "For when you really need to <b>KILL SOME BITHCES.</b>"
	icon_state = "killbitches"
	icon = 'modular_septic/icons/obj/vending.dmi'
	product_slogans = "Vai se foder porra!;GTA San Andreas crackeado SAMP sem virus!;Cria do pinheiro!"
	product_ads = "Mata-mata mundo louco!;Tudo 2!;Meu pau tá duro!"
	vend_reply = "Come back when you need more dead children!"
	panel_type = "panel17"
	onstation = FALSE
	default_price = 0
	extra_price = 0
	products = list(
		/obj/item/food/soup/monkeysdelight = 666,
		/obj/item/reagent_containers/syringe/copium = 20,
		/obj/item/clothing/under/stray = 20,
		/obj/item/clothing/shoes/jackboots = 20,
		/obj/item/clothing/gloves/fingerless = 20,
		/obj/item/clothing/suit/armor/vest/alt/heavy = 10,
		/obj/item/clothing/suit/armor/vest/alt/medium = 10,
		/obj/item/clothing/head/helmet/heavy = 10,
		/obj/item/clothing/head/helmet/medium = 10,
		/obj/item/clothing/mask/gas/ordinator/slaughter = 20,
		/obj/item/storage/belt/military = 20,
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 10,
		/obj/item/gun/ballistic/automatic/pistol/combatmaster = 3,
		/obj/item/gun/ballistic/revolver = 2,
		/obj/item/gun/ballistic/revolver/remis/nova = 15,
		/obj/item/ammo_casing/a357 = 65,
		/obj/item/ammo_casing/c38 = 120,
		/obj/item/ammo_box/magazine/combatmaster9mm = 69,
		/obj/item/ammo_box/magazine/m45 = 40,
		/obj/item/gun/ballistic/shotgun/automatic/combat = 5,
		/obj/item/ammo_casing/shotgun/ap = 1, //Better make it count, puta!
		/obj/item/ammo_casing/shotgun/buckshot = 569,
		/obj/item/ammo_casing/shotgun = 420,
		/obj/item/suppressor = 15,
		/obj/item/flashlight/seclite = 15,
		/obj/item/knife/kitchen = 2, //two of them
		/obj/item/melee/truncheon/black = 20,
		/obj/item/claymore = 2,
		/obj/item/gun/ballistic/automatic/remis/winter = 5,
		/obj/item/gun/ballistic/automatic/remis/abyss = 5,
		/obj/item/gun/ballistic/automatic/remis/g11 = 6,
		/obj/item/gun/ballistic/automatic/remis/steyr = 1,
		/obj/item/gun/ballistic/automatic/remis/svd = 1,
		/obj/item/ammo_box/magazine/a762svd = 4,
		/obj/item/ammo_box/magazine/a556steyr = 4,
		/obj/item/ammo_box/magazine/a49234g11 = 20,
		/obj/item/ammo_box/magazine/a54539abyss = 18,
		/obj/item/ammo_box/magazine/a762winter = 13,
		/obj/item/gun/ballistic/automatic/remis/smg/bastardo = 8,
		/obj/item/gun/ballistic/automatic/remis/smg/solitario = 20,
		/obj/item/gun/ballistic/automatic/remis/smg/thump = 5,
		/obj/item/ammo_box/magazine/thump45 = 20,
		/obj/item/ammo_box/magazine/hksmg22lr = 40,
		/obj/item/ammo_box/magazine/bastardo9mm = 25,
		/obj/item/grenade/frag = 3, //devious lick
	)
	armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 100, BIO = 0, FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/killbitches/build_inventory(list/productlist, list/recordlist, start_empty)
	default_price = round(initial(default_price) * SSeconomy.inflation_value())
	extra_price = round(initial(extra_price) * SSeconomy.inflation_value())
	for(var/typepath in productlist)
		var/amount = productlist[typepath]
		if(isnull(amount))
			amount = 0

		var/obj/item/temp = typepath
		var/datum/data/vending_product/R = new /datum/data/vending_product()
		GLOB.vending_products[typepath] = 1
		R.name = initial(temp.name)
		R.product_path = typepath
		if(!start_empty)
			R.amount = amount
		R.max_amount = amount
		///ITS FREE
		R.custom_price = 0
		R.custom_premium_price = 0
		R.age_restricted = initial(temp.age_restricted)
		R.colorable = !!(initial(temp.greyscale_config) && initial(temp.greyscale_colors) && (initial(temp.flags_1) & IS_PLAYER_COLORABLE_1))
		recordlist += R
