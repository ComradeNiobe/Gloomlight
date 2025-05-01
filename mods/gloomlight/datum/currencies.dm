/decl/currency/imperial
	name = "\improper Imperial solidi"
	name_prefix = "¢"

/decl/currency/imperial/build_denominations()
	denominations = list(
		new /datum/denomination/coin/solidus(src, 125, null, COLOR_GOLD),
		new /datum/denomination/coin/solidus/miliaresion(src, 5, null, COLOR_SILVER),
		new /datum/denomination/coin/solidus/follis(src, 1, null, COLOR_BRONZE)
	)
	..()

/datum/denomination/coin/solidus
	name = "\improper Imperial solidus"
	faces = list("obverse", "reverse")

/datum/denomination/coin/solidus/New(decl/currency/_currency, value, value_name, colour)
	. = ..()
	name = initial(name) // Awful, evil, terrible.

/datum/denomination/coin/solidus/miliaresion
	name = "\improper Imperial miliaresion"

/datum/denomination/coin/solidus/follis
	name = "\improper Imperial follis"

/obj/item/cash/imperial
	abstract_type = /obj/item/cash/imperial
	currency = /decl/currency/imperial

/obj/item/cash/imperial/follis
	absolute_worth = 1
	icon_state = "coin"
	color = COLOR_BRONZE

/obj/item/cash/imperial/miliaresion
	absolute_worth = 5
	icon_state = "coin_medium"
	color = COLOR_SILVER

/obj/item/cash/imperial/solidus
	absolute_worth = 125
	icon_state = "coin_large"
	color = COLOR_GOLD

/decl/stack_recipe/coin/imperial
	currency = /decl/currency/imperial
	name = "\improper Imperial follis"

/decl/stack_recipe/coin/imperial/medium
	name = "\improper Imperial miliaresion"

/decl/stack_recipe/coin/imperial/huge
	name = "\improper Imperial solidus"
