@echo off&setlocal
SETLOCAL EnableDelayedExpansion
::   _____________________________________________________________________    
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------
::
::				DESCRIPTION
::
::
::
::
::
::
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

::Launch defs
title OHUD Manager
color 06

::   _____________________________________________________________________    
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:: Window size set and fix
:: adding [ echo %height% 2>nul >nul ] to any state resets the size of-
:: this window if it has been dragged accidentally.
:: uses powershell to call for the window size.

FOR /F "delims=" %%G in ('powershell.exe -executionpolicy unrestricted $host.UI.RawUI.WindowSize.Height') do SET height=%%G
	IF /I "%height%" GEQ "69" mode con: cols=69 lines=49
	IF /I "%height%" LEQ "69" mode con: cols=69 lines=49
echo %height% 2>nul >nul

   
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

::links
	set gitlink=https://github.com/Orangeprint-git/OrangeHUD.git
	set dllink=https://github.com/Orangeprint-git/OrangeHUD/archive/refs/heads/main.zip 
	set dllog=https://raw.githubusercontent.com/Orangeprint-git/OrangeHUD/main/UpdateLog.txt
	set dlascii=https://raw.githubusercontent.com/Orangeprint-git/OrangeHUD/main/Orange.txt
	
	set TXTECHO=Orange.txt
	
:conerr
::Update version check
	SET RLVER=
	del "UpdateLog.txt" /s /f /q 2>nul >nul
	powershell -Command "Invoke-WebRequest %dllog% -Outfile UpdateLog.txt">nul
	powershell -Command "Invoke-WebRequest %dlascii% -Outfile Orange.txt">nul
	if %errorlevel%==0 (
	echo.2>nul
) ELSE (
	GOTO noconnection 
	pause 
)
   
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

::Version error
IF EXIST "UpdateLogIN.txt" (
	set ULIN=UpdateLogIN.txt
) ELSE (
echo  UpdateVer: ERR:"[31mUpdateLogIN.txt not found.[33m" > OHUDtemp.txt
	set ULIN=OHUDtemp.txt
)



