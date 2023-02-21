@echo off&setlocal
SETLOCAL EnableDelayedExpansion
::   _____________________________________________________________________    
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------
::
::		OrangeHUD installer and updater, uninstaller
::		and version checker.
::
::		copyright CC:UL 1.0 you may edit and use this
::		tool for anything; except monetize it.
::
::
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: Window title
title OHUD Manager


:: main color of orange used in this tool.
:: note that the highlight color is calculated from the ASCII logo defs at the bottom.
set ColOrange=[38;2;247;128;42m


::   _____________________________________________________________________    
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: Window size set and fix
:: adding [ echo %height% 2>nul >nul ] to any state resets the size of-
:: this window if it has been dragged accidentally.
:: uses powershell to call for the window size.

FOR /F "delims=" %%G in ('powershell.exe -executionpolicy unrestricted $host.UI.RawUI.WindowSize.Height') do SET height=%%G
	IF /I "%height%" GEQ "69" mode con: cols=71 lines=46
	IF /I "%height%" LEQ "69" mode con: cols=71 lines=46
echo %height% 2>nul >nul

   
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: links and files
	set gitlink=https://github.com/Orangeprint-git/OrangeHUD.git
	set dllink=https://github.com/Orangeprint-git/OrangeHUD/archive/refs/heads/main.zip 
	set dllog=https://raw.githubusercontent.com/Orangeprint-git/OrangeHUD/main/UpdateLog.txt
	set dlascii=https://raw.githubusercontent.com/Orangeprint-git/OrangeHUD/main/Orange.ini
	
	set orange=Orange.ini
	set DISCORD=Orangeprint#1170



::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: Connection error check.
:conerr
:: Update version check
	SET RLVER=
	del "UpdateLog.txt" /s /f /q 2>nul >nul
	powershell -Command "Invoke-WebRequest %dllog% -Outfile UpdateLog.txt">nul
	powershell -Command "Invoke-WebRequest %dlascii% -Outfile Orange.ini">nul
	if %errorlevel%==0 (
	echo.2>nul
) ELSE (
	call :noconnection 
	pause 
)
   
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: Version error
IF EXIST "UpdateLogIN.txt" (
	set ULIN=UpdateLogIN.txt
) ELSE (
echo  UpdateVer: ERR:"[31mUpdateLogIN.txt not found.%ColOrange%" > OHUDtemp.txt
	set ULIN=OHUDtemp.txt
)

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: if hud install not found in current folder make window into install state

for /D %%I in ("%~dp0."
) do for %%J in (
	"%%~dpI."
 
) do set ParentFolderName=%%~dpnxJ
	set "filename=%ParentFolderName%"
)

