/proc/translate_sharpness(sharpness = NONE)
	. = list()
	if(sharpness & SHARP_IMPALING)
		. += "impaling"
	if(sharpness & SHARP_POINTY)
		. += "piercing"
	if(sharpness & SHARP_EDGED)
		. += "cutting"
	return english_list(., "blunt")
