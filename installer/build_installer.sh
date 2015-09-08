#!/bin/bash

outfile=Mumble.msi

export MUMBLE_PREFIX=D:\\MumbleBuild\\win32-static-1.3.x-2015-07-22-1cc0b43

export MumbleSourceDir=`cygpath -w -a ..`

export MumbleMergeModuleDir="C:\\Program Files (x86)\\Common Files\\Merge Modules"
export MumbleDebugToolsDir="C:\\Program Files (x86)\\Debugging Tools for Windows (x86)"

export MumbleQtDir=${MUMBLE_PREFIX}.build\\qt-everywhere-opensource-5.4.2
export MumbleSndFileDir==${MUMBLE_PREFIX}.build\\libsndfile-1.0.25
#export MumbleNoSndFile="1"
export MumbleMySQLDir=${MUMBLE_PREFIX}.build\\miradb-native-client
#export MumbleNoMySQL="1"
export MumbleIceDir=${MUMBLE_PREFIX}.build\\Ice-3.5.1
#export MumbleNoIce="1"
export MumbleOpenSslDir=${MUMBLE_PREFIX}.build\\openssl-1.0.1p
export MumbleZlibDir=${MUMBLE_PREFIX}.build\\zlib-1.2.8

unset MumbleSSE
export MumbleNoSSE2="1"
export MumbleNoG15="1"
export MumbleNoMurmur="1"

"/cygdrive/c/Program Files (x86)/WiX Toolset v3.10/bin/candle.exe" -v \
    -d"DevEnvDir=C:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\Common7\\IDE\\" \
    -dSolutionDir=${MumbleSourceDir}\\installer\\ \
    -dSolutionExt=.sln \
    -dSolutionFileName=MumbleInstall.sln \
    -dSolutionName=MumbleInstall \
    -dSolutionPath=${MumbleSourceDir}\\installer\\MumbleInstall.sln \
    -dConfiguration=Release \
    -dOutDir=bin\\Release\\ \
    -dPlatform=x86 \
    -dProjectDir=${MumbleSourceDir}\\installer\\ \
    -dProjectExt=.wixproj \
    -dProjectFileName=MumbleInstall.wixproj \
    -dProjectName=MumbleInstall \
    -dProjectPath=${MumbleSourceDir}\\installer\\MumbleInstall.wixproj \
    -dTargetDir=${MumbleSourceDir}\\installer\\bin\\Release\\ \
    -dTargetExt=.msi \
    -dTargetFileName=${outfile} \
    -dTargetName=Mumble \
    -dTargetPath=${MumbleSourceDir}\\installer\\bin\\Release\\${outfile} \
    -out obj\\Release\\ -arch x86 \
    -ext "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin\\WixUtilExtension.dll" \
    -ext "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin\\WixUIExtension.dll" \
    Files.wxs Plugins.wxs Product.wxs UI.wxs

"/cygdrive/c/Program Files (x86)/WiX Toolset v3.10/bin/Light.exe" -v \
    -out ${MumbleSourceDir}\\installer\\bin\\Release\\${outfile} \
    -pdbout ${MumbleSourceDir}\\installer\\bin\\Release\\Mumble.wixpdb \
    -ext "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin\\WixUtilExtension.dll" \
    -ext "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin\\WixUIExtension.dll" \
    -loc Translations\\English.wxl \
    -outputsfile obj\\Release\\MumbleInstall.wixproj.BindOutputsFileList.txt \
    -builtoutputsfile obj\\Release\\MumbleInstall.wixproj.BindBuiltOutputsFileList.txt \
    -wixprojectfile ${MumbleSourceDir}\\installer\\MumbleInstall.wixproj \
    -cc obj \
    -reusecab \
    obj\\Release\\Files.wixobj obj\\Release\\Plugins.wixobj obj\\Release\\Product.wixobj obj\\Release\\UI.wixobj
