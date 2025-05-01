/decl/sex_action/toy_vagina
	name = "Pleasure cunt with toy"

/decl/sex_action/toy_vagina/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/decl/sex_action/toy_vagina/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/decl/sex_action/toy_vagina/on_start(mob/living/human/user, mob/living/human/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] shoves \the [dildo] in [user.p_their()] cunt..."))

/decl/sex_action/toy_vagina/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] pleasures [user.p_their()] cunt..."))
	playsound(user, 'mods/content/sexcon/sounds/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)

	user.sexcon.handle_passive_ejaculation()

/decl/sex_action/toy_vagina/on_finish(mob/living/human/user, mob/living/human/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] pulls out \the [dildo] from [user.p_their()] cunt."))

/decl/sex_action/toy_vagina/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
