# prebuilt_libs.cmake

foreach(lib appframework bitmap choreoobjects dmxloader particles shaderlib tier2 tier3 vtf)
	add_library(${lib} STATIC IMPORTED)
	set_target_properties(${lib} PROPERTIES IMPORTED_LOCATION "${LIBPUBLIC}/${lib}${STATIC_LIB_EXT}")
endforeach()

foreach(lib lzma)
	add_library(${lib} STATIC IMPORTED)
	set_target_properties(${lib} PROPERTIES IMPORTED_LOCATION "${LIBCOMMON}/${lib}${STATIC_LIB_EXT}")
endforeach()

foreach(lib tier0 vstdlib steam_api)
	add_library(${lib} SHARED IMPORTED)
endforeach()

if (IS_WINDOWS)
	set_target_properties(tier0 PROPERTIES IMPORTED_IMPLIB "${LIBPUBLIC}/tier0.lib")
	set_target_properties(vstdlib PROPERTIES IMPORTED_IMPLIB "${LIBPUBLIC}/vstdlib.lib")
	set_target_properties(steam_api PROPERTIES IMPORTED_IMPLIB "${LIBPUBLIC}/steam_api64.lib")

	add_library(libz STATIC IMPORTED)
	set_target_properties(libz PROPERTIES IMPORTED_LOCATION "${LIBPUBLIC}/libz.lib")
else()
	# without a soname these have to be linked by name
	foreach(lib tier0 vstdlib)
		set_target_properties(${lib} PROPERTIES IMPORTED_LOCATION "${LIBPUBLIC}/lib${lib}.so" IMPORTED_NO_SONAME ON)
	endforeach()
	set_target_properties(steam_api PROPERTIES IMPORTED_LOCATION "${LIBPUBLIC}/libsteam_api.so")

	add_library(libz INTERFACE IMPORTED)
	set_target_properties(libz PROPERTIES INTERFACE_LINK_LIBRARIES z)
endif()
