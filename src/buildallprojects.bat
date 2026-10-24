@echo off
setlocal

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
for /f "usebackq delims=" %%i in (`"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do set "VSDIR=%%i"
if not defined VSDIR (
	echo Visual Studio with the C++ build tools was not found
	exit /b 1
)

set "PATH=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer;%PATH%"
call "%VSDIR%\VC\Auxiliary\Build\vcvarsall.bat" x64 -vcvars_ver=14.4 > nul || exit /b 1

set "CONFIG=release"
if not "%~1"=="" set "CONFIG=%~1"

pushd "%~dp0"
cmake --preset %CONFIG% || goto fail
cmake --build build\%CONFIG% || goto fail
popd
exit /b 0

:fail
popd
exit /b 1
