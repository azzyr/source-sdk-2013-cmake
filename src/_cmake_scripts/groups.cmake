# groups.cmake

set(GROUP_SERVER "game" "everything" "dedicated")
set(GROUP_CLIENT "game" "everything")
set(GROUP_SHADERS "shaders" "everything")

if (BUILD_GROUP IN_LIST GROUP_SERVER)
	add_subdirectory(game/server)
endif()

if (BUILD_GROUP IN_LIST GROUP_CLIENT)
	add_subdirectory(game/client)
	add_subdirectory(launcher_main)

	add_subdirectory(vgui2/matsys_controls)
	add_subdirectory(raytrace)
	add_subdirectory(vgui2/vgui_controls)
endif()

if (BUILD_GROUP IN_LIST GROUP_SHADERS)
	add_subdirectory(materialsystem/stdshaders)
endif()

if (BUILD_GROUP STREQUAL "everything")
	add_subdirectory(utils/serverplugin_sample)

	if (IS_WINDOWS)
		add_subdirectory(utils/captioncompiler)
		add_subdirectory(utils/glview)
		add_subdirectory(utils/height2normal)
		add_subdirectory(utils/motionmapper)
		add_subdirectory(utils/tgadiff)
		add_subdirectory(utils/vbsp)
		add_subdirectory(utils/vice)
		add_subdirectory(utils/vrad)
		add_subdirectory(utils/vrad_launcher)
		add_subdirectory(utils/vtf2tga)
		add_subdirectory(utils/vtfdiff)
		add_subdirectory(utils/vvis)
		add_subdirectory(utils/vvis_launcher)

		add_subdirectory(fgdlib)

		find_package(MFC)
		if (MFC_FOUND)
			add_subdirectory(utils/qc_eyes)
		endif()
	endif()
endif()

add_subdirectory(mathlib)
add_subdirectory(tier1)
