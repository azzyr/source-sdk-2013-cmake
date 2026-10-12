# raytrace.cmake

source_add_library(raytrace
	raytrace.cpp
	trace2.cpp
	trace3.cpp
)

target_include_directories(
	raytrace PRIVATE
	"${SRCDIR}/utils/common"
)