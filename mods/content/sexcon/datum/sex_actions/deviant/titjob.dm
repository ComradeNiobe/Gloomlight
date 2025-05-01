/decl/sex_action/titjob
	name = "Use their tits to get off"

/decl/sex_action/titjob/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return
	if(!target.getorganslot(ORGAN_SLOT_BREASTS))
		return
	return TRUE

/decl/sex_action/titjob/can_perform(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_CHEST))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_BREASTS))
		return FALSE
	return TRUE

/decl/sex_action/titjob/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] grabs [target]'s tits and shoves [user.p_their()] cock inbetween!"))

/decl/sex_action/titjob/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s tits."))
	playsound(user, 'mods/content/sexcon/sounds/mat/fingering.ogg', 20, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

/decl/sex_action/titjob/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] pulls [user.p_their()] cock out from inbetween [target]'s tits."))
