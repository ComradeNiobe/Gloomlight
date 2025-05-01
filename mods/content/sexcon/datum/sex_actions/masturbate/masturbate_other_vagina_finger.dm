/decl/sex_action/masturbate_other_vagina_finger
	name = "Finger their pussy"
	check_same_tile = FALSE

/decl/sex_action/masturbate_other_vagina_finger/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/decl/sex_action/masturbate_other_vagina_finger/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/decl/sex_action/masturbate_other_vagina_finger/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] starts fingering [target]'s [pick("slit","cunt","pussy","snatch")]..."))

/decl/sex_action/masturbate_other_vagina_finger/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fingers [target]'s [pick("slit","cunt","pussy","snatch")]..."))
	playsound(user, 'mods/content/sexcon/sounds/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(target, 2, 4, TRUE)

	target.sexcon.handle_passive_ejaculation()

/decl/sex_action/masturbate_other_vagina_finger/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops fingering [target]'s [pick("slit","cunt","pussy","snatch")]."))

/decl/sex_action/masturbate_other_vagina_finger/is_finished(mob/living/human/user, mob/living/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
