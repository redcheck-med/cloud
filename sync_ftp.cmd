@echo off
set USERNAME=""
set CLINICAID=""
set ORIGIN=""

"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
    /log="%USERPROFILE%\redcheck_sync.log" /ini=nul ^
    /command ^
    "open %USERNAME%@sftp.redcheck.com.br -privatekey=C:\Path\to\file.ppk" ^
    "option batch continue" ^
    "keepuptodate %ORIGIN% /ftp-img-storage/clinicaid=%CLINICAID%" ^
    "exit"

exit /b %ERRORLEVEL%