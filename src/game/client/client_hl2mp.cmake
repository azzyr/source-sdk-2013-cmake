# client_hl2mp.cmake

include("${CMAKE_CURRENT_LIST_DIR}/client_base.cmake")
include("${SRCDIR}/game/shared/shared_hl2mp.cmake")

set(CLIENT_HL2MP_DIR ${CMAKE_CURRENT_LIST_DIR})
source_add_module(client_hl2mp
	OUTPUT_NAME client
	OUTPUT_DIR "${GAMEDIR}/mod_hl2mp/bin${PLATSUBDIR}"

	${SHARED_HL2MP_SOURCE_FILES}

	# Source Files
	c_team_objectiveresource.cpp
	c_team_objectiveresource.h
	c_team_train_watcher.cpp
	c_team_train_watcher.h
	hud_voicestatus.cpp

	# NextBot
	NextBot/C_NextBot.cpp
	NextBot/C_NextBot.h

	# HL2 DLL
	episodic/c_vort_charge_token.cpp
	hl2/c_antlion_dust.cpp
	hl2/c_ar2_explosion.cpp
	hl2/c_barnacle.cpp
	hl2/c_barney.cpp
	hl2/c_basehelicopter.cpp
	hl2/c_basehelicopter.h
	hl2/c_basehlcombatweapon.cpp
	hl2/c_basehlcombatweapon.h
	hl2/c_basehlplayer.cpp
	hl2/c_basehlplayer.h
	hl2/c_citadel_effects.cpp
	hl2/c_corpse.cpp
	hl2/c_corpse.h
	hl2/c_env_alyxtemp.cpp
	hl2/c_env_headcrabcanister.cpp
	hl2/c_env_starfield.cpp
	hl2/c_func_tankmortar.cpp
	hl2/c_hl2_playerlocaldata.cpp
	hl2/c_hl2_playerlocaldata.h
	hl2/c_info_teleporter_countdown.cpp
	hl2/c_npc_antlionguard.cpp
	hl2/c_npc_combinegunship.cpp
	hl2/c_npc_manhack.cpp
	hl2/c_npc_rollermine.cpp
	hl2/c_plasma_beam_node.cpp
	hl2/c_prop_combine_ball.cpp
	hl2/c_prop_combine_ball.h
	hl2/c_rotorwash.cpp
	hl2/c_script_intro.cpp
	hl2/c_strider.cpp
	hl2/c_te_concussiveexplosion.cpp
	hl2/c_te_flare.cpp
	hl2/c_thumper_dust.cpp
	hl2/c_vehicle_airboat.cpp
	hl2/c_vehicle_cannon.cpp
	hl2/c_vehicle_crane.cpp
	hl2/c_vehicle_crane.h
	hl2/c_vehicle_prisoner_pod.cpp
	hl2/c_weapon__stubs_hl2.cpp
	hl2/c_weapon_crossbow.cpp
	hl2/fx_antlion.cpp
	hl2/fx_bugbait.cpp
	hl2/fx_hl2_impacts.cpp
	hl2/fx_hl2_tracers.cpp
	hl2/hl2_clientmode.cpp
	hl2/hl_in_main.cpp
	hl2/hl_prediction.cpp
	hl2/hud_ammo.cpp
	hl2/hud_autoaim.cpp
	hl2/hud_battery.cpp
	hl2/hud_blood.cpp
	hl2/hud_credits.cpp
	hl2/hud_damageindicator.cpp
	hl2/hud_flashlight.cpp
	hl2/hud_health.cpp
	hl2/hud_poisondamageindicator.cpp
	hl2/hud_quickinfo.cpp
	hud_squadstatus.cpp
	hl2/hud_suitpower.cpp
	hl2/hud_suitpower.h
	hl2/hud_weaponselection.cpp
	hl2/hud_zoom.cpp
	hl2/shieldproxy.cpp
	hl2/vgui_rootpanel_hl2.cpp

	# HL2MP
	hl2mp/c_hl2mp_player.cpp
	hl2mp/c_hl2mp_player.h
	hl2mp/c_te_hl2mp_shotgun_shot.cpp
	hl2mp/clientmode_hl2mpnormal.cpp
	hl2mp/clientmode_hl2mpnormal.h

	# HL2MP->UI
	hl2mp/ui/backgroundpanel.cpp
	hl2mp/ui/backgroundpanel.h
	hl2mp/hl2mp_hud_chat.cpp
	hl2mp/hl2mp_hud_chat.h
	hl2mp/hl2mp_hud_target_id.cpp
	hl2mp/hl2mp_hud_team.cpp
	hl2mp/ui/hl2mpclientscoreboard.cpp
	hl2mp/ui/hl2mpclientscoreboard.h
	hl2mp/ui/hl2mptextwindow.cpp
	hl2mp/ui/hl2mptextwindow.h
	hl2mp/hud_deathnotice.cpp
)

target_use_client_base(client_hl2mp EXCLUDE "${SRCDIR}/game/shared/weapon_parse_default.cpp")

target_include_directories(
	client_hl2mp PRIVATE
	"${CLIENT_HL2MP_DIR}/hl2mp/ui"
	"${CLIENT_HL2MP_DIR}/hl2mp"
	"${SRCDIR}/game/shared/hl2mp"
	"${CLIENT_HL2MP_DIR}/hl2"
	"${CLIENT_HL2MP_DIR}/hl2/elements"
	"${SRCDIR}/game/shared/hl2"
)

target_compile_definitions(
	client_hl2mp PRIVATE
	HL2MP
	HL2_CLIENT_DLL
	NEXT_BOT
)