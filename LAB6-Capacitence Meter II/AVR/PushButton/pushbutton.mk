SHELL=cmd
OBJS=pushbutton.o usart.o
PORTN=$(shell type COMPORT.inc)

pushbutton.elf: $(OBJS)
	avr-gcc -mmcu=atmega328p $(OBJS) -o pushbutton.elf
	avr-objcopy -j .text -j .data -O ihex pushbutton.elf pushbutton.hex
	@echo done!
	
pushbutton.o: pushbutton.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c pushbutton.c

usart.o: usart.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c usart.c

clean:
	@del *.hex *.elf *.o 2>nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -p -v -crystal pushbutton.hex
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: pushbutton.hex
	@echo Hello dummy!

explorer:
	cmd /c start explorer .