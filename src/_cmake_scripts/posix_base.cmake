# posix_base.cmake

string(REPLACE "-O3" "-O2" CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")
string(REPLACE "-O3" "-O2" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")

find_package(Threads REQUIRED)

add_compile_options(
	-g
	-fdiagnostics-color
	-Wno-narrowing
	-U_FORTIFY_SOURCE
	-Usprintf
	-Ustrncpy
	-UPROTECTED_THINGS_ENABLE
)

set(
	POSIX_CXX_COMPILE_OPTIONS
	-fpermissive
)

add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:${POSIX_CXX_COMPILE_OPTIONS}>")

add_compile_definitions(
	_POSIX
	POSIX
	GNUC
	COMPILER_GCC
	PLATFORM_64BITS
	NO_HOOK_MALLOC
	NO_MALLOC_OVERRIDE
	_LINUX
	LINUX
)

target_link_options(
	source_dll INTERFACE
	"-Wl,--version-script=${SRCDIR}/devtools/version_script.linux.txt"
)

add_link_options(
	-static-libgcc
	-static-libstdc++
)

set(CMAKE_SHARED_MODULE_PREFIX "")

link_libraries(
	Threads::Threads
	${CMAKE_DL_LIBS}
	m
)

add_compile_options(
	-march=core2
	-fno-strict-aliasing
	-fno-delete-null-pointer-checks
	-fno-omit-frame-pointer
	-ffast-math
)

include_directories(SYSTEM /usr/include/SDL2)
