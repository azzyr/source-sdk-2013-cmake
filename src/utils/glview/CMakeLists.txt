source_add_executable(glview
	WIN32
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"

	glview.cpp

	# Common Files
	"${SRCDIR}/utils/common/cmdlib.cpp"
	"${SRCDIR}/public/filesystem_helpers.cpp"
	"${SRCDIR}/public/filesystem_init.cpp"
	"${SRCDIR}/utils/common/filesystem_tools.cpp"
	"${SRCDIR}/utils/common/physdll.cpp"

	# Header Files
	"${SRCDIR}/utils/common/cmdlib.h"
	glos.h
	"${SRCDIR}/public/mathlib/mathlib.h"
)

target_include_directories(
	glview PRIVATE
	"${SRCDIR}/utils/common"
)

target_compile_definitions(
	glview PRIVATE
	PROTECTED_THINGS_DISABLE
)

target_link_libraries(
	glview PRIVATE

	glu32
	opengl32
	odbc32
	odbccp32
	winmm

	mathlib
	tier2
)