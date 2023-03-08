@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\Lab5.c"
if not exist hex2mif.exe goto done
if exist Lab5.ihx hex2mif Lab5.ihx
if exist Lab5.hex hex2mif Lab5.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\kcgro\Documents\GitHub\ELEC291\LAB5-Phasor Analysis\Lab5.hex
