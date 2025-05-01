/decl/sex_action/masturbate_anus
	name = "Finger butt"

/decl/sex_action/masturbate_anus/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user != target)
		return FALSE
	return TRUE

/decl/sex_action/masturbate_anus/can_perform(mob/living/human/user, mob/living/human/target)
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	return TRUE

/decl/sex_action/masturbate_anus/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] starts fingering [user.p_their()] butt..."))

/decl/sex_action/masturbate_anus/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fingers [user.p_their()] butt..."))
	playsound(user, 'mods/content/sexcon/sounds/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 6, TRUE)
	user.sexcon.handle_passive_ejaculation()

/decl/sex_action/masturbate_anus/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops fingering [user.p_their()] butt."))

/decl/sex_action/masturbate_anus/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
