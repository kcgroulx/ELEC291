SHELL=cmd
OBJS=main.o usart.o lcd.o
PORTN=$(shell type COMPORT.inc)

avr_printf.elf: $(OBJS)
	avr-gcc -mmcu=atmega328p $(OBJS) -o main.elf
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex
	@echo done!
	
main.o: main.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c main.c

usart.o: usart.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c usart.c

lcd.o: lcd.c usart.h LCD.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c lcd.c

clean:
	@del *.hex *.elf *.o 2>nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -p -v -crystal main.hex
	@cmd /c start putty.exe -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty.exe -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: avr_printf.hex
	@echo Hello dummy!

Picture:
	@cmd /c start Pictures\ATmega328p_LCD.jpg

explorer:
	cmd /c start explorer .