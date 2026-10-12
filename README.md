# Team Fortress 2 SDK - CMake
Original SDK2013 project by Spirrwell: https://github.com/Spirrwell/source-sdk-2013-cmake

This project ports the buildsystem from VPC to CMake.

The layout of the CMake projects should be similar to that of VPC. Hopefully it should feel familiar even if you have no experience with CMake. The base scripts are in _cmake_scripts. Each project has its own CMakeLists.txt, or a .cmake file when several projects share a folder. 

Example: src/tier1/tier1.vpc -> src/tier1/CMakeLists.txt

The batch and shell scripts to generate projects now call CMake instead and place project files in a created "build" directory. If you're comfortable with CMake, you don't have to rely on these at all and can use your favorite IDE's CMake integration.

If your folder structure for SDK2013 is different, you should only have to modify SRCDIR and GAMEDIR in the CMakeLists.txt file if you need to move things around.

CMakePresets.json has presets for each game. Alternatively you can pass -DBUILD_GAME= to pick the game and -DBUILD_GROUP= to pick the projects

## Compiler Support

## General
By default, this targets C++14. Only 64-bit is supported.

### Windows
VS2022 and VS2026 are known to build.

### Linux
This repo should build out of the box with the Steam Runtime Sniper container.

## Credits
### TF2SDK NOTE: While the changes below no longer apply, I've decided to keep them out of respect for the original work done

I'd like to thank JJL772, OzxyBox, and those behind the Source-PlusPlus repo which includes Joshua Ashton, SCell555, and Gocnak.

The modified particles.lib that allows modern VS to build came from Source-PlusPlus: https://github.com/Joshua-Ashton/Source-PlusPlus

JJL772 has a repo which helped me with the ABI difference issues on newer GCC versions: https://github.com/JJL772/source-sdk-2013

OzxyBox has a Source SDK repo which supports VS2022 which I referenced for help a few times. This CMake port is not NEARLY as extensive as the changes here: https://github.com/ozxybox/source-mp13-vs2022
