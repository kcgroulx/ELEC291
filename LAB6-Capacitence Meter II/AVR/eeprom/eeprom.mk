SHELL=cmd
OBJS=eeprom.o usart.o
PORTN=$(shell type COMPORT.inc)

eeprom.elf: $(OBJS)
	avr-gcc -mmcu=atmega328p $(OBJS) -o eeprom.elf
	avr-objcopy -j .text -j .data -O ihex eeprom.elf eeprom.hex
	@echo done!
	
eeprom.o: eeprom.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c eeprom.c

usart.o: usart.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c usart.c

clean:
	@del *.hex *.elf *.o 2>nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -p -v -crystal -EESAVE=0 eeprom.hex
	@cmd /c start putty.exe -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty.exe -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: eeprom.hex
	@echo Hello dummy!

explorer:
	cmd /c start explorer .