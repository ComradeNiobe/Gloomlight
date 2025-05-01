/decl/species/human/vampire
	uid = "species_vampire"
	name = "Vampire"
	name_plural = "Vampires"
	primitive_form = /decl/species/monkey::uid
	description = "A cursed human doomed to an existence of unlife."
	hidden_from_codex = TRUE
	spawn_flags = SPECIES_CAN_JOIN
	inherent_verbs = list(/mob/living/human/proc/tie_hair)

	available_bodytypes = list(
		/decl/bodytype/vampire,
		/decl/bodytype/vampire/masculine
	)

	exertion_effect_chance = 10
	exertion_hydration_scale = 1
	exertion_charge_scale = 1
	exertion_reagent_scale = 1
	exertion_reagent_path = /decl/material/liquid/lactate
	exertion_emotes_biological = list(
		/decl/emote/exertion/biological,
		/decl/emote/exertion/biological/breath,
		/decl/emote/exertion/biological/pant
	)

	body_temperature = null
	blood_oxy = 0

/decl/species/human/get_ssd(var/mob/living/human/H)
	if(H.stat == CONSCIOUS)
		return "staring blankly, not reacting to your presence"
	return ..()

/decl/species/human/equip_default_fallback_uniform(var/mob/living/human/H)
	if(istype(H))
		H.equip_to_slot_or_del(new /obj/item/clothing/jumpsuit/grey, slot_w_uniform_str)
