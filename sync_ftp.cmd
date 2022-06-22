@echo off
set USERNAME=""
set CLINICAID=""
set ORIGIN=""
set WINSCP_PATH="C:\Program Files (x86)\WinSCP\WinSCP.com"
set SYNC_OPTIONS="-nopreservetime -nopermissions"

"%WINSCP_PATH" ^
    /log="logs/%date:/=_%.log" /ini=WinSCP.ini ^
    /command ^
    "open %USERNAME%@sftp.redcheck.com.br -privatekey=C:\Path\to\file.ppk" ^
    "option batch continue" ^
    "synchronize remote %ORIGIN% /ftp-img-storage/clinicaid=%CLINICAID% -criteria=size %SYNC_OPTIONS%" ^
    "keepuptodate %ORIGIN% /ftp-img-storage/clinicaid=%CLINICAID% %SYNC_OPTIONS%" ^
    "exit"

exit /b %ERRORLEVEL%