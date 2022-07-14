GLOBAL_LIST_EMPTY(phone_list)
GLOBAL_LIST_EMPTY(public_phone_list)

/obj/item/cellular_phone
	name = "\improper phone"
	desc = "A portable phone that fits everywhere but your pocket, foldable! If you're strong enough."
	icon = 'modular_septic/icons/obj/items/device.dmi'
	icon_state = "phone"
	base_icon_state = "phone"
	inhand_icon_state = "electronic"
	worn_icon_state = "pda"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_ID | ITEM_SLOT_BELT
	pickup_sound = 'modular_septic/sound/efn/phone_pickup.ogg'
	equip_sound = 'modular_septic/sound/efn/phone_holster.ogg'
	var/callingSomeone = 'modular_septic/sound/efn/phone_call.ogg'
	var/hangUp = 'modular_septic/sound/efn/phone_hangup.ogg'
	var/answer = 'modular_septic/sound/efn/phone_answer.ogg'
	var/phoneDead = 'modular_septic/sound/efn/phone_dead.ogg'
	var/device_insert = 'modular_septic/sound/efn/phone_simcard_insert.ogg'
	var/device_desert = 'modular_septic/sound/efn/phone_simcard_desert.ogg'
	var/phone_press = list('modular_septic/sound/effects/phone_press.ogg', 'modular_septic/sound/effects/phone_press2.ogg', 'modular_septic/sound/effects/phone_press3.ogg', 'modular_septic/sound/effects/phone_press4.ogg')
	var/calling_someone = FALSE
	var/obj/item/cellular_phone/connected_phone
	var/obj/item/cellular_phone/calling_phone
	var/obj/item/sim_card/sim_card

	var/datum/looping_sound/phone_ringtone/ringtone_soundloop
	var/datum/looping_sound/phone_call/call_soundloop

/obj/item/cellular_phone/examine(mob/user)
	. = ..()
	if(sim_card)
		var/final_message = "There's a sim card installed."
		if(sim_card.number)
			final_message += span_boldnotice(" The number's [sim_card.number].")
		. += span_notice("[final_message]")

/obj/item/cellular_phone/update_overlays()
	. = ..()
	if(sim_card)
		. += "[icon_state]_active"

/obj/item/cellular_phone/Initialize(mapload)
	. = ..()
	call_soundloop = new(src, FALSE)
	ringtone_soundloop = new(src, FALSE)

/obj/item/cellular_phone/Destroy()
	. = ..()
	QDEL_NULL(call_soundloop)
	QDEL_NULL(ringtone_soundloop)

/obj/item/sim_card
	name = "\improper sim card"
	desc = "Sim, sim, I agree with your statement"
	icon = 'modular_septic/icons/obj/items/device.dmi'
	icon_state = "simcard"
	base_icon_state = "simcard"
	var/public_name
	var/is_public
	var/number
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON

/obj/item/sim_card/Initialize(mapload)
	. = ..()
	number = "[rand(0,9)][rand(0,9)][rand(0,9)][rand(0,9)]-[rand(0,9)][rand(0,9)][rand(0,9)][rand(0,9)]"
	if(GLOB.phone_list[number])
		log_bomber(src, "has been detected as the same phone number as another sim card, It has been exploded!")
		explosion(src, heavy_impact_range = 1, adminlog = TRUE, explosion_cause = src)
		qdel(src)

/obj/item/cellular_phone/attackby(obj/item/I, mob/living/zoomer, params)
	. = ..()
	if(istype(I,/obj/item/sim_card))
		if(sim_card)
			to_chat(zoomer, span_notice("There's already a [sim_card] installed."))
			return
		if(zoomer.transferItemToLoc(I, src))
			to_chat(zoomer, span_notice("I carefully insert the [I] into [src]'s sim card slot."))
			playsound(src, device_insert, 65, FALSE)
			sim_card = I
	update_appearance(UPDATE_ICON)

/obj/item/cellular_phone/attack_self_tertiary(mob/user, modifiers)
	. = ..()
	var/message = pick("[user] types 80085 on the [src].", \
	"[user] violently presses every key on the [src].", \
	"[user] clearly wanted a flip phone in the first place!", \
	"[user] plays raging birds!", \
	"[user] nearly falls asleep at the idea of paying for data!", \
	"[user] has an unregistered hypercam!")
	playsound(src, phone_press, 65, FALSE)
	visible_message(span_boldnotice("[message]"))

/obj/item/cellular_phone/AltClick(mob/user)
	. = ..()
	if(!sim_card)
		to_chat(user, span_notice("There's nothing in the sim card slot."))
		return
	eject_sim_card(user)

/obj/item/cellular_phone/proc/eject_sim_card(mob/living/user)
	playsound(src, device_desert, 65, FALSE)
	user.transferItemToLoc(sim_card, user.loc)
	user.put_in_hands(sim_card)
	sim_card = null
	update_appearance(UPDATE_ICON)

/obj/item/cellular_phone/proc/gib_them_with_a_delay(mob/living/user)
	playsound(src, 'modular_septic/sound/effects/ted_beeping.wav', 80, FALSE, 2)
	if(user)
		user.sound_hint()
	else
		sound_hint()
	sleep(8)
	user.gib()

