@echo off
@REM ID da clínica no sistema da RedCheck (consultar André)
set CLINICA_ID=""
@REM Nome do usuário
set USERNAME=""
@REM set PASSWORD=""
set HOST="ftp.redcheck.com.br"
@REM Nome do "site" criado no no WinSCP
set SITE_NAME="%USERNAME%@%HOST%"
@REM Pasta no computador local a ser sincronizada
set ORIGIN="%USERPROFILE%\Documents\DS4\Redcheck\redcheck_s3_sync\local\clinicaId=244"
set WINSCP_COM_PATH="%USERPROFILE%\AppData\Local\Programs\WinSCP\WinSCP.com"
set SYNC_OPTIONS="-nopreservetime"

set LOG_DIR="%USERPROFILE%\redcheck_sync"

if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"

"%WINSCP_COM_PATH%" ^
    /log="logs\%date:/=_%.log" ^
    /command ^
    "open %SITE_NAME%" ^
    "option batch continue" ^
    "synchronize remote %ORIGIN% / -criteria=date %SYNC_OPTIONS%" ^
    "keepuptodate %ORIGIN% / -nopermissions %SYNC_OPTIONS%" ^
    "exit"

exit /b %ERRORLEVEL%