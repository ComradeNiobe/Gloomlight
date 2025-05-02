/decl/sex_action/facesitting
	name = "Sit on their face"

/decl/sex_action/facesitting/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	return TRUE

/decl/sex_action/facesitting/can_perform(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	// Need to be standing
	if(user.current_posture.prone)
		return FALSE
	// Target can't be standing
	if(!target.current_posture.prone)
		return FALSE
	return TRUE

/decl/sex_action/facesitting/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] sits [user.p_their()] butt on [target]'s face!"))

/decl/sex_action/facesitting/on_perform(mob/living/human/user, mob/living/human/target)
	var/verbstring = pick(list("rubs", "smushes", "forces"))
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [verbstring] [user.p_their()] butt against [target] face."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 1, 3, TRUE)
	user.sexcon.handle_passive_ejaculation()

	user.sexcon.perform_deepthroat_oxyloss(target, 1.3)
	user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	target.sexcon.handle_passive_ejaculation()

/decl/sex_action/facesitting/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] gets off [target]'s face."))

/decl/sex_action/facesitting/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
