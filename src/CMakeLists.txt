cmake_minimum_required(VERSION 4.3)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)

# This is a way to emulate groups.vgc
set(BUILD_GROUP "game" CACHE STRING "Build Group")

# For the CMake GUIs that support a combobox list
set_property(CACHE BUILD_GROUP PROPERTY STRINGS
	"everything"
	"game"
	"shaders"
	"dedicated"
)

project(${BUILD_GROUP})

if (NOT CMAKE_SIZEOF_VOID_P EQUAL 8)
	message(FATAL_ERROR "Source SDK 2013 only supports 64-bit generation")
endif()

# For some reason, checking if CMAKE_BUILD_TYPE is defined is unreliable
# So simply check if it's empty instead
if ("${CMAKE_BUILD_TYPE}" STREQUAL "")
	set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type" FORCE)
endif()

# Modern VS versions default to C++14 anyway, so make it consistent
# But in the future we may want so support C++20
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Which game are we building?
set(BUILD_GAME "hl2mp" CACHE STRING "Build Game")

set_property(
	CACHE BUILD_GAME PROPERTY STRINGS
	"hl2mp"
	"tf"
)

set(SRCDIR "${CMAKE_CURRENT_LIST_DIR}")
get_filename_component(GAMEDIR "${CMAKE_CURRENT_LIST_DIR}/../game" ABSOLUTE)
set(THIRDPARTYDIR "${SRCDIR}/thirdparty")

include("_cmake_scripts/platform_dirs.cmake")
include("_cmake_scripts/base.cmake")
include("_cmake_scripts/video_base.cmake")
include("_cmake_scripts/postbuild.cmake")
include("_cmake_scripts/targets.cmake")

set(LIBPUBLIC "${SRCDIR}/lib/public${PLATSUBDIR}")
if (WIN32)
	set(LIBCOMMON "${SRCDIR}/lib/common${PLATSUBDIR}/2015/release")
else()
	set(LIBCOMMON "${SRCDIR}/lib/common${PLATSUBDIR}")
endif()

include("_cmake_scripts/prebuilt_libs.cmake")

include_directories(
	"${SRCDIR}/common"
	"${SRCDIR}/public"
	"${SRCDIR}/public/tier0"
	"${SRCDIR}/public/tier1"
)

add_compile_definitions("$<$<CONFIG:Debug>:DEBUG;_DEBUG>")
add_compile_definitions($<$<CONFIG:Release>:NDEBUG>)

add_library(source_exe INTERFACE)
add_library(source_dll INTERFACE)
add_library(source_lib INTERFACE)
add_library(source_memoverride INTERFACE)
add_library(source_tier_libs INTERFACE)

target_compile_definitions(source_exe INTERFACE MEMOVERRIDE_MODULE=$<TARGET_PROPERTY:NAME>)
target_compile_definitions(source_dll INTERFACE MEMOVERRIDE_MODULE=$<TARGET_PROPERTY:NAME> DLLNAME=$<TARGET_PROPERTY:NAME>)
target_compile_definitions(source_lib INTERFACE LIBNAME=$<TARGET_PROPERTY:NAME>)
target_link_libraries(source_tier_libs INTERFACE tier0 tier1 vstdlib)

if (IS_WINDOWS)
	include("_cmake_scripts/windows_base.cmake")
elseif (IS_LINUX)
	include("_cmake_scripts/posix_base.cmake")
endif()

include("_cmake_scripts/groups.cmake")

# tier libraries come after the libraries that use them
get_property(TIER_LIB_TARGETS GLOBAL PROPERTY SOURCE_TIER_LIB_TARGETS)
foreach(target IN LISTS TIER_LIB_TARGETS)
	target_link_libraries(${target} PRIVATE source_tier_libs)
endforeach()

if (TARGET launcher_main_mod_${BUILD_GAME})
	set_property(DIRECTORY PROPERTY VS_STARTUP_PROJECT launcher_main_mod_${BUILD_GAME})
	set_property(TARGET launcher_main_mod_${BUILD_GAME} PROPERTY DEBUGGER_WORKING_DIRECTORY "${GAMEDIR}")
endif()
