cmake -S . -B build -A Win32 -DBUILD_GROUP=game
cmake -DNAME=game -P _cmake_scripts/copy_solution.cmake