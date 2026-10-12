set(VVIS_LAUNCHER_DIR ${CMAKE_CURRENT_LIST_DIR})
source_add_executable(vvis_launcher
	OUTPUT_NAME vvis
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"

	vvis_launcher.cpp
	StdAfx.cpp

	# Header Files
	"${SRCDIR}/public/tier1/interface.h"
	StdAfx.h
)

target_precompile_headers(
	vvis_launcher PRIVATE
	"${VVIS_LAUNCHER_DIR}/StdAfx.h"
)

target_include_directories(
	vvis_launcher PRIVATE
	"${SRCDIR}/utils/common"
)

target_link_options(
	vvis_launcher PRIVATE
	/LARGEADDRESSAWARE
)

target_link_libraries(
	vvis_launcher PRIVATE
)