/obj/item/cellular_phone/attack_self(mob/living/user, list/modifiers)
	. = ..()
	var/title = "The Future of Technology"
	var/mob/living/carbon/human/human_user
	if(ishuman(user))
		human_user = user
	if(!sim_card)
		to_chat(user, span_notice("The [src] doesn't have a sim card installed."))
		return
	if(!sim_card.public_name)
		var/input = input(user, "Username?", title, "") as text|null
		if(!input)
			return
		if(input == lowertext("BITCHKILLA555") || input == lowertext("BITCHKILLER555"))
			to_chat(user, span_flashingbigdanger("DONOSED!"))
			user.emote("scream")
			INVOKE_ASYNC(src, .proc/gib_them_with_a_delay, user)
			return
		sim_card.public_name = input
	if(isnull(sim_card.is_public))
		var/options = list("Yes", "No")
		if(human_user?.dna.species.id == SPECIES_INBORN)
			options = list("MHM", "NAHHHHH")
		var/input = input(user, "Would you like to be a public number?", title, "") as null|anything in options
		if(input == "NAHHHHH" || input == "No")
			sim_card.is_public = FALSE
			GLOB.phone_list = src
			return
		if(!input)
			return
		GLOB.phone_list[sim_card.number] = src
		GLOB.public_phone_list[sim_card.public_name] = src
		sim_card.is_public = TRUE
	if(connected_phone)
		var/options = list("Yes", "No")
		if(human_user?.dna.species.id == SPECIES_INBORN)
			options = list("MHM", "NAHHHHH")
		var/input = input(user, "Hang up?", title, "") as null|anything in options
		if(input == "NAHHHHH" || input == "No")
			return
		if(!input)
			return
		hang_up()
	else if(!connected_phone)
		var/list/options = GLOB.public_phone_list.Copy()
		options += "private call"
		var/input = input(user, "Who would you like to dial up?", title, "") as null|anything in option
		playsound(src, phone_press, 65, FALSE)
		if(!input)
			playsound(src, phone_press, 65, FALSE)
			to_chat(user, span_bolddanger("Go fuck yourself."))
			return
		if(input == "private call")
			var/obj/item/cellular_phone/friend_phone
			input = input(user, "Enter Phone Number", title, "") as null|text
			if(!input)
				playsound(src, phone_press, 65, FALSE)
				to_chat(user, span_bolddanger("Go fuck yourself."))
				return
			if(!GLOB.phone_list[input])
				playsound(src, phone_press, 65, FALSE)
				to_chat(user, span_bolddanger("You will never dial a real phone."))
				return
			friend_phone = GLOB.phone_list[input]
		else
			if(!input)
				playsound(src, phone_press, 65, FALSE)
				to_chat(user, span_bolddanger("You will never dial a real phone."))
				return
			friend_phone = GLOB.public_phone_list[input]
		call_phone(connecting_phone = friend_phone)
	if(calling_phone)
		var/options = list("Yes", "No")
		if(human_user?.dna.species.id == SPECIES_INBORN)
			options = list("MHM", "NAHHHHH")
		var/input = input(user, "Pick up the phone?", title, "") as null|anything in options
		if(input == "NAHHHHH" || input == "No")
			return
		if(!input)
			return
		hang_up()
	update_appearance(UPDATE_ICON)

/obj/item/cellular_phone/proc/call_phone(mob/living/user, list/modifiers, obj/item/cellular_phone/connecting_phone)
	if(!sim_card)
		to_chat(user, span_notice("The [src] doesn't have a sim card installed."))
		return
	if(!sim_card.public_name)
		to_chat(user, span_notice("I need a username to make a call."))
		return
	if(connecting_phone)
		to_chat(user, span_boldnotice("//ERROR// FU3cK YOUSELF"))
		return
	user.visible_message(span_notice("[user] starts to call someone with their [src]"), \
		span_notice("I start calling [connecting_phone.sim_card.number]"))
	var/calling_time = rand(4,28)
	connecting_phone.calling_phone = src
	calling_someone = TRUE
	addtimer(CALLBACK(connecting_phone, .proc/start_ringing), calling_time)

/obj/item/cellular_phone/proc/accept_call(mob/living/user, list/modifiers, obj/item/cellular_phone/connecting_phone)
	if(!sim_card)
		to_chat(user, span_notice("The [src] doesn't have a sim card installed."))
		return
	if(!connecting_phone)
		to_chat(user, span_boldnotice("But there's no-one there..."))
		hang_up()
		return

/obj/item/cellular_phone/proc/start_ringing(mob/living/user, list/modifiers, obj/item/cellular_phone/connecting_phone)
	if(!calling_phone) //How did it start ringing?
		hang_up(loud = FALSE)
		return
	ringtone_soundloop.start

/obj/item/cellular_phone/proc/hang_up(mob/living/user, list/modifiers, obj/item/cellular_phone/connecting_phone, loud = TRUE)
	if(!connected_phone)
		to_chat(user, span_notice("There's no-one at the other end."))
		return
	if(loud)
		playsound(src, hangUp, 60, FALSE)
		connecting_phone.user.playsound(src, hangUp, 60, FALSE)
		to_chat(user, span_notice("I hang up."))
		connecting_phone.to_chat(user, span_notice("They hung up."))
	ringtone_soundloop.stop
	call_soundloop.stop
	connected_phone = null
	calling_phone = null
	connecting_phone.connected_phone = null
	connecting_phone.calling_phone = null