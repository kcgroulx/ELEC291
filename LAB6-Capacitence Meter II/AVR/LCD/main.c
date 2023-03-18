#include <avr/io.h>
#include <stdio.h>
#include <stdlib.h>
#include "usart.h"
#include "lcd.h"
#include <util/delay.h>

/* Pinout for DIP28 ATMega328P:

                           -------
     (PCINT14/RESET) PC6 -|1    28|- PC5 (ADC5/SCL/PCINT13)
       (PCINT16/RXD) PD0 -|2    27|- PC4 (ADC4/SDA/PCINT12)
       (PCINT17/TXD) PD1 -|3    26|- PC3 (ADC3/PCINT11)
      (PCINT18/INT0) PD2 -|4    25|- PC2 (ADC2/PCINT10)
 (PCINT19/OC2B/INT1) PD3 -|5    24|- PC1 (ADC1/PCINT9)
    (PCINT20/XCK/T0) PD4 -|6    23|- PC0 (ADC0/PCINT8)
                     VCC -|7    22|- GND
                     GND -|8    21|- AREF
(PCINT6/XTAL1/TOSC1) PB6 -|9    20|- AVCC
(PCINT7/XTAL2/TOSC2) PB7 -|10   19|- PB5 (SCK/PCINT5)
   (PCINT21/OC0B/T1) PD5 -|11   18|- PB4 (MISO/PCINT4)
 (PCINT22/OC0A/AIN0) PD6 -|12   17|- PB3 (MOSI/OC2A/PCINT3)
      (PCINT23/AIN1) PD7 -|13   16|- PB2 (SS/OC1B/PCINT2)
  (PCINT0/CLKO/ICP1) PB0 -|14   15|- PB1 (OC1A/PCINT1)
                           -------
*/

// These are the connections between the LCD and the ATMega328P:
//
// LCD          ATMega328P
//----------------------------
// D7           PB0
// D6           PD7
// D5           PD6
// D4           PD5
// LCD_E        PD4
// LCD_W        GND
// LCD_RS       PD3
// V0           2k+GND
// VCC          5V
// GND          GND
//
// There is also a picture that shows how the LCD is attached to the ATMega328P.

void Configure_Pins(void)
{
	DDRB|=0b00000001; // PB0 is output.
	DDRD|=0b11111000; // PD3, PD4, PD5, PD6, and PD7 are outputs.
}

int main( void )
{
	char buff[17];

	usart_init(); // configure the usart and baudrate
	Configure_Pins();
	LCD_4BIT();
	
	_delay_ms(500); // Give putty some time to start.
	printf("ATMega328P 4-bit LCD test.\n");

   	// Display something in the LCD
	LCDprint("LCD 4-bit test:", 1, 1);
	LCDprint("Hello, World!", 2, 1);
	while(1)
	{
		printf("Type what you want to display in line 2 (16 char max): ");
		usart_gets(buff, sizeof(buff)-1);
		printf("\r\n");
		LCDprint(buff, 2, 1);
	}
}
