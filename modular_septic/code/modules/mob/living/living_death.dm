/mob/living/death(gibbed)
	. = ..()
	if(!QDELETED(src))
		update_shock()
	if(.)
		if(client)
			if(deathsound_local)
				SEND_SOUND(client, deathsound_local)
			SSdroning.kill_droning(client)

/mob/living/revive(full_heal, admin_revive, excess_healing)
	. = ..()
	update_shock()
