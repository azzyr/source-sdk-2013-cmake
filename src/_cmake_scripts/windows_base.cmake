# windows_base.cmake

add_compile_definitions(
	WIN32
	_WIN32
	_WINDOWS
	PLATFORM_64BITS
	WIN64
	_WIN64
)

if (MSVC)
	include("${CMAKE_CURRENT_LIST_DIR}/msvc_base.cmake")
endif()

target_sources(source_memoverride INTERFACE "${SRCDIR}/public/tier0/memoverride.cpp")

if (NOT IS_SOURCESDK)
	target_sources(source_exe INTERFACE "${SRCDIR}/public/windows_default.manifest")
	target_sources(source_dll INTERFACE "${SRCDIR}/common/debug_dll_check.cpp")
	target_sources(source_lib INTERFACE "${SRCDIR}/common/debug_lib_check.cpp")
endif()
