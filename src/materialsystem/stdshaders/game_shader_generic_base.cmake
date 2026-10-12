# game_shader_generic_base.cmake

include_guard(GLOBAL)

set(GAME_SHADER_GENERIC_BASE_DIR ${CMAKE_CURRENT_LIST_DIR})
source_files(
	GAME_SHADER_GENERIC_BASE_SOURCE_FILES
	BaseVSShader.cpp

	example_model_dx9.cpp
	example_model_dx9_helper.cpp

	sdk_bloom.cpp
	sdk_screenspace_general.cpp

	# Header Files
	BaseVSShader.h
	common_fxc.h
	common_hlsl_cpp_consts.h
	common_ps_fxc.h
	common_vertexlitgeneric_dx9.h
	common_vs_fxc.h
	shader_constant_register_map.h

	example_model_dx9_helper.h

	# Miscellaneous
	buildsdkshaders.bat
	buildshaders.bat

	sdkshaders_dx9_20b.txt
	sdkshaders_dx9_30.txt
)

function(target_use_game_shader_generic_base target)
	target_sources(
		${target} PRIVATE
		${GAME_SHADER_GENERIC_BASE_SOURCE_FILES}
	)

	target_include_directories(
		${target} PRIVATE
		"${GAME_SHADER_GENERIC_BASE_DIR}/include"
	)

	target_compile_definitions(
		${target} PRIVATE
		STDSHADER_DX9_DLL_EXPORT
		FAST_MATERIALVAR_ACCESS
		GAME_SHADER_DLL
		$<${IS_WINDOWS}:USE_ACTUAL_DX>
	)

	target_link_libraries(
		${target} PRIVATE
		"$<${IS_WINDOWS}:version;winmm>"
		mathlib
		shaderlib
		tier2
	)
endfunction()