/decl/sex_action/vaginal_sex
	name = "Fuck their cunt"
	uid = "sexcon_sex_vaginal"
	stamina_cost = 1.0

/decl/sex_action/vaginal_sex/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/decl/sex_action/vaginal_sex/can_perform(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(!user.sexcon.can_use_penis())
		return
	return TRUE

/decl/sex_action/vaginal_sex/on_start(mob/living/human/user, mob/living/human/target)
	. = ..()
	var/decl/pronouns/pronouns = .

	user.visible_message(span_warning("[user] slides [pronouns.his] cock into [target]'s cunt!"))
	playsound(target, list('mods/content/sexcon/sounds/mat/insert (1).ogg','mods/content/sexcon/sounds/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/decl/sex_action/vaginal_sex/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s cunt."))
	playsound(target, 'mods/content/sexcon/sounds/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_love("[user] cums into [target]'s cunt!"))
		user.sexcon.cum_into()
		user.try_impregnate(target)
		user.virginity = FALSE
		target.virginity = FALSE

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 1.2, 3, FALSE)
	else
		user.sexcon.perform_sex_action(target, 2.4, 7, FALSE)
	target.sexcon.handle_passive_ejaculation()

/decl/sex_action/vaginal_sex/on_finish(mob/living/human/user, mob/living/human/target)
	. = ..()
	var/decl/pronouns/pronouns = .

	user.visible_message(span_warning("[user] pulls [pronouns.his] cock out of [target]'s cunt."))

/decl/sex_action/vaginal_sex/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
