/decl/sex_action/crotch_nuzzle
	name = "Nuzzle their crotch"
	uid = "sexcon_oral_crotchnuzzle"

/decl/sex_action/crotch_nuzzle/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	return TRUE

/decl/sex_action/crotch_nuzzle/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/decl/sex_action/crotch_nuzzle/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] moves [user.p_their()] head against [target]'s crotch..."))

/decl/sex_action/crotch_nuzzle/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] nuzzles [target]'s crotch..."))

	user.sexcon.perform_sex_action(target, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/decl/sex_action/crotch_nuzzle/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops nuzzling [target]'s crotch..."))

/decl/sex_action/crotch_nuzzle/is_finished(mob/living/human/user, mob/living/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
