/decl/sex_action/toy_oral
	name = "Swallow toy"

/decl/sex_action/toy_oral/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user != target)
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/decl/sex_action/toy_oral/can_perform(mob/living/human/user, mob/living/human/target)
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/decl/sex_action/toy_oral/on_start(mob/living/human/user, mob/living/human/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] starts swallowing on \the [dildo]..."))

/decl/sex_action/toy_oral/on_perform(mob/living/human/user, mob/living/human/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] blows \the [dildo]..."))
	user.make_sucking_noise()

/decl/sex_action/toy_oral/on_finish(mob/living/human/user, mob/living/human/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] stops blowing \the [dildo]."))

/decl/sex_action/toy_oral/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
