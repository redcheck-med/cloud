@echo off
set USERNAME=""
set CLINICAID=""
set ORIGIN=""
set WINSCP_PATH="C:\Program Files (x86)\WinSCP\WinSCP.com"

"%WINSCP_PATH" ^
    /log="%USERPROFILE%\redcheck_sync.log" /ini=nul ^
    /command ^
    "open %USERNAME%@sftp.redcheck.com.br -privatekey=C:\Path\to\file.ppk" ^
    "option batch continue" ^
    "keepuptodate %ORIGIN% /ftp-img-storage/clinicaid=%CLINICAID%" ^
    "exit"

exit /b %ERRORLEVEL%