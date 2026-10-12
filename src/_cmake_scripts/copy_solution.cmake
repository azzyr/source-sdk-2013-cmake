# cmake -DNAME=<name> -P copy_solution.cmake
# copy the solution out of the build folder

foreach(ext slnx sln)
	if (EXISTS "build/${NAME}.${ext}")
		file(READ "build/${NAME}.${ext}" solution)
		string(REGEX REPLACE [["([^"]+\.vcxproj)"]] [["build/\1"]] solution "${solution}")
		file(WRITE "${NAME}.${ext}" "${solution}")
	endif()
endforeach()
