SHELL=cmd
CC= avr-gcc
CPU=-mmcu=atmega328p
COPT= -g -Os $(CPU)
OBJS= SoftwareUart.o

COMPORT = $(shell type COMPORT.inc)

SoftwareUart.elf: $(OBJS)
	avr-gcc $(CPU) -Wl,-Map,SoftwareUart.map $(OBJS) -o SoftwareUart.elf
	avr-objcopy -j .text -j .data -O ihex SoftwareUart.elf SoftwareUart.hex
	@echo done!

SoftwareUart.o: SoftwareUart.c
	avr-gcc $(COPT) -c SoftwareUart.c

clean:
	@del *.hex *.elf *.o 2> nul

FlashLoad:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	spi_atmega -CRYSTAL -p -v SoftwareUart.hex
	@cmd /c start putty -serial $(COMPORT) -sercfg 9600,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty -serial $(COMPORT) -sercfg 9600,8,n,1,N

dummy: SoftwareUart.hex SoftwareUart.map
	@echo Hello dummy!
	
explorer:
	cmd /c start explorer .
	