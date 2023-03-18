SHELL=cmd
TimerIRQ.elf: TimerIRQ.o
	avr-gcc -mmcu=atmega328 -Wl,-Map,TimerIRQ.map TimerIRQ.o -o TimerIRQ.elf
	avr-objcopy -j .text -j .data -O ihex TimerIRQ.elf TimerIRQ.hex
	@echo done!
	
TimerIRQ.o: TimerIRQ.c
	avr-gcc -g -Os -mmcu=atmega328 -c TimerIRQ.c

clean:
	@del *.hex *.elf *.o 2>nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -CRYSTAL -p -v TimerIRQ.hex

dummy: TimerIRQ.hex TimerIRQ.map
	@echo Hello from dummy!
	