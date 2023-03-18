SHELL=cmd
PORTN=$(shell type COMPORT.inc)

usart.elf: usart.o
	avr-gcc -mmcu=atmega328p usart.o -o usart.elf
	avr-objcopy -j .text -j .data -O ihex usart.elf usart.hex
	@echo done!
		
usart.o: usart.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c usart.c

clean:
	@del *.hex *.elf *.o 2>nul

LoadFlash:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -p -v -crystal usart.hex
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: usart.hex
	@echo Hello dummy!
	
explorer:
	cmd /c start explorer .
