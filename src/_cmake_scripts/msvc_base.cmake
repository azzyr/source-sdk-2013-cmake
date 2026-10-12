# msvc_base.cmake

# If using CMake, we'll require 2022 toolset or greater
if (MSVC_TOOLSET_VERSION LESS 143)
	message(FATAL_ERROR "MSVC must use toolset 143 (2022) or greater")
endif()

set(MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_DEBUG
	/NODEFAULTLIB:libc
	/NODEFAULTLIB:libcd
	/NODEFAULTLIB:libcmt
	/NODEFAULTLIB:libcpmt
	/NODEFAULTLIB:libcpmt1
)
set(MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_RELEASE
	/NODEFAULTLIB:libc
	/NODEFAULTLIB:libcd
	/NODEFAULTLIB:libcmtd
	/NODEFAULTLIB:libcpmtd
	/NODEFAULTLIB:libcpmtd0
	/NODEFAULTLIB:libcpmtd1
)

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<CONFIG:Debug>,EditAndContinue,ProgramDatabase>")
set(STATIC_LIB_DEBUG_INFORMATION_FORMAT "$<IF:$<CONFIG:Debug>,EditAndContinue,Embedded>")

add_compile_definitions(
	COMPILER_MSVC
	COMPILER_MSVC64
	_CRT_SECURE_NO_DEPRECATE
	_CRT_NONSTDC_NO_DEPRECATE
	_SCL_SECURE_NO_WARNINGS
	_ALLOW_RUNTIME_LIBRARY_MISMATCH
	_ALLOW_ITERATOR_DEBUG_LEVEL_MISMATCH
	_ALLOW_MSC_VER_MISMATCH
)

# Disable C++ exceptions by default
string(REPLACE "/EHsc" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")


# These are expanded so that we can pass each option individually to the targets
# So they may choose to exclude them
set(
	MSVC_C_AND_CXX_COMPILE_OPTIONS

	# Set warning level
	/W4

	# Treat warnings as errors... someday
	#/WX

	/MP # Multi-processor compilation
	/Gw
	/Zc:threadSafeInit-
	/Zc:__cplusplus
	/Zc:preprocessor
	/Zc:inline
	/Wv:18 # Suppress warnings introduced after VS2013, like C4456

	/wd4316 # Object allocated on the heap may not be aligned 16
	/wd5033 # 'register' is no longer a supported storage class
	/wd5054 # Operator '|': deprecated between enumerations of different types
	/wd5055 # Operator '>': deprecated between enumerations and floating-point types
	/wd4577 # 'noexcept' used with no exception handling mode specified
	/wd4091 # 'keyword': ignored on left of 'type' when no variable is declared
	/wd4355 # 'this': used in base member initializer list

	# We'll be permissive for now
#	/permissive-

	/GR # Enable Run-Time Type Information
	/GF # Enable String Pooling
	/fp:fast # Floating Point Model
	/GS- # Buffer Security Check

	$<$<CONFIG:Release>:/Oi> # Enable Intrinsic Functions
	$<$<CONFIG:Release>:/Ot> # Favor Fast Code
	$<$<CONFIG:Release>:/Gy> # Enable Function-Level Linking
)

# keep them off resource files
add_compile_options("$<$<COMPILE_LANGUAGE:C,CXX>:${MSVC_C_AND_CXX_COMPILE_OPTIONS}>")

add_link_options(
	$<$<CONFIG:Debug>:/DEBUG:FASTLINK>
	$<$<CONFIG:Release>:/DEBUG:FULL>
	"$<$<CONFIG:Debug>:${MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_DEBUG}>"
	"$<$<CONFIG:Release>:${MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_RELEASE}>"
	$<$<CONFIG:Release>:/OPT:REF>
	$<$<CONFIG:Release>:/OPT:ICF>
	/MANIFEST:NO
)

target_compile_definitions(source_dll INTERFACE _USRDLL)
target_compile_definitions(source_lib INTERFACE _LIB)
target_link_libraries(source_dll INTERFACE legacy_stdio_definitions)
