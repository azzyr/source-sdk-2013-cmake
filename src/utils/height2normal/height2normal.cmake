# height2normal.cmake

set(HEIGHT2NORMAL_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	HEIGHT2NORMAL_SOURCE_FILES

	"${HEIGHT2NORMAL_DIR}/height2normal.cpp"

	# Header Files
	"${SRCDIR}/public/tier1/interface.h"
	"${SRCDIR}/public/tier1/utlbuffer.h"
)

set(
	height2normal_exclude_source
	"${SRCDIR}/public/tier0/memoverride.cpp"
)

add_executable(height2normal ${HEIGHT2NORMAL_SOURCE_FILES})

set_target_properties(
	height2normal PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${GAMEDIR}/bin${PLATSUBDIR}"
)

target_include_directories(
	height2normal PRIVATE
	"${SRCDIR}/utils/common"
)

target_link_libraries(
	height2normal PRIVATE

	"${LIBPUBLIC}/bitmap${STATIC_LIB_EXT}"
	mathlib
	"${LIBPUBLIC}/tier2${STATIC_LIB_EXT}"
)