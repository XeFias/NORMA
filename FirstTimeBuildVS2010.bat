@ECHO OFF
SETLOCAL
SET RootDir=%~dp0.

IF "%TargetVisualStudioVersion%"=="v8.0" (
	SET DegradeToolsVersion=/toolsversion:2.0
) ELSE IF "%TargetVisualStudioVersion%"=="v9.0" (
	SET DegradeToolsVersion=/toolsversion:3.5
) ELSE (
	SET TargetVisualStudioVersion=v10.0
	SET DegradeToolsVersion=/toolsversion:4.0
)

CALL "%RootDir%\BuildDevTools.bat" %* /consoleloggerparameters:DisableMPLogging %DegradeToolsVersion%
CALL "%RootDir%\Build.bat" %* /consoleloggerparameters:DisableMPLogging %DegradeToolsVersion%

GOTO:EOF