IF EXIST %ParentFolderName%\OrangeHUD (
	set startfunc= startcls
	GOTO startcls
) ELSE (
	set startfunc= startinstalstate
	GOTO startinstalstate
)

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:noconnection
%ColOrange%
cls
call :ASCIILOGO 
echo  _____________________________________________________________________ 
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                           [31mConnection error.%ColOrange%


echo.
echo.
echo.
echo.
echo                                           Discord@ %ColHigh%%DISCORD%%ColOrange%
echo  _____________________________________________________________________ 
echo  -----------------------------------------%ColHigh%[ Hit ENTER to try again. ]%ColOrange%-
SET choice=
SET /p choice=Reconnect? %ColHigh%:

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	
	IF '%choice%'=='' GOTO conerr 
	IF '%choice%'=='y' GOTO conerr
	IF '%choice%'=='Y GOTO conerr
	IF '%choice%'=='n' GOTO exit
	IF '%choice%'=='N' GOTO exit 
	
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------
	
	





:startcls
%ColOrange%
cls

call :ASCIILOGO    
echo  ________________ %ColHigh%UPDATING FILES IN CURRENT DIRECTORY%ColOrange% ________________ 
echo  ---------------------------------------------------------------------
echo %height% 2>nul >nul

:: shortened directory echo

for /D %%I in ("%~dp0.
) do for %%J in (
	"%%~dpI.
 
) do set ParentFolderName=%%~dpnxJ
	set "filename=%ParentFolderName%\OrangeHUD-main
	For %%A in ("%filename%"

) do (
	echo.
	echo  %%~dA\...%%~pA
	echo.
)
   
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------


:: Version error
IF EXIST "UpdateLogIN.txt" (
	set ULIN=UpdateLogIN.txt
) ELSE (
echo  UpdateVer: ERR:"[31mUpdateLogIN.txt not found.%ColOrange%" > OHUDtemp.txt
	set ULIN=OHUDtemp.txt
)

:: finds UpdateVer: line in UpdateLog.txt
	findstr "UpdateVer" "UpdateLog.txt" 2>nul >nul
	if %errorlevel%==0 (
	for /f "tokens=1,* delims=:" %%c in ('findstr "UpdateVer" "UpdateLog.txt"') do set UpdateVer=%%d
) ELSE (
	do set UpdateVer=[31mERR%ColOrange%
) 


:: finds UpdateVer: line in UpdateLogIN.txt which is the currently installed version.
	findstr "UpdateVer" "%ULIN%" 2>nul >nul
	if %errorlevel%==0 (
	for /f "tokens=1,* delims=:" %%g in ('findstr "UpdateVer" "%ULIN%"') do set UpdateVer2=%%h
) ELSE (
	echo ERR
) 

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

echo.
if %UpdateVer2% GEQ %UpdateVer% (
	echo %ColHigh%%UpdateVer2% [32mUP TO DATE%ColOrange% 
) ELSE (
	echo %ColHigh%%UpdateVer2% [31mOUTDATED%ColOrange%
)

:: Date and time of last installed version.
for %%I in (
	"%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
	set "filename=%ParentFolderName%\OrangeHUD-main\UpdateLogIN.txt"
	For %%A in ("%filename%"
) do (
	echo  Installed: %%~tA
)

::latest github from UpdateVer: line in UpdateLog.txt
	echo.
	echo  newest github version:
	echo %ColHigh%%UpdateVer%%ColOrange%                      Discord@ %ColHigh%%DISCORD%%ColOrange%
echo.	
echo  _____________________________________________________________________
echo  -%ColHigh%[ Y/N/ HELP / GIT / UNINSTALL ]%ColOrange%------------%ColHigh%[ Hit ENTER to reload. ]%ColOrange%-
SET choice=
SET /p choice=Command%ColHigh% : 

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	IF '%choice%'=='Y' GOTO yes
	IF '%choice%'=='y' GOTO yes
	IF '%choice%'=='N' GOTO no
	IF '%choice%'=='n' GOTO no
	IF '%choice%'=='g' GOTO git
	IF '%choice%'=='G GOTO git
	IF '%choice%'=='git GOTO git
	IF '%choice%'=='Git' GOTO git
	IF '%choice%'=='GIT' GOTO git
	IF '%choice%'=='Gi' GOTO git
	IF '%choice%'=='GI' GOTO git
	IF '%choice%'=='r' GOTO Resources
	IF '%choice%'=='R' GOTO Resources
	IF '%choice%'=='re GOTO Resources
	IF '%choice%'=='RE' GOTO Resources
	IF '%choice%'=='res' GOTO Resources
	IF '%choice%'=='RES' GOTO Resources
	IF '%choice%'=='' GOTO conerr
	IF '%choice%'=='rl' GOTO rvd
	IF '%choice%'=='RL' GOTO rvd	
	IF '%choice%'=='q' GOTO exit
	IF '%choice%'=='Q' GOTO exit
	IF '%choice%'=='quit' GOTO exit
	IF '%choice%'=='QUIT' GOTO exit
	IF '%choice%'=='h' GOTO help
	IF '%choice%'=='H' GOTO help
	IF '%choice%'=='help' GOTO help
	IF '%choice%'=='HELP' GOTO help
	IF '%choice%'=='s' GOTO WindowSizecommand
	IF '%choice%'=='S' GOTO WindowSizecommand
	IF '%choice%'=='install' GOTO startinstalstate
	IF '%choice%'=='INSTALL' GOTO startinstalstate
	IF '%choice%'=='uninstall' GOTO Uninst
	IF '%choice%'=='UNINSTALL' GOTO Uninst
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:Uninst
%ColOrange%
taskkill /IM hl2.exe /F
for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
rmdir /S /Q "%ParentFolderName%\OrangeHUD-main" 9<"%~f0" 2>nul 
cls
call :ASCIILOGO   
echo  _________________ %ColHigh%OHUD UNINSTALLATION SUCCESSFUL%ColOrange% ____________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                         [32mProccess Finished.%ColOrange%

echo.
echo.
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  ---------------------------------------------------------------------
ECHO  Press ENTER to go back to start, or click X to close.
del "UpdateLogIN.txt" /s /f /q 2>nul >nul
pause >nul
GOTO %startfunc%



:WindowSizecommand
	echo %height% 2>nul >nul
	GOTO startcls
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:rvd
SETLOCAL EnableDelayedExpansion
	powershell -Command "Invoke-WebRequest %dllog% -Outfile UpdateLog.txt"
	echo %height% 2>nul >nul
	GOTO startcls
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------


:git
	start "" %gitlink%
	echo %height%
	goto startcls
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:yes
@echo off
SETLOCAL EnableExtensions
SET EXE=hl2.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF NOT %%x == %EXE% (
  GOTO notRunning
) ELSE (
  GOTO Running
)

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:Running
	taskkill /IM hl2.exe /F>NUL
	powershell -Command "Invoke-WebRequest %dllink% -Outfile OHUD.zip"
	echo %height% 2>nul >nul
goto unpack

:notRunning
	powershell -Command "Invoke-WebRequest %dllink% -Outfile OHUD.zip"
	goto unpack
	echo %height% 2>nul >nul

:unpack
for %%I in (
	"%~dp0."
)	do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
	powershell -Command Expand-Archive -LiteralPath '%cd%\OHUD.zip' -DestinationPath '%ParentFolderName%' -Force
	echo %height% 2>nul >nul
	GOTO updatefinished
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:updatefinished
%ColOrange%
cls
call :ASCIILOGO    
echo  _____________________ %ColHigh%OHUD UPDATE SUCCESSFUL%ColOrange% ________________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                         [32mProccess Finished.%ColOrange%

echo.
echo.
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  ---------------------------------------------------------------------
echo %height% 2>nul >nul
del "%~dp0\OHUD.zip" /s /f /q 2>nul >nul
del "OHUDtemp.txt" /s /f /q 2>nul >nul
MOVE /y "UpdateLog.txt" "UpdateLogIN.txt"2>nul >nul
attrib +h +r UpdateLogIN.txt
del "UpdateLog.txt" /s /f /q 2>nul >nul


ECHO  Press ENTER to go back to start, or click X to close.
pause >nul

FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 440" /v InstallLocation`) DO (
    set TF2DIR=%%A %%B
)

cd %TF2DIR%\tf\custom\OrangeHUD-main
echo Set oWS = WScript.CreateObject("WScript.Shell") > OHUDManager.vbs
echo sLinkFile = "%userprofile%\Desktop\OHUDManager.lnk" >> OHUDManager.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> OHUDManager.vbs
echo oLink.TargetPath = "%TF2DIR%\tf\custom\OrangeHUD-main\OHUDManager.bat" >> OHUDManager.vbs
echo oLink.WorkingDirectory = "%TF2DIR%\tf\custom\OrangeHUD-main" >> OHUDManager.vbs
echo oLink.Description = "OrangeHUD Manager" >> OHUDManager.vbs
echo oLink.IconLocation = "%TF2DIR%\tf\custom\OrangeHUD-main\Orangeprint.ico" >> OHUDManager.vbs
echo oLink.Save >> OHUDManager.vbs
cscript OHUDManager.vbs>nul
del OHUDManager.vbs

set fld=%TF2DIR%\tf\custom\OrangeHUD-main
set ico=%fld%\Folder.ico
(
echo [.ShellClassInfo]
echo IconResource=Folder.ico,0
echo [ViewState]
echo Mode=
echo Vid=
echo FolderType=Generic
) > "%fld%\desktop.ini"
attrib +h +s -a "%fld%\desktop.ini"
attrib +r "%fld%"
attrib +h "%fld%\icons"

GOTO %startfunc%

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:Resources
%ColOrange%
cls

call :ASCIILOGO   
echo  ____________________ %ColHigh%OHUD RESOURCES FOR MODDERS%ColOrange% _____________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo             [31mPSD files and other materials created for for hud.%ColOrange%
echo                 [31mTHESE FILES HAVE NOT BEEN SET UP YET%ColOrange%
echo.
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  -%ColHigh%[ Y/N/ HELP ]%ColOrange%-------------------------------------------------------
echo %height% 2>nul >nul


SET choice=
SET /p choice=Proceed?%ColHigh% : 

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	IF '%choice%'=='Y' GOTO %startfunc%
	IF '%choice%'=='y' GOTO %startfunc%
	IF '%choice%'=='N' GOTO %startfunc%
	IF '%choice%'=='n' GOTO %startfunc%
	IF '%choice%'=='b' GOTO %startfunc%
	IF '%choice%'=='B' GOTO %startfunc%
	IF '%choice%'=='back' GOTO %startfunc%
	IF '%choice%'=='BACK' GOTO %startfunc%
	IF '%choice%'=='c' GOTO startcls
	IF '%choice%'=='C' GOTO startcls
	
	IF '%choice%'=='q' GOTO :exit
	IF '%choice%'=='Q' GOTO :exit
	IF '%choice%'=='quit' GOTO :exit
	IF '%choice%'=='QUIT' GOTO :exit
	
	IF '%choice%'=='' GOTO %startfunc%


::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------





:no
%ColOrange%
cls

call :ASCIILOGO
   
echo  ______________________ %ColHigh%OHUD UPDATE CANCELLED%ColOrange% ________________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                         [31mProccess Cancelled.%ColOrange%
echo.
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  ---------------------------------------------------------------------
echo %height% 2>nul >nul
del "OHUDtemp.txt" /s /f /q 2>nul >nul
del "UpdateLog.txt" /s /f /q 2>nul >nul
Echo Exit: press any key.
pause >nul
:exit
exit

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------



:: If isntall state is not found it loads everything below this instead

:: contains call dir command DIRQ that looks for tf2 installation 
:: alternatively you can download and unpack the files anywhere with



::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:help
%ColOrange%
cls

call :ASCIILOGO
    
echo  _____________________________ %ColHigh%OHUD HELP%ColOrange% _____________________________
echo  ---------------------------------------------------------------------
echo.
echo  Commands                         I
echo                                   I
echo    Resources: ............. %ColHigh%R%ColOrange%     I   ..........................
echo    Github: ................ %ColHigh%G%ColOrange%     I   ..........................
echo    Quit: .................. %ColHigh%Q%ColOrange%     I   ..........................
echo    Back: .................. %ColHigh%B%ColOrange%     I   ..........................
echo    Scan where tf2 + ins ... %ColHigh%DIRQ%ColOrange%  I   ..........................
echo    Reload ver file......... %ColHigh%RL%ColOrange%    I   ..........................
echo                                   I  
echo  _____________________________________________________________________
echo  -------------------------------------------%ColHigh%[ Hit ENTER to go back. ]%ColOrange%-
echo %height% 2>nul >nul
SET choice=
SET /p choice=Command%ColHigh% : 

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	
	IF '%choice%'=='g' GOTO git
	IF '%choice%'=='G GOTO git
	IF '%choice%'=='git GOTO git
	IF '%choice%'=='Git' GOTO git
	IF '%choice%'=='GIT' GOTO git
	IF '%choice%'=='Gi' GOTO git
	IF '%choice%'=='GI' GOTO git
	IF '%choice%'=='r' GOTO Resources
	IF '%choice%'=='R' GOTO Resources
	IF '%choice%'=='re GOTO Resources
	IF '%choice%'=='RE' GOTO Resources
	IF '%choice%'=='res' GOTO Resources
	IF '%choice%'=='RES' GOTO Resources
	IF '%choice%'=='' GOTO %startfunc%
	IF '%choice%'=='reloadverdata' GOTO RVD
	IF '%choice%'=='rvd' GOTO RVD
	IF '%choice%'=='RVD' GOTO RVD	
	IF '%choice%'=='q' GOTO exit
	IF '%choice%'=='Q' GOTO exit
	IF '%choice%'=='quit' GOTO exit
	IF '%choice%'=='QUIT' GOTO exit
	IF '%choice%'=='b' GOTO %startfunc%
	IF '%choice%'=='B' GOTO %startfunc%
	IF '%choice%'=='back' GOTO %startfunc%
	IF '%choice%'=='BACK' GOTO %startfunc%
	IF '%choice%'=='dirq' GOTO dirquery
	IF '%choice%'=='DIRQ' GOTO dirquery
	IF '%choice%'=='dir' GOTO dirquery
	IF '%choice%'=='DIR' GOTO dirquery


::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:gitl
	start "" %gitlink%
	GOTO startinstalstate


:startinstalstatevererr
	powershell -Command "Invoke-WebRequest %dllog% -Outfile UpdateLog.txt">nul
	powershell -Command "Invoke-WebRequest %dlascii% -Outfile Orange.ini">nul
	if %errorlevel%==0 (
	echo.2>nul
) ELSE (
	GOTO noconnection 
	pause 
)

:startinstalstate
%ColOrange%
cls

call :ASCIILOGO

echo  ___________________________ %ColHigh%OHUD INSTALLER%ColOrange% __________________________
echo  ---------------------------------------------------------------------
echo %height% 2>nul >nul  

::shortened directory echo

for /D %%I in ("%~dp0."
) do for %%J in (
	"%%~dpI."
 
) do set ParentFolderName=%%~dpnxJ
	set "filename=%CD%"
	For %%A in ("%filename%"

) do (
	echo.
	echo  %%~dA\...\%%~nxA\OHUDManager.bat
	echo.
)

::finds UpdateVer: line in UpdateLogIN.txt which is the currently installed version.
	findstr "UpdateVer" "UpdateLog.txt" 2>nul >nul
	if %errorlevel%==0 (
	for /f "tokens=1,* delims=:" %%g in ('findstr "UpdateVer" "UpdateLog.txt"') do set UpdateVer3=%%h
)

	echo  %ColHigh%[ Y / N ]%ColOrange% Install OrangeHUD.
	echo  %ColHigh%[ Custom ]%ColOrange% Select custom location to install.
	echo  %ColHigh%[ GIT ]%ColOrange% Github.
	echo  %ColHigh%[ HELP ]%ColOrange% help menu.
	echo.
	echo  newest github version:
	echo %ColHigh%%UpdateVer3%%ColOrange%                      Discord@ %ColHigh%%DISCORD%%ColOrange%
	

echo  _____________________________________________________________________
echo  -%ColHigh%[ Y/N/ DIRQ / GIT / HELP ]%ColOrange%-----------------%ColHigh%[ Hit ENTER to reload. ]%ColOrange%-
SET choice=
SET /p choice=Command%ColHigh% : 

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	IF '%choice%'=='Y' GOTO dirquery
	IF '%choice%'=='y' GOTO dirquery
	IF '%choice%'=='N' GOTO noINSTALL
	IF '%choice%'=='n' GOTO noINSTALL
	
	IF '%choice%'=='custom' GOTO yesINSTALL
	IF '%choice%'=='CUSTOM' GOTO yesINSTALL
	
	IF '%choice%'=='select' GOTO selectlocation
	IF '%choice%'=='SELECT' GOTO selectlocation
	
	IF '%choice%'=='g' GOTO gitl
	IF '%choice%'=='G' GOTO gitl
	IF '%choice%'=='git' GOTO gitl
	IF '%choice%'=='GIT' GOTO gitl
	
	IF '%choice%'=='h' GOTO help
	IF '%choice%'=='H' GOTO help
	IF '%choice%'=='help' GOTO help
	IF '%choice%'=='HELP' GOTO help
	
	IF '%choice%'=='' GOTO startinstalstatevererr
	
	

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------


:dirquery
%ColOrange%
cls
echo %height% 2>nul >nul

@echo off&setlocal
SETLOCAL EnableDelayedExpansion
FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 440" /v InstallLocation`) DO (
    set _fpath=%%A %%B
)


IF EXIST %_fpath%tf\custom\OrangeHUD-main (
	SET ULIN2="%_fpath%\tf\custom\OrangeHUD-main\UpdateLogIN.txt"
	set CINVERNSTALL=1
) ELSE (
	set CINVERNSTALL=0
)

GOTO dirqinstall
pause

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------


:dirqinstall
%ColOrange%
cls

call :ASCIILOGO
   
echo  __________________________ %ColHigh%INSTALLING OHUD%ColOrange%  _________________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.

echo.
echo  Install to Found Directory?:
echo  %ColHigh%%_fpath%\tf\custom%ColOrange% 

echo.
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  -%ColHigh%[ Y/N ]%ColOrange%-----------------------------------%ColHigh%[ Hit ENTER to go back. ]%ColOrange%-

SET choice=
SET /p choice=Proceed?%ColHigh% : 

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	IF '%choice%'=='Y' GOTO ZDIRQINSTALLyes
	IF '%choice%'=='y' GOTO ZDIRQINSTALLyes
	IF '%choice%'=='N' GOTO startinstalstate
	IF '%choice%'=='n' GOTO startinstalstate
	
	IF '%choice%'=='' GOTO dirqinstall
	
:ZDIRQINSTALLyes	
powershell -Command "Invoke-WebRequest %dllink% -Outfile OHUD.zip"
powershell -Command Expand-Archive -LiteralPath '%cd%\OHUD.zip' -DestinationPath '%_fpath%tf\custom' -Force
del "%~dp0\OHUD.zip" /s /f /q 2>nul >nul


%ColOrange%
cls

call :ASCIILOGO
    
echo  ____________________ %ColHigh%OHUD INSTALLATION FINISHED%ColOrange% _____________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo Installed to:
for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
set "filename=%_fpath%"
For %%A in ("%filename%") do (
	echo "%%~dA\...%%~pAtf\custom"
	echo.
)
echo.
findstr /m "UpdateVer" "UpdateLog.txt"2>nul >nul
if %errorlevel%==0 (
for /f "tokens=1,* delims=:" %%a in ('findstr "UpdateVer" "UpdateLog.txt"') do set UpdateVer=%%b
for /f "tokens=* delims= " %%c in ("!UpdateVer!") do set UpdateVer=%%c
echo Version: [32m!UpdateVer!%ColOrange%
)
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  ---------------------------------------------------------------------
del "OHUDtemp.txt" /s /f /q 2>nul >nul
MOVE /y "UpdateLog.txt" "%_fpath%\OrangeHUD-main\UpdateLogIN.txt"2>nul >nul
del "UpdateLog.txt" /s /f /q 2>nul >nul
del "Orange.ini" /s /f /q 2>nul >nul
del "OHUD.zip" /s /f /q 2>nul >nul

FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 440" /v InstallLocation`) DO (
    set TF2DIR=%%A %%B
)

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: Makes a shortcut to desktop after install

cd %TF2DIR%\tf\custom\OrangeHUD-main
echo Set oWS = WScript.CreateObject("WScript.Shell") > OHUDManager.vbs
echo sLinkFile = "%userprofile%\Desktop\OHUDManager.lnk" >> OHUDManager.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> OHUDManager.vbs
echo oLink.TargetPath = "%TF2DIR%\tf\custom\OrangeHUD-main\OHUDManager.bat" >> OHUDManager.vbs
echo oLink.WorkingDirectory = "%TF2DIR%\tf\custom\OrangeHUD-main" >> OHUDManager.vbs
echo oLink.Description = "OrangeHUD Manager" >> OHUDManager.vbs
echo oLink.IconLocation = "%TF2DIR%\tf\custom\OrangeHUD-main\Orangeprint.ico" >> OHUDManager.vbs
echo oLink.Save >> OHUDManager.vbs
cscript OHUDManager.vbs>nul
del OHUDManager.vbs



Echo  Hit ENTER to exit
pause >nul
del "OHUDManager.bat" /s /f /q 2>nul >nul
exit







:exit
EXIT







:yesINSTALL
:selectlocation
%ColOrange%
cls

call :ASCIILOGO

echo  __________________________ %ColHigh%INSTALLING OHUD%ColOrange%  _________________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo          %ColHigh%Select custom folder in Team Fortress 2 Directory.%ColOrange%
echo.
echo.
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  ---------------------------------------------------------------------

SET FOLDER=%%Q
SET "PScommand="POWERSHELL Add-Type -AssemblyName System.Windows.Forms; $FolderBrowse = New-Object System.Windows.Forms.OpenFileDialog -Property @{ValidateNames = $false;CheckFileExists = $false;RestoreDirectory = $true;FileName = 'Selected Folder';};$null = $FolderBrowse.ShowDialog();$FolderName = Split-Path -Path $FolderBrowse.FileName;Write-Output $FolderName""
FOR /F "usebackq tokens=*" %%Q in (`%PScommand%`) DO (
	set _fpath=%%Q
	set DIRF=1
)
:confirmselectedpath
cls

call :ASCIILOGO

echo  __________________________ %ColHigh%INSTALLING OHUD%ColOrange%  _________________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo  Selected Path:


echo  %ColHigh%%_fpath%%ColOrange%
	IF "%_fpath%" == ""  GOTO startinstalstate
)


echo.
echo.
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  -%ColHigh%[ Y/N ]%ColOrange%-------------------------------------------------
SET choice=
SET /p choice=Proceed?%ColHigh% : 

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	IF '%choice%'=='Y' GOTO yesSELECT
	IF '%choice%'=='y' GOTO yesSELECT
	IF '%choice%'=='N' GOTO startinstalstate
	IF '%choice%'=='n' GOTO startinstalstate
	
	IF '%choice%'=='' GOTO confirmselectedpath
	
:yesSELECT
SETLOCAL EnableExtensions
SET EXE=hl2.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF NOT %%x == %EXE% (
  GOTO notRunning
) ELSE (
  GOTO Running
)

:Running
	taskkill /IM hl2.exe /F>NUL
	powershell -Command "Invoke-WebRequest %dllink% -Outfile OHUD.zip"
	echo %height% 2>nul >nul
goto unpack

:notRunning
	powershell -Command "Invoke-WebRequest %dllink% -Outfile OHUD.zip"
	goto unpack
	echo %height% 2>nul >nul

:unpack
	powershell -Command Expand-Archive -LiteralPath '%cd%\OHUD.zip' -DestinationPath '%_fpath%' -Force
	echo %height% 2>nul >nul
	MOVE /y "UpdateLog.txt" "%_fpath%\OrangeHUD-main\UpdateLogIN.txt"2>nul >nul
	del "UpdateLog.txt" /s /f /q 2>nul >nul
	del "Orange.ini" /s /f /q 2>nul >nul
	del "OHUDtemp.txt" /s /f /q 2>nul >nul
	del "OHUD.zip" /s /f /q 2>nul >nul
	
FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 440" /v InstallLocation`) DO (
    set TF2DIR=%%A %%B
)

cd %TF2DIR%\tf\custom\OrangeHUD-main
echo Set oWS = WScript.CreateObject("WScript.Shell") > OHUDManager.vbs
echo sLinkFile = "%userprofile%\Desktop\OHUDManager.lnk" >> OHUDManager.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> OHUDManager.vbs
echo oLink.TargetPath = "%TF2DIR%\tf\custom\OrangeHUD-main\OHUDManager.bat" >> OHUDManager.vbs
echo oLink.WorkingDirectory = "%TF2DIR%\tf\custom\OrangeHUD-main" >> OHUDManager.vbs
echo oLink.Description = "OrangeHUD Manager" >> OHUDManager.vbs
echo oLink.IconLocation = "%TF2DIR%\tf\custom\OrangeHUD-main\Orangeprint.ico" >> OHUDManager.vbs
echo oLink.Save >> OHUDManager.vbs
cscript OHUDManager.vbs>nul
del OHUDManager.vbs

set fld=%TF2DIR%\tf\custom\OrangeHUD-main
set ico=%fld%\Folder.ico
(
echo [.ShellClassInfo]
echo IconResource=Folder.ico,0
echo [ViewState]
echo Mode=
echo Vid=
echo FolderType=Generic
) > "%fld%\desktop.ini"
attrib +h +s -a "%fld%\desktop.ini"
attrib +r "%fld%"
attrib +h "%fld%\icons"



Echo  Hit ENTER to exit
pause >nul
del "OHUDManager.bat" /s /f /q 2>nul >nul
exit







:noINSTALL
%ColOrange%
cls

call :ASCIILOGO
    
echo  _____________________ %ColHigh%OHUD INSTALL CANCELLED%ColOrange% ________________________
echo  ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                         [31mProccess Cancelled.%ColOrange%
echo.
echo.
echo.
echo.
echo  _____________________________________________________________________
echo  ---------------------------------------------------------------------
echo %height% 2>nul >nul
del "OHUDtemp.txt" /s /f /q 2>nul >nul
del "UpdateLog.txt" /s /f /q 2>nul >nul
del "Orange.ini" /s /f /q 2>nul >nul
Echo Exit: press any key.
pause >nul
:exit
exit


::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: ASCII COLOR FADE SPEIFICATIONS AND MATH
:: ALSO HAS AQUA BLUE HIGHLIGHT COLOR

:ASCIILOGO

::BG MAIN
SET R=247
SET G=128
SET B=42

::FG LOGO
SET FR=154
SET FG=90
SET FB=26   

::FG HIGHLIGHTS
SET FER=250
SET FEG=160
SET FEB=62

::BG AFTER LOGO
SET AR=247
SET AG=128
SET AB=42

SET /a XN=0

FOR /F tokens^=* %%i in ('type %orange%
')do set /a "_cnt+=1+0" && call set "_var!_cnt!=%%~i" 
	) do (
		call set /a XN+=!_cnt!
		FOR /F "tokens=1-4 delims=$$" %%a in (%orange%
	) do (
		set "BG=%%a"
		set "LOGO=%%b"
		set "BG2=%%c"
		
		set FGA=[38;2;!FR!;!FG!;!FB!m
		set FGC=[38;2;!FER!;!FEG!;!FEB!m
		set NAMET=[38;2;98;51;16m
		
		::FOREGROUND LOGO EDGE FADE
		SET /a FER-=1  && if !FER! LEQ 0 SET FER=0
		SET /a FEG-=1  && if !FEG! LEQ 0 SET FEG=0
		SET /a FEB-=1  && if !FEB! LEQ 0 SET FEB=0
		if !FER! GTR 255 SET FER=255
		if !FEG! GTR 170 SET FEG=170
		if !FEB! GTR 72  SET FEB=72 
		
		::FOREGROUND LOGO FADE
		SET /a FR+=5  && if !FR! LEQ 0 SET FR=0
		SET /a FG+=3  && if !FG! LEQ 0 SET FG=0
		SET /a FB+=2  && if !FB! LEQ 0 SET FB=0
		if !FR! GTR 247 SET FR=247
		if !FG! GTR 128 SET FG=128
		if !FB! GTR 42 SET FB=42
		
		::BG COLOR FADE
		SET /a R-=6  && if !R! LEQ 0 SET R=0
		SET /a G+=3  && if !G! LEQ 0 SET G=0
		SET /a B+=5  && if !B! LEQ 0 SET B=0
		if !R! GTR 255 SET R=255
		if !G! GTR 255 SET G=255
		if !B! GTR 255 SET B=255
		
		::BG2 COLOR FADE AFTER LOGO
		SET /a AR-=8  && if !AR! LEQ 0 SET AR=0
		SET /a AG-=4  && if !AG! LEQ 0 SET AG=0
		SET /a AB-=1  && if !AB! LEQ 0 SET AB=0
		if !AR! GTR 255 SET AR=255
		if !AG! GTR 255 SET AG=255
		if !AB! GTR 255 SET AB=255
		
		::ECHO
		call set LINE=[38;2;!R!;!G!;!B!m!BG![38;2;!FR!;!FG!;!FB!m!LOGO![38;2;!AR!;!AG!;!AB!m!BG2!
		echo  !LINE!
		
		
		:: highlight color
		set ColHigh=[38;2;!R!;!G!;!B!m
	)	
)
echo  [38;2;!R!;!G!;!B!m_____________________________________________________________________[38;2;247;128;42m
chcp 1252 >nul
