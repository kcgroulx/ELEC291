SHELL=cmd
PORTN=$(shell type COMPORT.inc)
OBJS=Period.o usart.o
CPU=-mmcu=atmega328p

Period.elf: $(OBJS)
	avr-gcc $(CPU) $(OBJS) -Wl,-Map,Period.map -Wl,-u,vfprintf -lprintf_flt -lm -o Period.elf
	avr-objcopy -j .text -j .data -O ihex Period.elf Period.hex
	@echo done!
	
Period.o: Period.c
	avr-gcc -g -Os -mmcu=atmega328 -c Period.c

usart.o: usart.c usart.h
	avr-gcc -g -Os -Wall -mmcu=atmega328p -c usart.c
	
clean:
	@del *.hex *.elf *.o 2>nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -CRYSTAL -p -v Period.hex
	cmd /c start putty.exe -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	cmd /c start putty.exe -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: Period.hex Period.map
	@echo Hello from dummy!
	