# posix_base.cmake

string(REPLACE "-O3" "-O2" CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")
string(REPLACE "-O3" "-O2" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")

find_package(Threads REQUIRED)

add_compile_options(
	-g
	$<$<COMPILE_LANGUAGE:CXX>:-fpermissive>
	-fdiagnostics-color
	-Wno-narrowing
	$<${IS_LINUX}:-U_FORTIFY_SOURCE>
	-Usprintf
	-Ustrncpy
	-UPROTECTED_THINGS_ENABLE
)

add_compile_definitions(
	_POSIX
	POSIX
	GNUC
	COMPILER_GCC
	PLATFORM_64BITS
	NO_HOOK_MALLOC
	NO_MALLOC_OVERRIDE
	$<${IS_LINUX}:_LINUX>
	$<${IS_LINUX}:LINUX>
)

if (${IS_LINUX})
	list(
		APPEND ADDITIONAL_LINK_OPTIONS_DLL
		"-Wl,--version-script=${SRCDIR}/devtools/version_script.linux.txt"
	)
endif()

link_libraries(
	Threads::Threads
	${CMAKE_DL_LIBS}
	$<${IS_LINUX}:m>
)

if (${IS_LINUX})
	add_link_options(
		-static-libgcc
		-static-libstdc++
	)
endif()

add_compile_options(
	-march=core2
	-fno-strict-aliasing
	-fno-delete-null-pointer-checks
	-fno-omit-frame-pointer
	-ffast-math
)

include_directories(SYSTEM /usr/include/SDL2)

list(
	APPEND ADDITIONAL_LINK_LIBRARIES_DLL
	tier0
	tier1
	vstdlib
)