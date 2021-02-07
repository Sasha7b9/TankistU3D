@echo off

if "%1" equ "" goto HINT
if "%2" equ "" goto HINT
if "%3" neq "" goto HINT

set BUILD_TYPE=1

if %1==debug set BUILD_TYPE=Debug & goto STATIC_RUNTIME
if %1==release set BUILD_TYPE=Release & goto STATIC_RUNTIME

goto HINT

:STATIC_RUNTIME
if %2==0 goto MAKE
if %2==1 goto MAKE

goto HINT

:MAKE
rmdir generated\%1 /S /Q
cmake . -Bgenerated\%1 -DCMAKE_GENERATOR_PLATFORM=x64 -DCMAKE_GENERATOR="Visual Studio 16 2019" -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -DURHO3D_64BIT=1 -DURHO3D_THREADING=1 -DURHO3D_C++11=1 -DURHO3D_LIB_TYPE=SHARED -DURHO3D_STATIC_RUNTIME=%2

goto EXIT

:HINT

echo.
echo Using make.bat:
echo                make.bat [debug^|release] [0^|1]
echo If second parameter==1 - static runtime
echo.
goto EXIT

:EXIT