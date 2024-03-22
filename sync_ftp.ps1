# Needed for PowerShell 7.3 and newer
$PSNativeCommandArgumentPassing = "Legacy"
$USERNAME="ds4"
$CLINICA_ID="244"
$PASSWORD=""
$FTP_HOST="ftp.redcheck.com.br"
# $SITE_NAME="ftp://${USERNAME}:${PASSWORD}@${FTP_HOST}/"
$SITE_NAME="${USERNAME}@${FTP_HOST}"
$ORIGIN="${Env:USERPROFILE}\Documents\DS4\Redcheck\redcheck_s3_sync\local\clinicaId=244"
$WINSCP_COM_PATH="${Env:USERPROFILE}\AppData\Local\Programs\WinSCP\WinSCP.com"
$SYNC_OPTIONS="-nopreservetime"


& "$WINSCP_COM_PATH" `
  /command `
    "open $SITE_NAME" `
    "option batch continue" `
    "synchronize remote ${ORIGIN} / -criteria=date ${SYNC_OPTIONS}" `
    "keepuptodate ${ORIGIN} / -nopermissions ${SYNC_OPTIONS}" `
    "exit"


$winscpResult = $LastExitCode
if ($winscpResult -eq 0)
{
  Write-Host "Success"
}
else
{
  Write-Host "Error"
}

exit $winscpResult