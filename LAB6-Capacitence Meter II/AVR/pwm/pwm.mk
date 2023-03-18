SHELL=cmd
OBJS=pwm.o usart.o
PORTN=$(shell type COMPORT.inc)

pwm.elf: $(OBJS)
	avr-gcc -mmcu=atmega328p $(OBJS) -o pwm.elf
	avr-objcopy -j .text -j .data -O ihex pwm.elf pwm.hex
	@echo done!
	
pwm.o: pwm.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c pwm.c

usart.o: usart.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c usart.c

clean:
	@del *.hex *.elf *.o 2>nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -p -v -crystal pwm.hex
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: pwm.hex
	@echo Hello dummy!

explorer:
	cmd /c start explorer .