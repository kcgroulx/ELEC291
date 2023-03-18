#define F_CPU 16000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdlib.h>
#include "usart.h"

#define ISR_FREQ 100000L // Interrupt service routine tick is 10 us
#define OCR1_RELOAD ((F_CPU/ISR_FREQ)-1)

volatile int ISR_pw=100, ISR_cnt=0, ISR_frc;

// 'Timer 1 output compare A' Interrupt Service Routine
// This ISR happens at a rate of 100kHz.  It is used
// to generate the standard hobby servo 50Hz signal with
// a pulse width of 0.6ms to 2.4ms.
ISR(TIMER1_COMPA_vect)
{
	//OCR1A = OCR1A + OCR1_RELOAD;
	ISR_cnt++;
	if(ISR_cnt<ISR_pw)
	{
		PORTB |= 0b00000001; // PB0=1
	}
	else
	{
		PORTB &= ~0b00000001; // PB0=0
	}
	if(ISR_cnt>=2000)
	{
		ISR_cnt=0; // 2000 * 10us=20ms
		ISR_frc++;
	}
}

// Atomic read of TCNT1. This comes from page 93 of the ATmega328P datasheet.
unsigned int TIM16_ReadTCNT1( void )
{
	unsigned char sreg;
	unsigned int i;
	/* Save global interrupt flag */
	sreg = SREG;
	/* Disable interrupts */
	cli();
	/* Read TCNT1 into i */
	i = TCNT1;
	/* Restore global interrupt flag */
	SREG = sreg;
	return i;
}

void delay_ms (int msecs)
{	
	int ticks;
	ISR_frc=0;
	ticks=msecs/20;
	while(ISR_frc<ticks);
}

void init_timer (void)
{
    cli();// disable global interupt
    TCCR1A = 0;// set entire TCCR1A register to 0
    TCCR1B = 0;// same for TCCR1B
    TCNT1  = 0;//initialize counter value to 0
    // set compare match register for 100khz increments
    OCR1A = OCR1_RELOAD;// = (16*10^6) / (1*100000) - 1 (must be <65536)   
    TCCR1B |= (1 << WGM12); // turn on CTC mode   
    TCCR1B |= (1 << CS10); // Set CS10 bits for 1 prescaler  
    TIMSK1 |= (1 << OCIE1A); // enable timer compare interrupt    
    sei(); // enable global interupt
}

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

void main (void)
{
	char buf[32];
	int pw;
	
	DDRB=0b00000001; // PB0 (pin 14) configured as output
	init_timer();

	usart_init(); // configure the usart and baudrate
	
	// Give putty a chance to start
	delay_ms(500); // wait 500 ms
	
	printf("\x1b[2J\x1b[1;1H"); // Clear screen using ANSI escape sequence.
    printf("Servo signal generator for the ATmega328p. Check PB0 (pin 14).\r\n");
    printf("By Jesus Calvino-Fraga (c) 2018-2023.\r\n");
    printf("Pulse width between 60 (for 0.6ms) and 240 (for 2.4ms)\r\n");
	
	while(1)
    {
    	printf("New pulse width: ");
    	usart_gets(buf, sizeof(buf)-1); // wait here until data is received
 
    	printf("\n");
	    pw=atoi(buf);
	    if( (pw>=60) && (pw<=240) )
	    {
	    	ISR_pw=pw;
        }
        else
        {
        	printf("%d is out of the valid range\r\n", pw);
        }
    }
}