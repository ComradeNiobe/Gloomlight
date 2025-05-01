/decl/sex_action/force_suck_nipples
	name = "Force them to suck nipples"
	require_grab = TRUE
	stamina_cost = 1.0

/decl/sex_action/force_suck_nipples/shows_on_menu(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_BREASTS))
		return FALSE
	return TRUE

/decl/sex_action/force_suck_nipples/can_perform(mob/living/human/user, mob/living/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_CHEST, TRUE))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_BREASTS))
		return FALSE
	return TRUE

/decl/sex_action/force_suck_nipples/on_start(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] forces [target]'s head down to swallow and suck on [user.p_their()] nipples!"))
	playsound(target, list('mods/content/sexcon/sounds/mat/insert (1).ogg','mods/content/sexcon/sounds/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/decl/sex_action/force_suck_nipples/on_perform(mob/living/human/user, mob/living/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to suck [user.p_their()] nipples."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)

	user.sexcon.perform_sex_action(target, 0, 7, FALSE)
	if(!user.sexcon.considered_limp())
		user.sexcon.perform_deepthroat_oxyloss(target, 0.6)
	target.sexcon.handle_passive_ejaculation()

	var/obj/item/organ/breasts/breasts = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/milk_to_add = min(max(breasts.breast_size, 1), breasts.milk_stored)
	if(breasts.lactating && milk_to_add > 0 && prob(25))
		target.reagents.add_reagent(/datum/reagent/consumable/milk, milk_to_add)
		breasts.milk_stored -= milk_to_add
		to_chat(target, span_notice("I can taste milk."))
		to_chat(user, span_notice("I can feel milk leak from my buds."))

/decl/sex_action/force_suck_nipples/on_finish(mob/living/human/user, mob/living/human/target)
	user.visible_message(span_warning("[user] pulls [user.p_their()] nipples out of [target]'s mouth."))

/decl/sex_action/force_suck_nipples/is_finished(mob/living/human/user, mob/living/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
