
bteq <ScriptX.txt>  ScriptX_Log.txt
echo %ERRORLEVEL%
SET /A a=%ERRORLEVEL%
SET /A b=0 
if %a% NEQ %b% (
   sh "not existcommand"
)

bteq <ScriptY.txt>  ScriptY_Log.txt
SET /A a=%ERRORLEVEL%
SET /A b=0 
if %a% NEQ %b% (
   sh "not exist command"
)



