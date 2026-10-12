# vtfdiff.cmake

source_add_executable(vtfdiff
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"

	vtfdiff.cpp
)

target_link_libraries(
	vtfdiff PRIVATE
	bitmap
	mathlib
	tier2
	vtf
)