:: if hud install not found make window into install state

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
[33m
cls
for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)
echo _____________________________________________________________________    
echo _____________________________________________________________________ 
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo                           [31mConnection error.[33m


echo.
echo.
echo.
echo.
echo _____________________________________________________________________ 
echo ---------------------------------------------------------------------
echo %height% 2>nul >nul
SET choice=
SET /p choice=Reconnect? [93m:

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	
	IF '%choice%'=='' GOTO conerr 
	IF '%choice%'=='y' GOTO conerr
	IF '%choice%'=='Y GOTO conerr
	IF '%choice%'=='n' GOTO exit
	IF '%choice%'=='N' GOTO exit 
	
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------
	
	





:startcls
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo ________________ [93mUPDATING FILES IN CURRENT DIRECTORY[33m ________________ 
echo ---------------------------------------------------------------------
echo %height% 2>nul >nul

::shortened directory echo

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


::Version error
IF EXIST "UpdateLogIN.txt" (
	set ULIN=UpdateLogIN.txt
) ELSE (
echo  UpdateVer: ERR:"[31mUpdateLogIN.txt not found.[33m" > OHUDtemp.txt
	set ULIN=OHUDtemp.txt
)

::finds UpdateVer: line in UpdateLog.txt
	findstr "UpdateVer" "UpdateLog.txt" 2>nul >nul
	if %errorlevel%==0 (
	for /f "tokens=1,* delims=:" %%c in ('findstr "UpdateVer" "UpdateLog.txt"') do set UpdateVer=%%d
) ELSE (
	do set UpdateVer=[31mERR[33m
) 


::finds UpdateVer: line in UpdateLogIN.txt which is the currently installed version.
	findstr "UpdateVer" "%ULIN%" 2>nul >nul
	if %errorlevel%==0 (
	for /f "tokens=1,* delims=:" %%g in ('findstr "UpdateVer" "%ULIN%"') do set UpdateVer2=%%h
) ELSE (
	echo ERR
) 


if %UpdateVer2% GEQ %UpdateVer% (
	echo %UpdateVer2% [32mUP TO DATE[33m 
) ELSE (
	echo %UpdateVer2% [31mOUTDATED[33m
)

::Date and time of last installed version.
for %%I in (
	"%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
	set "filename=%ParentFolderName%\OrangeHUD-main"
	For %%A in ("%filename%"
) do (
	echo  %%~tA
)

::latest github from UpdateVer: line in UpdateLog.txt
	echo.
	echo  newest github version:
	echo [93m%UpdateVer%[33m
echo.	
echo _____________________________________________________________________
echo -[93m[ Y/N/ HELP / GIT / UNINSTALL ][33m------------[93m[ Hit ENTER to reload. ][33m-
SET choice=
SET /p choice=Command[93m : 

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
	IF '%choice%'=='UNINSTALL' GOTO :Uninst
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:Uninst
[33m
taskkill /IM hl2.exe /F
for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
rmdir /S /Q "%ParentFolderName%\OrangeHUD-main" 9<"%~f0" 2>nul 
cls
for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)
echo _____________________________________________________________________    
echo _________________ [93mOHUD UNINSTALLATION SUCCESSFUL[33m ____________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                         [32mProccess Finished.[33m

echo.
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
ECHO  Press ENTER to go back to start, or click X to close.
del "UpdateLogIN.txt" /s /f /q 2>nul >nul
pause >nul
GOTO %startfunc%



:WindowSizecommand
	echo %height% 2>nul >nul
	GOTO startcls

:rvd
SETLOCAL EnableDelayedExpansion
	powershell -Command "Invoke-WebRequest %dllog% -Outfile UpdateLog.txt"
	echo %height% 2>nul >nul
	GOTO startcls


:git
	start "" %gitlink%
	echo %height%
	goto startcls

:yes
@echo off
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
for %%I in (
	"%~dp0."
)	do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
	powershell -Command Expand-Archive -LiteralPath '%cd%\OHUD.zip' -DestinationPath '%ParentFolderName%' -Force
	echo %height% 2>nul >nul
	GOTO updatefinished
	
::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:updatefinished
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo _____________________ [93mOHUD UPDATE SUCCESSFUL[33m ________________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                         [32mProccess Finished.[33m

echo.
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
echo %height% 2>nul >nul
del "%~dp0\OHUD.zip" /s /f /q 2>nul >nul
del "OHUDtemp.txt" /s /f /q 2>nul >nul
MOVE /y "UpdateLog.txt" "UpdateLogIN.txt"2>nul >nul
del "UpdateLog.txt" /s /f /q 2>nul >nul
ECHO  Press ENTER to go back to start, or click X to close.
pause >nul
GOTO %startfunc%

::   _____________________________________________________________________ 
::   ---------------------------------------------------------------------

:Resources
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo _____________________ [93mOHUD UPDATE SUCCESSFUL[33m ________________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo             [31mpsd files and other materials created for for hud.[33m
echo                 [31mTHESE FILES HAVE NOT BEEN SET UP YET[33m
echo.
echo.
echo.
echo _____________________________________________________________________
echo -[93m[ Y/N/ HELP ][33m-------------------------------------------------------
echo %height% 2>nul >nul


SET choice=
SET /p choice=Proceed?[93m : 

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
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo ______________________ [93mOHUD UPDATE CANCELLED[33m ________________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                         [31mProccess Cancelled.[33m
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
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
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo _____________________________ [93mOHUD HELP[33m _____________________________
echo ---------------------------------------------------------------------
echo.
echo  Commands                         I
echo                                   I
echo    Resources: ............. [93mR[33m     I   ..........................
echo    Github: ................ [93mG[33m     I   ..........................
echo    Quit: .................. [93mQ[33m     I   ..........................
echo    Back: .................. [93mB[33m     I   ..........................
echo    Scan where tf2 + ins ... [93mDIRQ[33m  I   ..........................
echo    Reload ver file......... [93mRL[33m    I   ..........................
echo                                   I  
echo _____________________________________________________________________
echo -------------------------------------------[93m[ Hit ENTER to go back. ][33m-
echo %height% 2>nul >nul
SET choice=
SET /p choice=Command[93m : 

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
	powershell -Command "Invoke-WebRequest %dlascii% -Outfile Orange.txt">nul
	if %errorlevel%==0 (
	echo.2>nul
) ELSE (
	GOTO noconnection 
	pause 
)

:startinstalstate
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo ___________________________ [93mOHUD INSTALLER[33m __________________________
echo ---------------------------------------------------------------------
echo %height% 2>nul >nul



::shortened directory echo

for /D %%I in ("%~dp0."
) do for %%J in (
	"%%~dpI."
 
) do set ParentFolderName=%%~dpnxJ
	set "filename=%ParentFolderName%\OrangeHUD-main"
	For %%A in ("%filename%"

) do (
	echo.
	echo  %CD%
	echo.
)

::finds UpdateVer: line in UpdateLogIN.txt which is the currently installed version.
	findstr "UpdateVer" "UpdateLog.txt" 2>nul >nul
	if %errorlevel%==0 (
	for /f "tokens=1,* delims=:" %%g in ('findstr "UpdateVer" "UpdateLog.txt"') do set UpdateVer3=%%h
)

	echo  enter [93m[ Y / N ][33m Select custom folder.
	echo  or [93m[ DIRQ ][33m to Automatically check TF2 dir.
	echo.
	echo  newest github version:
	echo [93m%UpdateVer3%[33m
	echo.
	

echo.
echo _____________________________________________________________________
echo -[93m[ Y/N/ DIRQ / GIT / HELP ][33m-----------------[93m[ Hit ENTER to reload. ][33m-
SET choice=
SET /p choice=Command[93m : 

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	IF '%choice%'=='Y' GOTO yesINSTALL
	IF '%choice%'=='y' GOTO yesINSTALL
	IF '%choice%'=='N' GOTO noINSTALL
	IF '%choice%'=='n' GOTO noINSTALL
	
	IF '%choice%'=='dirq' GOTO dirquery
	IF '%choice%'=='DIRQ' GOTO dirquery
	
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
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo ____________________ [93mSEARCHING FOR TF2 INSTALL[33m ______________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                  [93mPlease wait, this may take a while.[33m
echo.
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
echo %height% 2>nul >nul

@echo off&setlocal
SETLOCAL EnableDelayedExpansion
FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 440" /v InstallLocation`) DO (
    set _fpath=%%A %%B
)
GOTO dirqinstall
pause


:dirqinstall
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo __________________________ [93mINSTALLING OHUD[33m  _________________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.

echo Install Directory:
for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
set "filename=%_fpath%"
For %%A in ("%filename%") do (
	echo "%%~dA\...%%~pAtf\custom"
	echo.
)
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
powershell -Command "Invoke-WebRequest %dllink% -Outfile OHUD.zip"
powershell -Command Expand-Archive -LiteralPath '%cd%\OHUD.zip' -DestinationPath '%_fpath%tf\custom' -Force
del "%~dp0\OHUD.zip" /s /f /q 2>nul >nul

[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo ____________________ [93mOHUD INSTALLATION FINISHED[33m _____________________
echo ---------------------------------------------------------------------
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
echo Version: [32m!UpdateVer![33m
)
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
del "OHUDtemp.txt" /s /f /q 2>nul >nul
MOVE /y "UpdateLog.txt" "%_fpath%\OrangeHUD-main\UpdateLogIN.txt"2>nul >nul
del "UpdateLog.txt" /s /f /q 2>nul >nul
del "Orange.txt" /s /f /q 2>nul >nul
del "OHUD.zip" /s /f /q 2>nul >nul
Echo Exit: press any key.
pause >nul
exit







:exit
EXIT







:yesINSTALL
:selectlocation
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo __________________________ [93mINSTALLING OHUD[33m  _________________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo          [93mSelect custom folder in Team Fortress 2 Directory.[33m
echo.
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------

SET FOLDER=%%Q
SET "PScommand="POWERSHELL Add-Type -AssemblyName System.Windows.Forms; $FolderBrowse = New-Object System.Windows.Forms.OpenFileDialog -Property @{ValidateNames = $false;CheckFileExists = $false;RestoreDirectory = $true;FileName = 'Selected Folder';};$null = $FolderBrowse.ShowDialog();$FolderName = Split-Path -Path $FolderBrowse.FileName;Write-Output $FolderName""
FOR /F "usebackq tokens=*" %%Q in (`%PScommand%`) DO (
	set _fpath=%%Q
	set DIRF=1
)
:confirmselectedpath
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo __________________________ [93mINSTALLING OHUD[33m  _________________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo  Selected Path:


echo  [93m%_fpath%[33m
	IF "%_fpath%" == ""  GOTO startinstalstate
)


echo.
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo -[93m[ Y/N ][33m-------------------------------------------------
SET choice=
SET /p choice=Proceed?[93m : 

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
	del "Orange.txt" /s /f /q 2>nul >nul
	del "OHUDtemp.txt" /s /f /q 2>nul >nul
	del "OHUD.zip" /s /f /q 2>nul >nuly
	EXIT






:noINSTALL
[33m
cls

for /f "usebackq eol= tokens=* delims= " %%a in (`findstr /n ^^^^ "%TXTECHO%"`) do (
    set line=%%a
    set "line=!line:*:=!"
    echo(!line!
)

echo _____________________________________________________________________    
echo _____________________ [93mOHUD INSTALL CANCELLED[33m ________________________
echo ---------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo                         [31mProccess Cancelled.[33m
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
echo %height% 2>nul >nul
del "OHUDtemp.txt" /s /f /q 2>nul >nul
del "UpdateLog.txt" /s /f /q 2>nul >nul
Echo Exit: press any key.
pause >nul
:exit
exit
