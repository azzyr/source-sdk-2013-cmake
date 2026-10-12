# targets.cmake

include_guard(GLOBAL)

function(source_files var)
	set(files)
	set(genex_path "^(\\$<.*:)([^:]+)>$")
	set(genex_prefix "^\\\$<")

	foreach(file IN LISTS ARGN)
		string(REGEX MATCH "${genex_path}" genex "${file}")

		if (genex AND NOT IS_ABSOLUTE "${CMAKE_MATCH_2}")
			set(file "${CMAKE_MATCH_1}${CMAKE_CURRENT_LIST_DIR}/${CMAKE_MATCH_2}>")
		elseif (NOT file MATCHES "${genex_prefix}" AND NOT IS_ABSOLUTE "${file}")
			set(file "${CMAKE_CURRENT_LIST_DIR}/${file}")
		endif()

		list(APPEND files "${file}")
	endforeach()

	set(${var} "${files}" PARENT_SCOPE)
endfunction()

function(source_add_executable target)
	cmake_parse_arguments(PARSE_ARGV 1 ARG "WIN32;NO_MEMOVERRIDE;NO_TIER_LIBS" "OUTPUT_NAME;OUTPUT_DIR" "")
	source_files(sources ${ARG_UNPARSED_ARGUMENTS})

	if (ARG_WIN32)
		add_executable(${target} WIN32 ${sources})
	else()
		add_executable(${target} ${sources})
	endif()

	target_link_libraries(${target} PRIVATE source_exe)
	_source_setup_binary(${target} RUNTIME)
endfunction()

function(source_add_module target)
	cmake_parse_arguments(PARSE_ARGV 1 ARG "NO_MEMOVERRIDE;NO_TIER_LIBS" "OUTPUT_NAME;OUTPUT_DIR" "")
	source_files(sources ${ARG_UNPARSED_ARGUMENTS})

	add_library(${target} MODULE ${sources})

	target_link_libraries(${target} PRIVATE source_dll)
	_source_setup_binary(${target} LIBRARY)
endfunction()

function(source_add_library target)
	source_files(sources ${ARGN})

	add_library(${target} STATIC ${sources})

	if (MSVC)
		set_target_properties(${target} PROPERTIES MSVC_DEBUG_INFORMATION_FORMAT "${STATIC_LIB_DEBUG_INFORMATION_FORMAT}")
	endif()

	target_link_libraries(${target} PRIVATE source_lib)
endfunction()

macro(_source_setup_binary target output_kind)
	if (ARG_OUTPUT_NAME)
		set_target_properties(${target} PROPERTIES OUTPUT_NAME "${ARG_OUTPUT_NAME}")
	endif()

	if (ARG_OUTPUT_DIR)
		set_target_properties(${target} PROPERTIES ${output_kind}_OUTPUT_DIRECTORY "$<1:${ARG_OUTPUT_DIR}>")
	endif()

	if (NOT ARG_NO_MEMOVERRIDE)
		target_link_libraries(${target} PRIVATE source_memoverride)
	endif()

	if (NOT ARG_NO_TIER_LIBS)
		set_property(GLOBAL APPEND PROPERTY SOURCE_TIER_LIB_TARGETS ${target})
	endif()

	target_strip_symbols(${target})
endmacro()
