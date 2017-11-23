echo off
bteq <ScriptX.txt>  ScriptX_Log.txt
echo %ERRORLEVEL%

if %ERRORLEVEL% GTR  0 
( EXIT -1 )
bteq <ScriptY.txt>  ScriptY_Log.txt

IF %ERROR_LEVEL% GTR 0 ( EXIT -1 )


