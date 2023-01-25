@echo off&setlocal
SETLOCAL EnableDelayedExpansion
title OHUD Update
color 06
mode 70,48


IF exist %cd%\UpdateLog.txt (
    ren "%cd%\UpdateLog.txt" "%cd%\UpdateLog-old.txt"
) ELSE (
    echo " "
)

powershell -Command "Invoke-WebRequest %log% -Outfile UpdateLog.txt"

set gitlink=https://github.com/Orangeprint-git/OrangeHUD.git
set dllink=https://github.com/Orangeprint-git/OrangeHUD/archive/refs/heads/main.zip 
set log=https://github.com/Orangeprint-git/OrangeHUD/raw/59c8e8dc2f7635e912963b37a7cdce8160b5738d/UpdateLog.txt

cls
echo .....................................................................
echo .....................................................................
echo ..................................................;WMMM..............
echo ................................................7aZ@M@MM.............
echo .............................................r2Xi;..7MWMM............
echo ..........................................i2Xi:::::..7MWMM...........
echo .......................................;XSii::,i::::;.XMW@M..........
echo .....................................rS;::::::::i:i::..aMB@M.........
echo ..................................XMZ;;ii::i:iii:i;;.,.;MWBMM........
echo ...............................;MMMMM2;i;ii:i:i:i:i:i:,;MMWBMM.......
echo ............................;MMMMMMWMX.............;.;.;;0MBBM;......
echo ..........................Sa7:Z@.,M7.:7;;...;.;.;;;.;.....MWBWM......
echo .......................raX;i::7;...Z...:ii;;.;.;;;;;.;....2MBWMX.....
echo ....................;SS;iiiiii;..;.;X.....:,,.;.;;;.;.;.;.rMBB@M.....
echo ..................Sa;iiiiiiii;..;i;.:i.;.;.;;;;;;;;;.;.;..iMBBBM.....
echo ...............;aX;i;iiiii;i;:..;:i..;;.;.;.;.;;;;;.;.;...rMB0BM;....
echo ............;MMZ.,iiiii;;i:ri;.;.;.;.;;;.;.;.;.;.;;:;;....2MBBBMi....
echo ..........XWMMM@i.;;iiii;..:..;.;.;;;.::..;.;;;;;.;;;;::.;@WBBWM.....
echo ........Z2..:WMMMa,..::;.....;.;;;.;.;.i;.;;.;.;;;;;...;WM@B0BMM.....
echo ......Z2;.....;MMMMai.;.....;.;.;.;;;;;.r;..;;;.;;;;;...ZMB0BWM......
echo .....W;.........SMMMMW2r..;;...;;;.;;;;.;7...;.;.;;;...:BWBBBM7......
echo ....0;:;..........ZMMMMMM8M:....;.;.;;;..iX...;.;.....;BMBBWMS.......
echo .....ZSiir..........aMMMMMM@7........;....rr........iaMMBWMMi........
echo .......ZXi;;..........XMMMMMMMX;...........@i....;XWMM@B@MM..........
echo ........:87;i...........;SMMMMMMM@ZSr;;XXZ8MM@0BWMMMW@@MMi...........
echo ..........,ZS;;.............rSWMMMMMMMMMMMMMMMMMMMMMMMM;.............
echo .............aZX;.................;irSaBWMMMMMWBS72BZ................
echo ...............;8a;.............................iXr..................
echo ..................iaaXi.....................i77i.....................
echo ......................;ii;;iiii:::i:i:;i;;;..........................
echo .....................................................................
echo .....................................................................
echo _____________________________________________________________________    
echo ________________ UPDATING FILES IN CURRENT DIRECTORY ________________ 
echo ---------------------------------------------------------------------


for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
set "filename=%ParentFolderName%\OrangeHUD-main"
For %%A in ("%filename%") do (
    echo.
	echo %%~dA\...%%~pA"
	echo.
    echo Installed: %%~tA)
	echo.
