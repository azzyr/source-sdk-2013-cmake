# posix_base.cmake

string(REPLACE "-O3" "-O2" CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")
string(REPLACE "-O3" "-O2" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")

find_package(Threads REQUIRED)

add_compile_options(
	-g
	-fdiagnostics-color
	-fdiagnostics-show-option
	-Wno-narrowing
	-U_FORTIFY_SOURCE
	-Usprintf
	-Ustrncpy
	-UPROTECTED_THINGS_ENABLE

	-Wall
	-Wno-multichar
	-Wno-write-strings
	-Wno-unused-variable
	-Wno-unused-function
	-Winvalid-pch
	-Wswitch
	-Wno-sign-compare
	-Wno-nonnull-compare
	-Wno-ignored-attributes
	-Wno-misleading-indentation
	-Wno-unused-but-set-variable
	-Wno-unused-local-typedefs
	-Wno-switch
	-Wno-parentheses
	-Wno-unknown-pragmas
	-Wno-unused-parameter
	-Wno-unused-value
	-Wno-comment
	-Wno-float-equal
	-Werror=return-type
	-Wformat
	-Wformat-security
)

set(
	POSIX_CXX_COMPILE_OPTIONS
	-fpermissive
	-Wno-overloaded-virtual
	-Wno-placement-new
	-Wno-c++20-compat
	-Wno-mismatched-new-delete
	-Wno-class-memaccess
	-Wno-conversion-null
	-Wno-invalid-offsetof
	-Wno-reorder
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
	VPROF_LEVEL=1
	_FILE_OFFSET_BITS=64
	_LINUX
	LINUX
)

set(
	LINUX_PATHWRAP_FUNCTIONS
	fopen freopen open creat access __xstat stat stat64 lstat fopen64 open64 opendir
	chmod chown lchown symlink link __lxstat64 mknod utimes unlink rename utime __xstat64
	mount mkfifo mkdir rmdir scandir realpath __lxstat
)
list(TRANSFORM LINUX_PATHWRAP_FUNCTIONS PREPEND "-Wl,--wrap=")

target_link_options(
	source_dll INTERFACE
	-Wl,--no-undefined
	"-Wl,--version-script=${SRCDIR}/devtools/version_script.linux.txt"
)

add_link_options(
	${LINUX_PATHWRAP_FUNCTIONS}
	-Wl,--build-id
	-Wl,-z,noexecstack
	-static-libgcc
)

set(CMAKE_SHARED_MODULE_PREFIX "")
set(CMAKE_SHARED_MODULE_SUFFIX "${_DLL_EXT}")

link_libraries(
	Threads::Threads
	${CMAKE_DL_LIBS}
	m
	uuid
)

add_compile_options(
	-march=core2
	-fno-delete-null-pointer-checks
	$<$<CONFIG:Debug>:-ggdb3>
	$<$<CONFIG:Release>:-fno-strict-aliasing>
	$<$<CONFIG:Release>:-ffast-math>
	$<$<CONFIG:Release>:-fno-omit-frame-pointer>
	$<$<CONFIG:Release>:-ftree-vectorize>
	$<$<CONFIG:Release>:-fpredictive-commoning>
	$<$<CONFIG:Release>:-funswitch-loops>
)

include_directories(SYSTEM /usr/include/SDL2 /usr/include/freetype2)

find_program(CCACHE ccache)
if (CCACHE AND NOT CMAKE_CXX_COMPILER_LAUNCHER)
	set(CCACHE_LAUNCHER "${CMAKE_COMMAND}" -E env CCACHE_SLOPPINESS=pch_defines,time_macros,include_file_mtime,include_file_ctime "${CCACHE}")
	set(CMAKE_C_COMPILER_LAUNCHER ${CCACHE_LAUNCHER})
	set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE_LAUNCHER})
endif()
