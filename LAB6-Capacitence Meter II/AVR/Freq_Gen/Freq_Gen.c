#define F_CPU 16000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdlib.h>
#include <util/delay.h>
#include "usart.h"

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

#define DEF_FREQ 15000L
#define OCR1_RELOAD ((F_CPU/(2*DEF_FREQ))+1)

volatile unsigned int reload;

// 'Timer 1 output compare A' Interrupt Service Routine
ISR(TIMER1_COMPA_vect)
{
	OCR1A = OCR1A + reload;
	PORTB ^= 0b00000011; // Toggle PB0 and PB1
}

void main (void)
{
	char buff[32];
	unsigned long newF;
	
	reload=OCR1_RELOAD; // Reload value for default output frequency 

	DDRB=0b00000011; // PB1 (pin 15) and PB0 (pin 14) are our outputs
	PORTB |= 0x01; // PB0=NOT(PB1)
	TCCR1B |= _BV(CS10);   // set prescaler to Clock/1
	TIMSK1 |= _BV(OCIE1A); // output compare match interrupt for register A
	
	sei(); // enable global interupt

	usart_init(); // configure the usart and baudrate
	
	_delay_ms(500); // Give putty a chance to start before we send information...
	printf("Square wave generator using the ATmega328p.  Outputs are PB0 and PB1 (pins 14  and 15)\r\n");
	printf("By Jesus Calvino-Fraga (c) 2018-2023\r\n");
	
	while(1)
    {
    	printf("Frequency: ");
    	usart_gets(buff, sizeof(buff)-1);
    	newF=atol(buff);

	    if(newF>111000L)
	    {
	       printf("\r\nWarning: The maximum frequency that can be generated is around 111000Hz.\r\n");
	       newF=111000L;
	    }
	    if(newF>0)
	    {
			reload=(F_CPU/(2L*newF))+1;  
		    printf("\r\nFrequency set to: %ld\r\n", F_CPU/((reload-1)*2L));
        }
    }
}