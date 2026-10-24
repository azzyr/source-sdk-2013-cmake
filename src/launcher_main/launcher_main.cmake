# launcher_main.cmake

include_guard(DIRECTORY)

set(LAUNCHER_MAIN_DIR ${CMAKE_CURRENT_LIST_DIR})

function(add_launcher_main target mod appid)
	if (IS_WINDOWS)
		set(OUTPUT_SUFFIX "_win64")
	else()
		set(OUTPUT_SUFFIX "_linux64")
	endif()

	source_add_executable(${target}
		WIN32
		OUTPUT_NAME "${mod}${OUTPUT_SUFFIX}"
		OUTPUT_DIR "${GAMEDIR}"
		NO_MEMOVERRIDE
		NO_TIER_LIBS

		"${LAUNCHER_MAIN_DIR}/main.cpp"
		"$<${IS_WINDOWS}:${LAUNCHER_MAIN_DIR}/launcher_main_${mod}.rc>"
	)

	set_property(TARGET ${target} PROPERTY DEBUGGER_WORKING_DIRECTORY "${GAMEDIR}")

	target_compile_definitions(
		${target} PRIVATE
		MOD_LAUNCHER
		MOD_APPID=${appid}
	)

	target_link_libraries(
		${target} PRIVATE
		$<${IS_LINUX}:SDL2>
	)
endfunction()
