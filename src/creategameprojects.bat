cmake -S . -B build -A x64 -DBUILD_GROUP=game
cmake -DNAME=game -P _cmake_scripts/copy_solution.cmake