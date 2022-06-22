@echo off
set USERNAME=""
set CLINICAID=""
set ORIGIN=""
set WINSCP_PATH="WinSCP.com"
set SYNC_OPTIONS="-nopreservetime"

"%WINSCP_PATH" ^
    /log="logs/%date:/=_%.log" /ini=WinSCP.ini ^
    /command ^
    "open %USERNAME%@sftp.redcheck.com.br -privatekey=C:\Path\to\file.ppk" ^
    "option batch continue" ^
    "synchronize remote %ORIGIN% /ftp-img-storage/clinicaid=%CLINICAID% -criteria=size %SYNC_OPTIONS%" ^
    "keepuptodate %ORIGIN% /ftp-img-storage/clinicaid=%CLINICAID% -nopermissions %SYNC_OPTIONS%" ^
    "exit"

exit /b %ERRORLEVEL%