# shared_hl2mp.cmake

include_guard(GLOBAL)

set(
	SHARED_HL2MP_SOURCE_FILES

	# Source Files
	"${SRCDIR}/game/shared/hl2/basehlcombatweapon_shared.cpp"
	"${SRCDIR}/game/shared/hl2/env_headcrabcanister_shared.cpp"
	"${SRCDIR}/game/shared/hl2/hl2_gamerules.cpp"
	"${SRCDIR}/game/shared/hl2/hl2_usermessages.cpp"
	"${SRCDIR}/game/shared/hl2/hl_gamemovement.cpp"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_gamerules.cpp"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_player_shared.cpp"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_weapon_parse.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_357.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_ar2.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_crossbow.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_crowbar.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_frag.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbase.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbase_machinegun.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbasebasebludgeon.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbasehlmpcombatweapon.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_physcannon.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_pistol.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_rpg.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_shotgun.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_slam.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_smg1.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_stunstick.cpp"
	"${SRCDIR}/game/shared/predicted_viewmodel.cpp"
	"${SRCDIR}/game/shared/script_intro_shared.cpp"
	"${SRCDIR}/game/shared/teamplay_round_timer.cpp"

	# Header Files
	"${SRCDIR}/game/shared/hl2/citadel_effects_shared.h"
	"${SRCDIR}/game/shared/hl2/env_headcrabcanister_shared.h"
	"${SRCDIR}/game/shared/hl2/hl2_gamerules.h"
	"${SRCDIR}/game/shared/hl2/hl2_shareddefs.h"
	"${SRCDIR}/game/shared/hl2/hl_gamemovement.h"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_gamerules.h"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_player_shared.h"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_weapon_parse.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_ar2.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbase.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbase_machinegun.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbasehlmpcombatweapon.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_physcannon.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_rpg.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_slam.h"
	"${SRCDIR}/game/shared/predicted_viewmodel.h"
	"${SRCDIR}/game/shared/teamplay_round_timer.h"
)
