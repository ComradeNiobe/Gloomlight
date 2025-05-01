// SCREEN OVERLAYS //

/obj/screen/fullscreen/love
	icon_state = "lovehud"
	layer = CRIT_LAYER
	alpha = 0

/obj/screen/fullscreen/love/Initialize(mapload, mob/_owner, ui_style, ui_color, ui_alpha)
	. = ..()
	animate(src, alpha = 255, time = 30)

// MOB HELPERS //

/mob/living/human
	var/can_do_sex = TRUE
	var/virginity = FALSE
	/// Whether the mob is actively conducting a sex act.
	var/doing = FALSE
	var/datum/sex_controller/sexcon

/mob/living/human/Initialize(mapload, species_uid, datum/mob_snapshot/supplied_appearance)
	. = ..()
	if(get_config_value(/decl/config/toggle/sexcon))
		sexcon = new(src)

/mob/living/human/Destroy()
	. = ..()
	QDEL_NULL(sexcon)

/mob/living/human/verb/start_sexcon()
	set name = "Start Sexcon"
	set category = "IC"
	set src in view(1)

	var/mob/living/human/user = usr
	var/mob/living/human/target = src

	//if(user.mmb_intent)
	//	return ..()
	if(!istype(user) || !istype(target))
		return
	if(!user.can_do_sex())
		to_chat(user, SPAN_WARNING("I can't do this.</span>"))
		return
	if(!target.client?.prefs || (target.get_preference_value(/datum/client_preference/sexable) == PREF_NO)) // Don't bang someone that dosn't want it.
		to_chat(user, SPAN_WARNING("[target] dosn't wish to be touched. (Their ERP preference under options)"))
		to_chat(src, SPAN_WARNING("[user] failed to touch you. (Your ERP preference under options)"))
		return
	user.sexcon.start(target)

/mob/living/proc/can_do_sex()
	return TRUE

/mob/living/human/proc/make_sucking_noise()
	var/pronoun_gender = get_gender()

	if(pronoun_gender == MALE)
		playsound(src, pick('mods/content/sexcon/sounds/mat/guymouth (1).ogg','mods/content/sexcon/sounds/mat/guymouth (2).ogg','mods/content/sexcon/sounds/mat/guymouth (3).ogg','mods/content/sexcon/sounds/mat/guymouth (4).ogg','mods/content/sexcon/sounds/mat/guymouth (5).ogg'), 35, TRUE, ignore_walls = FALSE)
	else
		playsound(src, pick('mods/content/sexcon/sounds/mat/girlmouth (1).ogg','mods/content/sexcon/sounds/mat/girlmouth (2).ogg'), 25, TRUE, ignore_walls = FALSE)

/mob/living/human/proc/try_impregnate(mob/living/human/wife)
	return

	/*
	var/obj/item/organ/testicles/testes = getorganslot(ORGAN_SLOT_TESTICLES)
	if(!testes)
		return
	var/obj/item/organ/vagina/vag = wife.getorganslot(ORGAN_SLOT_VAGINA)
	if(!vag)
		return
	if(prob(25) && wife.is_fertile() && is_virile())
		vag.be_impregnated(src)
	*/

/proc/add_cum_floor(turfu)
	return

	/*
	if(!turfu || !isturf(turfu))
		return
	new /obj/effect/decal/cleanable/coom(turfu)
	*/