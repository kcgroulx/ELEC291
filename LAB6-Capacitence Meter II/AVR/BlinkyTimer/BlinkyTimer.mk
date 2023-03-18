SHELL=cmd
BlinkyTimer.elf: BlinkyTimer.o
	avr-gcc -mmcu=atmega328 -Wl,-Map,BlinkyTimer.map BlinkyTimer.o -o BlinkyTimer.elf
	avr-objcopy -j .text -j .data -O ihex BlinkyTimer.elf BlinkyTimer.hex
	@echo done!
	
BlinkyTimer.o: BlinkyTimer.c
	avr-gcc -g -Os -mmcu=atmega328 -c BlinkyTimer.c

clean:
	@del *.hex *.elf *.o 2>nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -CRYSTAL -p -v BlinkyTimer.hex

dummy: BlinkyTimer.hex BlinkyTimer.map
	@echo Hello from dummy!
	