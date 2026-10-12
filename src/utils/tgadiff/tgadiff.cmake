# tgadiff.cmake

source_add_executable(tgadiff
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"

	tgadiff.cpp
)

target_link_libraries(
	tgadiff PRIVATE
	bitmap
	mathlib
	tier2
)