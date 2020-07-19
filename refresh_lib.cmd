@ECHO OFF

if not exist "%LOCALAPPDATA%\Crownpeak\CMSAPIDLLs\." echo Couldnt find directory... & GOTO :ERROR

:FOUND_DLLS
echo Found CMSAPIProxy.
xcopy %LOCALAPPDATA%\Crownpeak\CMSAPIDLLs\CMSAPIProxy.* .\lib /y




goto :END

:ERROR
echo Sorry, an error occurred.

:END
