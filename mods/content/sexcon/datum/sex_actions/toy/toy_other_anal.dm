/decl/sex_action/toy_other_anal
	name = "Use toy on their butt"

/decl/sex_action/toy_other_anal/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/decl/sex_action/toy_other_anal/can_perform(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/decl/sex_action/toy_other_anal/on_start(mob/living/human/user, mob/living/human/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] shoves \the [dildo] in [target]'s butt..."))

/decl/sex_action/toy_other_anal/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] pleasures [target]'s butt..."))
	playsound(user, 'mods/content/sexcon/sounds/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(target, 2, 6, TRUE)
	target.sexcon.handle_passive_ejaculation()

/decl/sex_action/toy_other_anal/on_finish(mob/living/human/user, mob/living/human/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] pulls \the [dildo] from [target]'s butt."))

/decl/sex_action/toy_other_anal/is_finished(mob/living/human/user, mob/living/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
