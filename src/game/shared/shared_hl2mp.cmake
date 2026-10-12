# shared_hl2mp.cmake

include_guard(DIRECTORY)

source_files(
	SHARED_HL2MP_SOURCE_FILES

	# Source Files
	hl2/basehlcombatweapon_shared.cpp
	hl2/env_headcrabcanister_shared.cpp
	hl2/hl2_gamerules.cpp
	hl2/hl2_usermessages.cpp
	hl2/hl_gamemovement.cpp
	hl2mp/hl2mp_gamerules.cpp
	hl2mp/hl2mp_player_shared.cpp
	hl2mp/hl2mp_weapon_parse.cpp
	hl2mp/weapon_357.cpp
	hl2mp/weapon_ar2.cpp
	hl2mp/weapon_crossbow.cpp
	hl2mp/weapon_crowbar.cpp
	hl2mp/weapon_frag.cpp
	hl2mp/weapon_hl2mpbase.cpp
	hl2mp/weapon_hl2mpbase_machinegun.cpp
	hl2mp/weapon_hl2mpbasebasebludgeon.cpp
	hl2mp/weapon_hl2mpbasehlmpcombatweapon.cpp
	hl2mp/weapon_physcannon.cpp
	hl2mp/weapon_pistol.cpp
	hl2mp/weapon_rpg.cpp
	hl2mp/weapon_shotgun.cpp
	hl2mp/weapon_slam.cpp
	hl2mp/weapon_smg1.cpp
	hl2mp/weapon_stunstick.cpp
	predicted_viewmodel.cpp
	script_intro_shared.cpp
	teamplay_round_timer.cpp

	# Header Files
	hl2/citadel_effects_shared.h
	hl2/env_headcrabcanister_shared.h
	hl2/hl2_gamerules.h
	hl2/hl2_shareddefs.h
	hl2/hl_gamemovement.h
	hl2mp/hl2mp_gamerules.h
	hl2mp/hl2mp_player_shared.h
	hl2mp/hl2mp_weapon_parse.h
	hl2mp/weapon_ar2.h
	hl2mp/weapon_hl2mpbase.h
	hl2mp/weapon_hl2mpbase_machinegun.h
	hl2mp/weapon_hl2mpbasehlmpcombatweapon.h
	hl2mp/weapon_physcannon.h
	hl2mp/weapon_rpg.h
	hl2mp/weapon_slam.h
	predicted_viewmodel.h
	teamplay_round_timer.h
)
