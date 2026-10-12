# groups.cmake

if (BUILD_GROUP MATCHES "^(game|everything|dedicated)$")
	include("${SRCDIR}/game/server/server_${BUILD_GAME}.cmake")
endif()

if (BUILD_GROUP MATCHES "^(game|everything)$")
	include("${SRCDIR}/game/client/client_${BUILD_GAME}.cmake")
	include("${SRCDIR}/launcher_main/launcher_main_mod_${BUILD_GAME}.cmake")

	include("${SRCDIR}/vgui2/matsys_controls/matsys_controls.cmake")
	include("${SRCDIR}/raytrace/raytrace.cmake")
	include("${SRCDIR}/vgui2/vgui_controls/vgui_controls.cmake")
endif()

if (BUILD_GROUP MATCHES "^(shaders|everything)$")
	include("${SRCDIR}/materialsystem/stdshaders/game_shader_generic_${BUILD_GAME}.cmake")
endif()

if (BUILD_GROUP STREQUAL "everything")
	include("${SRCDIR}/utils/serverplugin_sample/serverplugin_empty.cmake")

	if (IS_WINDOWS)
		include("${SRCDIR}/utils/captioncompiler/captioncompiler.cmake")
		include("${SRCDIR}/utils/glview/glview.cmake")
		include("${SRCDIR}/utils/height2normal/height2normal.cmake")
		include("${SRCDIR}/utils/motionmapper/motionmapper.cmake")
		include("${SRCDIR}/utils/qc_eyes/qc_eyes.cmake")
		include("${SRCDIR}/utils/tgadiff/tgadiff.cmake")
		include("${SRCDIR}/utils/vbsp/vbsp.cmake")
		include("${SRCDIR}/utils/vice/vice.cmake")
		include("${SRCDIR}/utils/vrad/vrad_dll.cmake")
		include("${SRCDIR}/utils/vrad_launcher/vrad_launcher.cmake")
		include("${SRCDIR}/utils/vtf2tga/vtf2tga.cmake")
		include("${SRCDIR}/utils/vtfdiff/vtfdiff.cmake")
		include("${SRCDIR}/utils/vvis/vvis_dll.cmake")
		include("${SRCDIR}/utils/vvis_launcher/vvis_launcher.cmake")

		include("${SRCDIR}/fgdlib/fgdlib.cmake")
	endif()
endif()

include("${SRCDIR}/mathlib/mathlib.cmake")
include("${SRCDIR}/tier1/tier1.cmake")
