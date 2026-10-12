source_add_executable(height2normal
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"
	NO_MEMOVERRIDE

	height2normal.cpp

	# Header Files
	"${SRCDIR}/public/tier1/interface.h"
	"${SRCDIR}/public/tier1/utlbuffer.h"
)

target_include_directories(
	height2normal PRIVATE
	"${SRCDIR}/utils/common"
)

target_link_libraries(
	height2normal PRIVATE

	bitmap
	mathlib
	tier2
)