@echo off
REM Check if WSL is installed
wsl --list >nul 2>&1
if %errorlevel% neq 0 (
    echo WSL is not installed. Installing WSL...
    wsl --install
    echo Please restart your computer and run this script again.
    pause
    exit /b
)

REM Define the path where sap.sh is located
set "SCRIPT_PATH=%~dp0sap.sh"

REM Check if sap.sh exists
if not exist "%SCRIPT_PATH%" (
    echo sap.sh not found in the current directory.
    echo Please place sap.sh in the same directory as this batch file and run the script again.
    pause
    exit /b
)

REM Copy sap.sh to the WSL home directory
echo Copying sap.sh to WSL home directory...
wsl cp /mnt/c/%SCRIPT_PATH:C:\=\% sap.sh ~

REM Add an alias to run sap.sh from anywhere in WSL
echo Adding alias to WSL .bashrc...
wsl -e sh -c "echo alias sap=\'~/sap.sh\' >> ~/.bashrc"
wsl -e sh -c "source ~/.bashrc"

echo Setup complete. You can now run 'sap' in WSL to execute the script.
pause
