SHELL=cmd
OBJS=avr_printf.o usart.o
PORTN=$(shell type COMPORT.inc)

avr_printf.elf: $(OBJS)
	avr-gcc -mmcu=atmega328p $(OBJS) -o avr_printf.elf
	avr-objcopy -j .text -j .data -O ihex avr_printf.elf avr_printf.hex
	@echo done!
	
avr_printf.o: avr_printf.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c avr_printf.c

usart.o: usart.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c usart.c

clean:
	@del *.hex *.elf *.o 2>nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -p -v -crystal avr_printf.hex
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: avr_printf.hex
	@echo Hello dummy!

explorer:
	cmd /c start explorer .