
bteq <ScriptX.txt>  ScriptX_Log.txt 2>error_logfile.txt
echo %ERRORLEVEL%


bteq <ScriptY.txt>  ScriptY_Log.txt 2>error_logfile.txt
echo %ERRORLEVEL%


bteq <ScriptZ.txt>  ScriptX_Log.txt 2>error_logfile.txt
echo %ERRORLEVEL%

