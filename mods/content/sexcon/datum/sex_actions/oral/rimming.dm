/decl/sex_action/rimming
	name = "Rim them"
	uid = "sexcon_oral_rimming"

/decl/sex_action/rimming/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	return TRUE

/decl/sex_action/rimming/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/decl/sex_action/rimming/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] starts rimming [target]'s butt..."))

/decl/sex_action/rimming/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rims [target]'s butt..."))
	user.make_sucking_noise()

	user.sexcon.perform_sex_action(target, 2, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/decl/sex_action/rimming/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops rimming [target]'s butt ..."))

/decl/sex_action/rimming/is_finished(mob/living/human/user, mob/living/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
