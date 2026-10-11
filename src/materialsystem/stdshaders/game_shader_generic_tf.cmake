# game_shader_generic_tf.cmake

include( "${CMAKE_CURRENT_LIST_DIR}/game_shader_generic_base.cmake")

source_add_module(game_shader_generic_tf
	OUTPUT_DIR "${GAMEDIR}/mod_tf/bin${PLATSUBDIR}"
)

target_use_game_shader_generic_base(game_shader_generic_tf)