findstr /m "UpdateVer" "UpdateLog.txt"
if %errorlevel%==0 (
for /f "tokens=1,* delims=:" %%a in ('findstr "UpdateVer" "UpdateLog.txt"') do set UpdateVer=%%b
for /f "tokens=* delims= " %%c in ("!UpdateVer!") do set UpdateVer=%%c
echo Version: !UpdateVer!
)
echo License: @Creative Commons Zero v1.0 UL.
	
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
:start
SET choice=
SET /p choice=Proceed? [Y/N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
IF '%choice%'=='g' GOTO git
IF '%choice%'=='G GOTO git
IF '%choice%'=='git GOTO git
IF '%choice%'=='Git' GOTO git
IF '%choice%'=='GIT' GOTO git
IF '%choice%'=='Gi' GOTO git
IF '%choice%'=='GI' GOTO git

:git
start "" %gitlink%
goto startcls

:yes
@echo off
SETLOCAL EnableExtensions
SET EXE=hl2.exe
REM for testing
REM SET EXE=svchost.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF NOT %%x == %EXE% (
  GOTO notRunning
) ELSE (
  GOTO Running
)
...
:Running
taskkill /IM hl2.exe /F>NUL
powershell -Command "Invoke-WebRequest %dllink% -Outfile OHUD.zip"
goto unpack

:notRunning
powershell -Command "Invoke-WebRequest %dllink% -Outfile OHUD.zip"
goto unpack

:unpack
for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
powershell -Command Expand-Archive -LiteralPath '%cd%\OHUD.zip' -DestinationPath '%ParentFolderName%' -Force
cls
echo .....................................................................
echo .....................................................................
echo ..................................................;WMMM..............
echo ................................................7aZ@M@MM.............
echo .............................................r2Xi;..7MWMM............
echo ..........................................i2Xi:::::..7MWMM...........
echo .......................................;XSii::,i::::;.XMW@M..........
echo .....................................rS;::::::::i:i::..aMB@M.........
echo ..................................XMZ;;ii::i:iii:i;;.,.;MWBMM........
echo ...............................;MMMMM2;i;ii:i:i:i:i:i:,;MMWBMM.......
echo ............................;MMMMMMWMX.............;.;.;;0MBBM;......
echo ..........................Sa7:Z@.,M7.:7;;...;.;.;;;.;.....MWBWM......
echo .......................raX;i::7;...Z...:ii;;.;.;;;;;.;....2MBWMX.....
echo ....................;SS;iiiiii;..;.;X.....:,,.;.;;;.;.;.;.rMBB@M.....
echo ..................Sa;iiiiiiii;..;i;.:i.;.;.;;;;;;;;;.;.;..iMBBBM.....
echo ...............;aX;i;iiiii;i;:..;:i..;;.;.;.;.;;;;;.;.;...rMB0BM;....
echo ............;MMZ.,iiiii;;i:ri;.;.;.;.;;;.;.;.;.;.;;:;;....2MBBBMi....
echo ..........XWMMM@i.;;iiii;..:..;.;.;;;.::..;.;;;;;.;;;;::.;@WBBWM.....
echo ........Z2..:WMMMa,..::;.....;.;;;.;.;.i;.;;.;.;;;;;...;WM@B0BMM.....
echo ......Z2;.....;MMMMai.;.....;.;.;.;;;;;.r;..;;;.;;;;;...ZMB0BWM......
echo .....W;.........SMMMMW2r..;;...;;;.;;;;.;7...;.;.;;;...:BWBBBM7......
echo ....0;:;..........ZMMMMMM8M:....;.;.;;;..iX...;.;.....;BMBBWMS.......
echo .....ZSiir..........aMMMMMM@7........;....rr........iaMMBWMMi........
echo .......ZXi;;..........XMMMMMMMX;...........@i....;XWMM@B@MM..........
echo ........:87;i...........;SMMMMMMM@ZSr;;XXZ8MM@0BWMMMW@@MMi...........
echo ..........,ZS;;.............rSWMMMMMMMMMMMMMMMMMMMMMMMM;.............
echo .............aZX;.................;irSaBWMMMMMWBS72BZ................
echo ...............;8a;.............................iXr..................
echo ..................iaaXi.....................i77i.....................
echo ......................;ii;;iiii:::i:i:;i;;;..........................
echo .....................................................................
echo .....................................................................
echo _____________________________________________________________________    
echo _____________________ OHUD UPDATE SUCCESSFUL ________________________
echo ---------------------------------------------------------------------
echo.
echo.
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
call :colorEcho 0a "                         Proccess Finished."

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
pause
start "" "steam://rungameid/440"
del "%~dp0\OHUD.zip" /s /f /q
exit




:no
cls
echo .....................................................................
echo .....................................................................
echo ..................................................;WMMM..............
echo ................................................7aZ@M@MM.............
echo .............................................r2Xi;..7MWMM............
echo ..........................................i2Xi:::::..7MWMM...........
echo .......................................;XSii::,i::::;.XMW@M..........
echo .....................................rS;::::::::i:i::..aMB@M.........
echo ..................................XMZ;;ii::i:iii:i;;.,.;MWBMM........
echo ...............................;MMMMM2;i;ii:i:i:i:i:i:,;MMWBMM.......
echo ............................;MMMMMMWMX.............;.;.;;0MBBM;......
echo ..........................Sa7:Z@.,M7.:7;;...;.;.;;;.;.....MWBWM......
echo .......................raX;i::7;...Z...:ii;;.;.;;;;;.;....2MBWMX.....
echo ....................;SS;iiiiii;..;.;X.....:,,.;.;;;.;.;.;.rMBB@M.....
echo ..................Sa;iiiiiiii;..;i;.:i.;.;.;;;;;;;;;.;.;..iMBBBM.....
echo ...............;aX;i;iiiii;i;:..;:i..;;.;.;.;.;;;;;.;.;...rMB0BM;....
echo ............;MMZ.,iiiii;;i:ri;.;.;.;.;;;.;.;.;.;.;;:;;....2MBBBMi....
echo ..........XWMMM@i.;;iiii;..:..;.;.;;;.::..;.;;;;;.;;;;::.;@WBBWM.....
echo ........Z2..:WMMMa,..::;.....;.;;;.;.;.i;.;;.;.;;;;;...;WM@B0BMM.....
echo ......Z2;.....;MMMMai.;.....;.;.;.;;;;;.r;..;;;.;;;;;...ZMB0BWM......
echo .....W;.........SMMMMW2r..;;...;;;.;;;;.;7...;.;.;;;...:BWBBBM7......
echo ....0;:;..........ZMMMMMM8M:....;.;.;;;..iX...;.;.....;BMBBWMS.......
echo .....ZSiir..........aMMMMMM@7........;....rr........iaMMBWMMi........
echo .......ZXi;;..........XMMMMMMMX;...........@i....;XWMM@B@MM..........
echo ........:87;i...........;SMMMMMMM@ZSr;;XXZ8MM@0BWMMMW@@MMi...........
echo ..........,ZS;;.............rSWMMMMMMMMMMMMMMMMMMMMMMMM;.............
echo .............aZX;.................;irSaBWMMMMMWBS72BZ................
echo ...............;8a;.............................iXr..................
echo ..................iaaXi.....................i77i.....................
echo ......................;ii;;iiii:::i:i:;i;;;..........................
echo .....................................................................
echo .....................................................................
echo _____________________________________________________________________    
echo ______________________ OHUD UPDATE CANCELLED ________________________
echo ---------------------------------------------------------------------
echo.
echo.

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
call :colorEcho 04 "                         Proccess Cancelled."

:colorEcho
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
echo.
echo.
echo.
echo.
echo _____________________________________________________________________
echo ---------------------------------------------------------------------
pause
exit
