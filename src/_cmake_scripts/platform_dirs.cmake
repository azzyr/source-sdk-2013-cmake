# platform_dirs.cmake

if (WIN32)
	set(PLATSUBDIR "/x64")
elseif (UNIX)
	set(PLATSUBDIR "/linux64")
endif()