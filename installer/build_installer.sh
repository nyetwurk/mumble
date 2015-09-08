#!/bin/bash

export MUMBLE_PREFIX=D:\\MumbleBuild\\win32-static-1.3.x-2015-07-22-1cc0b43.build

export MumbleSourceDir=D:\\home\\nyet\\src\\mumble

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

"/cygdrive/c/Program Files (x86)/WiX Toolset v3.10/bin/candle.exe" -v -d"DevEnvDir=C:\\Program Files (x86)\\Microsoft Visual Studio 10.0\\Common7\\IDE\\" -dSolutionDir=D:\\home\\nyet\\src\\mumble\\installer\\ -dSolutionExt=.sln -dSolutionFileName=MumbleInstall.sln -dSolutionName=MumbleInstall -dSolutionPath=D:\\home\\nyet\\src\\mumble\\installer\\MumbleInstall.sln -dConfiguration=Release -dOutDir=bin\\Release\\ -dPlatform=x86 -dProjectDir=D:\\home\\nyet\\src\\mumble\\installer\\ -dProjectExt=.wixproj -dProjectFileName=MumbleInstall.wixproj -dProjectName=MumbleInstall -dProjectPath=D:\\home\\nyet\\src\\mumble\\installer\\MumbleInstall.wixproj -dTargetDir=D:\\home\\nyet\\src\\mumble\\installer\\bin\\Release\\ -dTargetExt=.msi -dTargetFileName=Mumble.msi -dTargetName=Mumble -dTargetPath=D:\\home\\nyet\\src\\mumble\\installer\\bin\\Release\\Mumble.msi -out obj\\Release\\ -arch x86 -ext "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin\\WixUtilExtension.dll" -ext "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin\\WixUIExtension.dll" Files.wxs Plugins.wxs Product.wxs UI.wxs

"/cygdrive/c/Program Files (x86)/WiX Toolset v3.10/bin/Light.exe" -out D:\\home\\nyet\\src\\mumble\\installer\\bin\\Release\\Mumble.msi -pdbout D:\\home\\nyet\\src\\mumble\\installer\\bin\\Release\\Mumble.wixpdb -v -ext "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin\\WixUtilExtension.dll" -ext "C:\\Program Files (x86)\\WiX Toolset v3.10\\bin\\WixUIExtension.dll" -loc Translations\\English.wxl -outputsfile obj\\Release\\MumbleInstall.wixproj.BindOutputsFileList.txt -builtoutputsfile obj\\Release\\MumbleInstall.wixproj.BindBuiltOutputsFileList.txt -wixprojectfile D:\\home\\nyet\\src\\mumble\\installer\\MumbleInstall.wixproj -cc obj -reusecab obj\\Release\\Files.wixobj obj\\Release\\Plugins.wixobj obj\\Release\\Product.wixobj obj\\Release\\UI.wixobj
