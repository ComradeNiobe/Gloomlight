/decl/sex_action/vaginal_ride_sex
	name = "Ride them"
	uid = "sexcon_sex_vaginalride"
	stamina_cost = 1.0
	aggro_grab_instead_same_tile = FALSE

/decl/sex_action/vaginal_ride_sex/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/decl/sex_action/vaginal_ride_sex/can_perform(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/decl/sex_action/vaginal_ride_sex/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] gets on top of [target] and begins riding [target.p_them()] with [user.p_their()] cunt!"))
	playsound(target, list('mods/content/sexcon/sounds/mat/insert (1).ogg','mods/content/sexcon/sounds/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/decl/sex_action/vaginal_ride_sex/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rides [target]."))
	playsound(target, 'mods/content/sexcon/sounds/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)

	if(target.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 1.2, 3, TRUE)
	else
		user.sexcon.perform_sex_action(target, 2.4, 7, TRUE)
	user.sexcon.handle_passive_ejaculation()

	user.sexcon.perform_sex_action(target, 2, 4, FALSE)
	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_love("[target] cums into [user]'s cunt!"))
		target.sexcon.cum_into()
		target.try_impregnate(user)
		target.virginity = FALSE
		user.virginity = FALSE

/decl/sex_action/vaginal_ride_sex/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] gets off [target]."))

/decl/sex_action/vaginal_ride_sex/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
