@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\kcgro\Documents\GitHub\ELEC291\LAB4\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\kcgro\Documents\GitHub\ELEC291\LAB4\LAB4.c"
if not exist hex2mif.exe goto done
if exist LAB4.ihx hex2mif LAB4.ihx
if exist LAB4.hex hex2mif LAB4.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\kcgro\Documents\GitHub\ELEC291\LAB4\LAB4.hex
