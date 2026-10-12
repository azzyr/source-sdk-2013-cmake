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
	_source_group_directory()
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
		set_source_files_properties("${SRCDIR}/public/tier0/memoverride.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
	endif()

	if (NOT ARG_NO_TIER_LIBS)
		set_property(GLOBAL APPEND PROPERTY SOURCE_TIER_LIB_TARGETS ${target})
	endif()

	target_strip_symbols(${target})
	_source_group_directory()
endmacro()

# source groups only apply to their own directory, so mirror the source tree at the end of each one
function(_source_group_directory)
	cmake_language(DEFER GET_CALL source_groups call)
	if (NOT call)
		cmake_language(DEFER ID source_groups CALL _source_group_tree)
	endif()
endfunction()

function(_source_group_tree)
	get_property(targets DIRECTORY PROPERTY BUILDSYSTEM_TARGETS)
	set(sources "${SRCDIR}/public/tier0/memoverride.cpp")

	foreach(target IN LISTS targets)
		get_target_property(target_sources ${target} SOURCES)
		if (target_sources)
			list(APPEND sources ${target_sources})
		endif()
	endforeach()

	string(REGEX QUOTE srcdir_regex "${SRCDIR}/")
	set(tree_sources ${sources})
	list(FILTER tree_sources INCLUDE REGEX "${srcdir_regex}")
	list(TRANSFORM tree_sources REPLACE "^.*(${srcdir_regex}[^>]*).*$" "\\1")
	list(REMOVE_DUPLICATES tree_sources)
	source_group(TREE "${SRCDIR}" FILES ${tree_sources})

	string(REGEX QUOTE bindir_regex "${CMAKE_CURRENT_BINARY_DIR}/")
	set(generated_sources ${sources})
	list(FILTER generated_sources INCLUDE REGEX "^${bindir_regex}")
	if (generated_sources)
		source_group(TREE "${CMAKE_CURRENT_BINARY_DIR}" PREFIX "Generated" FILES ${generated_sources})
	endif()
endfunction()
