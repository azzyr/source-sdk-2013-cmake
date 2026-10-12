cmake -S . -B build -A Win32 -DBUILD_GROUP=everything
cmake -DNAME=everything -P _cmake_scripts/copy_solution.cmake