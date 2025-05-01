/decl/sex_action/masturbate_penis
	name = "Jerk off"

/decl/sex_action/masturbate_penis/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/decl/sex_action/masturbate_penis/can_perform(mob/living/human/user, mob/living/human/target)
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(!user.sexcon.can_use_penis())
		return
	return TRUE

/decl/sex_action/masturbate_penis/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] starts jerking off..."))

/decl/sex_action/masturbate_penis/on_perform(mob/living/human/user, mob/living/human/target)
	var/chosen_verb = pick(list("jerks [user.p_their()] cock", "strokes [user.p_their()] cock", "masturbates", "jerks off"))
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [chosen_verb]..."))
	playsound(user, 'mods/content/sexcon/sounds/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)

	user.sexcon.handle_passive_ejaculation()

/decl/sex_action/masturbate_penis/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops jerking off."))

/decl/sex_action/masturbate_penis/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
