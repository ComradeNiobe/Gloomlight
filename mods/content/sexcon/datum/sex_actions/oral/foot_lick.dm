/decl/sex_action/foot_lick
	name = "Lick their feet"
	check_same_tile = FALSE
	uid = "sexcon_oral_footlick"

/decl/sex_action/foot_lick/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	return TRUE

/decl/sex_action/foot_lick/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_R_FOOT))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_L_FOOT))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/decl/sex_action/foot_lick/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] starts licking [target]'s feet..."))

/decl/sex_action/foot_lick/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] licks [target]'s feet..."))
	user.make_sucking_noise()

/decl/sex_action/foot_lick/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops licking [target]'s feet ..."))
