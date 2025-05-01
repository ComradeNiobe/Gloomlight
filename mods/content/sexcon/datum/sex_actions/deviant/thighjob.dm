/decl/sex_action/thighjob
	name = "Use their thighs to get off"

/decl/sex_action/thighjob/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return
	return TRUE

/decl/sex_action/thighjob/can_perform(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/decl/sex_action/thighjob/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] grabs [target]'s thighs and shoves [user.p_their()] cock inbetween!"))

/decl/sex_action/thighjob/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s thighs."))
	playsound(user, 'mods/content/sexcon/sounds/mat/fingering.ogg', 20, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

/decl/sex_action/thighjob/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] pulls [user.p_their()] cock out from inbetween [target]'s thighs."))
