/decl/sex_action/scissoring
	name = "Scissor them"

/decl/sex_action/scissoring/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return
	return TRUE

/decl/sex_action/scissoring/can_perform(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/decl/sex_action/scissoring/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] spreads [user.p_their()] legs and aligns [user.p_their()] cunt against [target]'s own!"))

/decl/sex_action/scissoring/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] scissors with [target]'s cunt."))
	playsound(target, 'mods/content/sexcon/sounds/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 1, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

	user.sexcon.perform_sex_action(target, 1, 4, TRUE)
	target.sexcon.handle_passive_ejaculation()

/decl/sex_action/scissoring/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops scissoring with [target]."))
