# vice.cmake

source_add_executable(vice
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"

	"${SRCDIR}/utils/common/cmdlib.cpp"
	"${SRCDIR}/public/filesystem_helpers.cpp"
	"${SRCDIR}/public/filesystem_init.cpp"
	"${SRCDIR}/utils/common/filesystem_tools.cpp"
	vice.cpp

	# Header Files
	"${SRCDIR}/public/mathlib/IceKey.H"
)

target_include_directories(
	vice PRIVATE
	"${SRCDIR}/utils/common"
)

target_link_libraries(
	vice PRIVATE
	tier2
	mathlib
)