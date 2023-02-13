@echo off

:: Select your system 
:C_SYS_END_START
ECHO.
ECHO ----------------------------------------------------------------
ECHO Select from option 1 or 2 to select your System, or 3 to Exit
ECHO ----------------------------------------------------------------
ECHO.
ECHO 1 - Intel
ECHO 2 - AMD
ECHO 3 - Exit 
ECHO.
SET /P S=Select from option 1 or 2 then press ENTER:
IF %S%==1 GOTO INTEL
IF %S%==2 GOTO AMD
IF %S%==3 GOTO EOF

::Default Case
echo No option was found. Please try again.
pause
goto C_SYS_END_START

:INTEL
SET client_sys=1
GOTO C_SYS_END
:AMD
SET client_sys=2
GOTO C_SYS_END
:C_SYS_END
CLS

:: OS selection menu
:MENU_START
ECHO.
ECHO ---------------------------------------------------------------
ECHO Select from option 1 to 12 to select your OS, or 13 to Exit
ECHO ---------------------------------------------------------------
ECHO.
ECHO 1  - Ventura (Latest)
ECHO 2  - Monterey
ECHO 3  - Big Sur
ECHO 4  - Catalina
ECHO 5  - Mojave
ECHO 6  - High Sierra
ECHO 7  - Sierra
ECHO 8  - El Capitan
ECHO 9  - Yosemite
ECHO 10 - Mavericks
ECHO 11 - Mountain Lion
ECHO 12 - Lion
ECHO 13 - Exit
ECHO.
SET /P M=Select from option 1 to 13 then press ENTER:
IF %M%==1 GOTO VENTURA
IF %M%==2 GOTO MONTEREY
IF %M%==3 GOTO BIGSUR
IF %M%==4 GOTO CATALINA
IF %M%==5 GOTO MOJAVE
IF %M%==6 GOTO HIGHSIERRA
IF %M%==7 GOTO SIERRA
IF %M%==8 GOTO ELCAPITAN
IF %M%==9 GOTO YOSEMITE
IF %M%==10 GOTO MAVERICKS
IF %M%==11 GOTO MOUNTAINLION
IF %M%==12 GOTO LION
IF %M%==12 GOTO EOF

::Default Case
echo No option was found. Please try again.
pause
goto MENU_START

:VENTURA
set targetos=py macrecovery.py -b Mac-B4831CEBD52A0C4C -m 00000000000000000 -os latest download
set osname=Ventura
set macid=Mac-B4831CEBD52A0C4C
GOTO MENU_END
:MONTEREY
set targetos=py macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000000000 download
set osname=Monterey
set macid=Mac-E43C1C25D4880AD6
GOTO MENU_END
:BIGSUR
set targetos=py macrecovery.py -b Mac-2BD1B31983FE1663 -m 00000000000000000 download
set osname=Big Sur
set macid=Mac-2BD1B31983FE1663
GOTO MENU_END
:CATALINA
set targetos=py macrecovery.py -b Mac-00BE6ED71E35EB86 -m 00000000000000000 download
set osname=Catalina
set macid=Mac-00BE6ED71E35EB86
GOTO MENU_END
:MOJAVE
set targetos=py macrecovery.py -b Mac-7BA5B2DFE22DDD8C -m 00000000000KXPG00 download
set osname=Mojave
set macid=Mac-7BA5B2DFE22DDD8C
GOTO MENU_END
:HIGHSIERRA
set targetos=py macrecovery.py -b Mac-BE088AF8C5EB4FA2 -m 00000000000J80300 download
set osname=High Sierra
set macid=Mac-BE088AF8C5EB4FA2
GOTO MENU_END
:SIERRA
set targetos=py macrecovery.py -b Mac-77F17D7DA9285301 -m 00000000000J0DX00 download
set osname=Sierra
set macid=Mac-77F17D7DA9285301
GOTO MENU_END
:ELCAPITAN
set targetos=py macrecovery.py -b Mac-FFE5EF870D7BA81A -m 00000000000GQRX00 download
set osname=El Capitan
set macid=Mac-FFE5EF870D7BA81A
GOTO MENU_END
:YOSEMITE
set targetos=py macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000GDVW00 download
set osname=Yosemite
set macid=Mac-E43C1C25D4880AD6
GOTO MENU_END
:MAVERICKS
set targetos=py macrecovery.py -b Mac-F60DEB81FF30ACF6 -m 00000000000FNN100 download
set osname=Mavericks
set macid=Mac-F60DEB81FF30ACF6
GOTO MENU_END
:MOUNTAINLION
set targetos=py macrecovery.py -b Mac-7DF2A3B5E5D671ED -m 00000000000F65100 download
set osname=Mountain Lion
set macid=Mac-7DF2A3B5E5D671ED
GOTO MENU_ENDN
:LION
set targetos=py macrecovery.py -b Mac-C3EC7CD22292981F -m 00000000000F0HM00 download
set osname=Lion
set macid=Mac-C3EC7CD22292981F
GOTO MENU_END
:MENU_END
cls

:: Check if QEMU is installed
IF EXIST "C:\Program Files\qemu\qemu-img.exe" (
	echo --------------
	echo QEMU found
	echo --------------
	) ELSE (
	echo ---------------------------------------------------------------------------
	echo QEMU not found please download QEMU from https://qemu.weilnetz.de/w64/
	echo ---------------------------------------------------------------------------
	pause
	EXIT /B
)

