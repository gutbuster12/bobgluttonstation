/datum/status_effect/gakster_dissociative_identity_disorder
	id = "DID"
	duration = -1

/datum/status_effect/gakster_dissociative_identity_disorder/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_GAKSTER, TRAIT_STATUS_EFFECT(id))
	owner.playsound_local(owner, 'modular_septic/sound/effects/stream.wav', 60)
	to_chat(owner, span_warning("I feel myself going insane! So nice!"))
	return ..()

/datum/status_effect/gakster_dissociative_identity_disorder/on_remove()
	owner.playsound_local(owner, 'modular_septic/sound/effects/tiktok_camera.wav', 60)
	to_chat(owner, span_warning("I feel myself going sane! So good!"))
	return ..()

/datum/status_effect/gakster_dissociative_identity_disorder/process(mob/living/carbon/spawned_human, delta_time, times_fired)
	if(!HAS_TRAIT(spawned_human, TRAIT_STATUS_EFFECT(id)))
		return
	if(DT_PROB(2, delta_time))
		INVOKE_ASYNC(src, .proc/handle_gakster_hallucinations, spawned_human)

/datum/status_effect/gakster_dissociative_identity_disorder/proc/handle_gakster_hallucinations()
	//Standard screen flash annoyance.3025
	if(HAS_TRAIT(owner, TRAIT_GAKSTER) && prob(2))
		var/atom/movable/screen/fullscreen/gakster/hall = owner.hud_used
		if(hall)
			hall.icon_state = "hall[rand(1,3)]"
			animate(hall, alpha = 255, time = 2)
			spawn(2)
				var/hallsound = pick(
									'modular_septic/sound/insanity/glitchloop.wav',
									'modular_septic/sound/insanity/glitchloop2.wav',
									'modular_septic/sound/insanity/glitchloop3.wav',
									)
				owner.playsound_local(get_turf(owner), hallsound, 100, FALSE)
				spawn(1)