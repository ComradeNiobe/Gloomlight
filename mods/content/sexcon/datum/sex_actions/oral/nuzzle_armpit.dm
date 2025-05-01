/decl/sex_action/armpit_nuzzle
	name = "Nuzzle their armpit"
	uid = "sexcon_oral_armpitnuzzle"

/decl/sex_action/armpit_nuzzle/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	return TRUE

/decl/sex_action/armpit_nuzzle/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_CHEST))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/decl/sex_action/armpit_nuzzle/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] moves [user.p_their()] head against [target]'s armpit..."))

/decl/sex_action/armpit_nuzzle/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] nuzzles [target]'s armpit..."))

/decl/sex_action/armpit_nuzzle/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] stops nuzzling [target]'s armpit..."))
