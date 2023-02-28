@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Janit\OneDrive\Documents\GitHub\ELEC291\LAB4\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Janit\OneDrive\Documents\GitHub\ELEC291\LAB4\Frequency_Test.c"
if not exist hex2mif.exe goto done
if exist Frequency_Test.ihx hex2mif Frequency_Test.ihx
if exist Frequency_Test.hex hex2mif Frequency_Test.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Janit\OneDrive\Documents\GitHub\ELEC291\LAB4\Frequency_Test.hex
