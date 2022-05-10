# WinSCP configuration

## S3

1. Create a `.bat` file with the following contents:

    ```bat
    @echo off
    set ACCESS_KEY=""
    set SECRET_ACCESS_KEY=""
    set CLINICAID=""
    set ORIGIN=""

    "C:\Program Files (x86)\WinSCP\WinSCP.com" ^
      /log="%USERPROFILE%\redcheck_sync.log" /ini=nul ^
      /command ^
        "open s3://%ACCESS_KEY%:%SECRET_ACCESS_KEY%@s3.amazonaws.com/" ^
        "option batch continue" ^
        "keepuptodate %ORIGIN% /ftp-img-storage/clinicaid=%CLINICAID%" ^
        "exit"

    exit /b %ERRORLEVEL%
    ```

2. Run the file with a double click.

3. Change location of the `.bat` file in the [`run_sync.vba`](./run_sync.vbs) and run it.

## FTP

1. Session dialog fill with:

    - File protocol: SFTP
    - Host name: ftp.redcheck.com.br
    - Port number: 22
    - username: ...

2. Choose Advanced to open the Advanced Site Settings dialog box. In the SSH section, choose Authentication. For Private key file, browse for and choose the SSH private key file from your file system.
      > If WinSCP offers to convert your SSH private key to the PPK format, choose OK.
3. In the Login dialog box, choose *Tools*, and then choose *Preferences*.

4. In the Preferences dialog box, for Transfer

    - In *Endurance*. For the *Enable transfer resume/transfer to temporary filename* for option, choose *Disable*.
    - In *Background*, clear the *Use multiple connections for single transfer* check box.
    - Add WinSCP to PATH: in *Preferences* dialog, go to *Integrations* and click on *Add WinSCP to search path*.

### Automatic synchronization

1. Create a file with the following contents:

    ```bat
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
    ```

2. Run the file with a double click.
