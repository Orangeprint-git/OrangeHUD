@echo off&setlocal

title OHUD Update

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
echo directory - %~dp0 
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

ECHO.
GOTO start
:no
EXIT

:yes
taskkill /IM hl2.exe /F
powershell -Command "Invoke-WebRequest https://github.com/Orangeprint-git/OrangeHUD/archive/refs/heads/main.zip -Outfile OHUD.zip"

for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolderName=%%~dpnxJ
powershell -Command Expand-Archive -LiteralPath '%cd%\OHUD.zip' -DestinationPath '%ParentFolderName%' -Force

echo _____________________________________________________________________
echo ---------------------------------------------------------------------
echo Finished.
                                   
PAUSE
start "" "steam://rungameid/440"
del "%~dp0\OHUD.zip" /s /f /q
EXIT