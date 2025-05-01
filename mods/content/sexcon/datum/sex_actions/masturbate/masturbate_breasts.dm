/decl/sex_action/masturbate_breasts
	name = "Rub breasts"

/decl/sex_action/masturbate_breasts/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_BREASTS))
		return FALSE
	return TRUE

/decl/sex_action/masturbate_breasts/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_CHEST, TRUE))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_BREASTS))
		return FALSE
	return TRUE

/decl/sex_action/masturbate_breasts/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] starts rubbing [user.p_their()] breasts..."))

/decl/sex_action/masturbate_breasts/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fondles [user.p_their()] breasts..."))

	user.sexcon.perform_sex_action(user, 1, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

/decl/sex_action/masturbate_breasts/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops fondling [user.p_their()] breasts."))

/decl/sex_action/masturbate_breasts/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
