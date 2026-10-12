set(VRAD_LAUNCHER_DIR ${CMAKE_CURRENT_LIST_DIR})
source_add_executable(vrad_launcher
	OUTPUT_NAME vrad
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"
	NO_MEMOVERRIDE

	vrad_launcher.cpp
	StdAfx.cpp

	# Header Files
	"${SRCDIR}/public/tier1/interface.h"
	"${SRCDIR}/public/ivraddll.h"
	StdAfx.h
)

target_precompile_headers(
	vrad_launcher PRIVATE
	"${VRAD_LAUNCHER_DIR}/stdafx.h"
)

target_link_options(
	vrad_launcher PRIVATE
	/LARGEADDRESSAWARE
)