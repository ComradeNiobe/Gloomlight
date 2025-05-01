/decl/modpack/sexcon
	name = "Sex Controller Content"

/decl/config/toggle/sexcon
	uid = "toggle_sexcon"
	desc = "Remove the # to enable sex mechanics."

/decl/config/toggle/sexcon/Initialize()
	// Init decls repository for sex actions.
	decls_repository.get_decls_of_subtype(/decl/sex_action)
	return ..()

/datum/client_preference/sexable
	description = "Sex Mechanics"
	key = "SEXCON_TOGGLE"
	options = list(PREF_NO, PREF_YES)

/// DEFINES ///

#define SEX_ACTION(sex_action_type) RESOLVE_TO_DECL(sex_action_type)

#define MAX_AROUSAL 150
#define PASSIVE_EJAC_THRESHOLD 108
#define ACTIVE_EJAC_THRESHOLD 100
#define SEX_MAX_CHARGE 300
#define CHARGE_FOR_CLIMAX 100
#define AROUSAL_HARD_ON_THRESHOLD 20
#define CHARGE_RECHARGE_RATE (CHARGE_FOR_CLIMAX / (5 MINUTES))
#define AROUSAL_TIME_TO_UNHORNY (5 SECONDS)
#define SPENT_AROUSAL_RATE (3 / (1 SECONDS))
#define IMPOTENT_AROUSAL_LOSS_RATE (3 / (1 SECONDS))

#define AROUSAL_HIGH_UNHORNY_RATE (1.5 / (1 SECONDS))
#define AROUSAL_MID_UNHORNY_RATE (0.4 / (1 SECONDS))
#define AROUSAL_LOW_UNHORNY_RATE (0.2 / (1 SECONDS))

#define MOAN_COOLDOWN 3 SECONDS
#define PAIN_COOLDOWN 6 SECONDS

#define SEX_SPEED_LOW 1
#define SEX_SPEED_MID 2
#define SEX_SPEED_HIGH 3
#define SEX_SPEED_EXTREME 4

#define SEX_SPEED_MIN 1
#define SEX_SPEED_MAX 4

#define SEX_FORCE_LOW 1
#define SEX_FORCE_MID 2
#define SEX_FORCE_HIGH 3
#define SEX_FORCE_EXTREME 4

#define SEX_FORCE_MIN 1
#define SEX_FORCE_MAX 4

#define BLUEBALLS_GAIN_THRESHOLD 40
#define BLUEBALLS_LOOSE_THRESHOLD 35

#define PAIN_MILD_EFFECT 10
#define PAIN_MED_EFFECT 20
#define PAIN_HIGH_EFFECT 30
#define PAIN_MINIMUM_FOR_DAMAGE PAIN_MED_EFFECT
#define PAIN_DAMAGE_DIVISOR 50

// SEX SOUND LISTS //
var/global/list/sex_moan_heavy = list(
	'mods/content/sexcon/sounds/voices/female/sex/sex (1).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sex (2).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sex (3).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sex (4).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sex (5).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sex (6).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sex (7).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sex (8).ogg'
)
var/global/list/sex_moan_light = list(
	'mods/content/sexcon/sounds/voices/female/sex/sexlight (1).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sexlight (2).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sexlight (3).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sexlight (4).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sexlight (5).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sexlight (6).ogg',
	'mods/content/sexcon/sounds/voices/female/sex/sexlight (7).ogg'
)