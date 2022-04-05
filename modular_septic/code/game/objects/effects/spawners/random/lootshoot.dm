/obj/effect/spawner/random/lootshoot
	name = "random combat loot"
	spawn_loot_chance = 100
	spawn_loot_count = 1
	spawn_all_loot = FALSE
	spawn_random_offset = TRUE
	loot = list(
		//Pistols
		/obj/item/gun/ballistic/automatic/pistol/remis/ppk = 10,
		/obj/item/gun/ballistic/automatic/pistol/remis/glock17 = 8,
		/obj/item/gun/ballistic/automatic/pistol/aps = 7,
		/obj/item/gun/ballistic/automatic/pistol/remis/combatmaster = 7,
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 10,
		/obj/item/gun/ballistic/revolver/remis/gado = 9,
		//SMGs
		/obj/item/gun/ballistic/automatic/remis/smg/solitario = 10,
		/obj/item/gun/ballistic/automatic/remis/smg/bastardo = 8,
		/obj/item/gun/ballistic/automatic/remis/smg/thump = 7,
		/obj/item/gun/ballistic/automatic/remis/smg/solitario/suppressed = 6,
		/obj/item/gun/ballistic/automatic/remis/smg/vector = 8,
		//Rifles
		/obj/item/gun/ballistic/automatic/remis/winter = 6,
		/obj/item/gun/ballistic/automatic/remis/abyss = 5,
		/obj/item/gun/ballistic/automatic/remis/g11 = 6,
		/obj/item/gun/ballistic/automatic/remis/svd = 5,
		/obj/item/gun/ballistic/automatic/remis/g3 = 5,
		//Shotgun
		/obj/item/gun/ballistic/shotgun/automatic/combat = 8,
		/obj/item/gun/ballistic/shotgun/automatic/b2000 = 8,
		/obj/item/gun/ballistic/shotgun/automatic/b2021 = 7,
		/obj/item/gun/ballistic/shotgun/bulldog = 7,
		/obj/item/gun/ballistic/shotgun/abyss = 6,
		//Rare
		/obj/item/gun/ballistic/shotgun/bolas = 3,
		/obj/item/gun/ballistic/automatic/pistol/remis/aniquilador = 2,
		/obj/item/gun/energy/remis/bolt_acr = 2,
		/obj/item/gun/energy/remis/siren = 1,
		//MISC loot
		/obj/item/suppressor = 10,
		/obj/item/hammer = 8, //swag
		/obj/item/geiger_counter = 5,
		/obj/item/ammo_casing/l40mm = 3,
		/obj/item/ammo_casing/l40mm/inc = 4,
	)

/obj/effect/spawner/random/lootshoot/Initialize(mapload)
	if(prob(35))
		spawn_loot_count = 2
	. = ..()

/obj/effect/spawner/random/lootshoot/rare
	name = "random combat loot"
	loot = list(
		//Pistols
		/obj/item/gun/ballistic/automatic/pistol/remis/ppk = 1,
		/obj/item/gun/ballistic/automatic/pistol/remis/glock17 = 8,
		/obj/item/gun/ballistic/automatic/pistol/aps = 9,
		/obj/item/gun/ballistic/automatic/pistol/remis/combatmaster = 10,
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 4,
		/obj/item/gun/ballistic/revolver/remis/gado = 14,
		//SMGs
		/obj/item/gun/ballistic/automatic/remis/smg/solitario = 10,
		/obj/item/gun/ballistic/automatic/remis/smg/bastardo = 12,
		/obj/item/gun/ballistic/automatic/remis/smg/thump = 10,
		/obj/item/gun/ballistic/automatic/remis/smg/solitario/suppressed = 7,
		/obj/item/gun/ballistic/automatic/remis/smg/vector = 10,
		//Rifles
		/obj/item/gun/ballistic/automatic/remis/winter = 12,
		/obj/item/gun/ballistic/automatic/remis/abyss = 11,
		/obj/item/gun/ballistic/automatic/remis/g11 = 10,
		/obj/item/gun/ballistic/automatic/remis/svd = 9,
		/obj/item/gun/ballistic/automatic/remis/g3 = 9,
		//Shotgun
		/obj/item/gun/ballistic/shotgun/automatic/combat = 5,
		/obj/item/gun/ballistic/shotgun/automatic/b2000 = 6,
		/obj/item/gun/ballistic/shotgun/automatic/b2021 = 12,
		/obj/item/gun/ballistic/shotgun/bulldog = 15,
		/obj/item/gun/ballistic/shotgun/abyss = 15,
		//Rare
		/obj/item/gun/ballistic/shotgun/bolas = 10,
		/obj/item/gun/ballistic/automatic/pistol/remis/aniquilador = 10,
		/obj/item/gun/energy/remis/bolt_acr = 10,
		/obj/item/gun/energy/remis/siren = 10,
		//MISC loot
		/obj/item/suppressor = 10,
		/obj/item/hammer = 8, //swag
		/obj/item/geiger_counter = 8,
	)

/obj/effect/spawner/random/lootshoot/rare/Initialize(mapload)
	if(prob(35))
		spawn_loot_count = 2
	. = ..()