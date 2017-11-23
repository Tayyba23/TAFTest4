echo off
bteq <ScriptX.txt>  ScriptX_Log.txt
echo %ERRORLEVEL%

if %ERRORLEVEL% > 0 EXIT -1 
bteq <ScriptY.txt>  ScriptY_Log.txt

echo %ERROR_LEVEL% > EXIT -1 