:: Check if Python is installed
>nul 2>nul assoc .py && set availcheck=true
IF DEFINED availcheck (
	echo ----------------
	echo Python found
	echo ----------------
	) ELSE (
	echo ----------------------------------------------------------------------------------------
	echo echo Python not found please download Python from https://www.python.org/downloads/
	echo ----------------------------------------------------------------------------------------
	pause
	EXIT /B
)
echo .
echo .
timeout 5
cls

:: Initialization
set home=%~dp0
cd /d "%home%\OpenCore\Utilities\macrecovery"

:: Adding script to run the 
echo @echo off > run.bat
echo %targetos% >> run.bat

:: Download recovery image
echo -------------------------------
echo Downloading recovery image
echo -------------------------------
START /B /WAIT cmd /c "%home%\OpenCore\Utilities\macrecovery\run.bat"
echo .
echo .
timeout 5
cls

:: Convert reovery (dmg) file to image (img) file
cd "%home%\dmg2img"
echo -------------------------------------
echo Converting DMG file to image file
echo -------------------------------------
dmg2img "..\OpenCore\Utilities\macrecovery\com.apple.recovery.boot\BaseSystem.dmg" "..\OpenCore\Utilities\macrecovery\com.apple.recovery.boot\BaseSystem.img"
echo .
echo .
timeout 5
cls

:: Convert image (img) file to vmware disk (vmdk)
cd "C:\Program Files\qemu"
echo --------------------------------------
echo Converting image file to VMDK file
echo --------------------------------------
qemu-img convert -f raw -O vmdk "%home%\OpenCore\Utilities\macrecovery\com.apple.recovery.boot\BaseSystem.img" "%home%\%osname%.vmdk"
echo VMDK file Generated
echo .
echo .

:: Cleaning temporary files
echo ----------------
echo cleaing up
echo ----------------
echo Cleaning temporary files
rmdir /s "%home%\OpenCore\Utilities\macrecovery\com.apple.recovery.boot" /Q
del /f "%home%\OpenCore\Utilities\macrecovery\run.bat" /Q
echo .
echo .
cd "%home%"

:: Generate file for extra line to be edited into vmx file
echo -------------------------
echo Creating command file
echo -------------------------
IF %client_sys%==1 GOTO GEN_INTEL
IF %client_sys%==2 GOTO GEN_AMD
:GEN_INTEL
echo smbios.reflectHost = "TRUE" > %osname%-Intel.txt
echo hw.model = "MacBookPro14,3" >> %osname%-Intel.txt
echo board-id = "%macid%" >> %osname%-Intel.txt
echo smc.version = "0" >> %osname%-Intel.txt
echo ulm.disableMitigations = "TRUE" >> %osname%-Intel.txt
GOTO GEN_END
:GEN_AMD
echo smc.version = "0" > "%osname%-AMD.txt"
echo cpuid.0.eax = "0000:0000:0000:0000:0000:0000:0000:1011" >> "%osname%-AMD.txt"
echo cpuid.0.ebx = "0111:0101:0110:1110:0110:0101:0100:0111" >> "%osname%-AMD.txt"
echo cpuid.0.ecx = "0110:1100:0110:0101:0111:0100:0110:1110" >> "%osname%-AMD.txt"
echo cpuid.0.edx = "0100:1001:0110:0101:0110:1110:0110:1001" >> "%osname%-AMD.txt"
echo cpuid.1.eax = "0000:0000:0000:0001:0000:0110:0111:0001" >> "%osname%-AMD.txt"
echo cpuid.1.ebx = "0000:0010:0000:0001:0000:1000:0000:0000" >> "%osname%-AMD.txt"
echo cpuid.1.ecx = "1000:0010:1001:1000:0010:0010:0000:0011" >> "%osname%-AMD.txt"
echo cpuid.1.edx = "0000:0111:1000:1011:1111:1011:1111:1111" >> "%osname%-AMD.txt"
echo smbios.reflectHost = "TRUE" >> "%osname%-AMD.txt"
echo hw.model = "iMac19,1" >> "%osname%-AMD.txt"
echo board-id = "%macid%" >> "%osname%-AMD.txt"
echo vhv.enable = "FALSE" >> "%osname%-AMD.txt"
echo vpmc.enable = "FALSE" >> "%osname%-AMD.txt"
echo vvtd.enable = "FALSE" >> "%osname%-AMD.txt"
GOTO GEN_END
:GEN_END
echo Text file with commands Generated
timeout 5
cls

echo ____________________________________________________________
echo ------------------------------------------------------------
echo       ::::::::: ::::::::::: :::::::::  :::    ::: :::::::::: 
echo      :+:    :+:    :+:     :+:    :+: :+:    :+: :+:         
echo     +:+    +:+    +:+     +:+    +:+ +:+    +:+ +:+          
echo    +#++:++#+     +#+     +#++:++#:  +#++:++#++ :#::+::#      
echo   +#+    +#+    +#+     +#+    +#+ +#+    +#+ +#+            
echo  #+#    #+#    #+#     #+#    #+# #+#    #+# #+#             
echo #########     ###     ###    ### ###    ### ###              
echo ____________________________________________________________
echo ------------------------------------------------------------
echo .
echo Thank You for choosing my Script
echo .
echo .
echo .
pause