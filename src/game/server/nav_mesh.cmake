# nav_mesh.cmake

include_guard(GLOBAL)

source_files(
	NAV_MESH_SOURCE_FILES
	nav.h
	nav_area.cpp
	nav_area.h
	nav_colors.cpp
	nav_colors.h
	nav_edit.cpp
	nav_entities.cpp
	nav_entities.h
	nav_file.cpp
	nav_generate.cpp
	nav_ladder.cpp
	nav_ladder.h
	nav_merge.cpp
	nav_mesh.cpp
	nav_mesh.h
	nav_mesh_factory.cpp
	nav_node.cpp
	nav_node.h
	nav_pathfind.h
	nav_simplify.cpp
)

function(target_use_nav_mesh target)
	target_sources(
		${target} PRIVATE
		${NAV_MESH_SOURCE_FILES}
	)
	target_compile_definitions(
		${target} PRIVATE
		USE_NAV_MESH
	)
endfunction()