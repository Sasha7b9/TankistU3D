rmdir generated
cmake . -Bgenerated -DCMAKE_GENERATOR_PLATFORM=x64 -DCMAKE_GENERATOR="Visual Studio 16 2019" -DCMAKE_BUILD_TYPE=Release
MSBuild.exe generated/Opus.sln /p:Configuration=release /t:build -clp:ErrorsOnly -nologo /m
