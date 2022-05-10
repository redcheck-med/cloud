@echo off
set ACCESS_KEY=""
set SECRET_ACCESS_KEY=""
set CLINICAID=""
set ORIGIN=""
set WINSCP_PATH="C:\Program Files (x86)\WinSCP\WinSCP.com"

"%WINSCP_PATH" ^
  /log="%USERPROFILE%\redcheck_sync.log" /ini=nul ^
  /command ^
    "open s3://%ACCESS_KEY%:%SECRET_ACCESS_KEY%@s3.amazonaws.com/" ^
    "option batch continue" ^
    "keepuptodate %ORIGIN% /ftp-img-storage/clinicaid=%CLINICAID%" ^
    "exit"

exit /b %ERRORLEVEL%