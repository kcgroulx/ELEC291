#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdbool.h>
#include <util/delay.h>
#include "usart.h"

#define ISR_FREQ 100000L // Interrupt service routine tick is 10 us
#define OCR0_RELOAD ((F_CPU/ISR_FREQ)-1)

volatile int ISR_pwm1=150, ISR_pwm2=150, ISR_cnt=0;

// 'Timer 0 output compare A' Interrupt Service Routine
// This ISR happens at a rate of 100kHz.  It is used
// to generate two standard hobby servo 50Hz signal with
// a pulse width of 0.6ms to 2.4ms.
ISR(TIMER0_COMPA_vect)
{
	OCR0A = OCR0A + OCR0_RELOAD;
	ISR_cnt++;
	if(ISR_cnt==ISR_pwm1)
	{
		PORTD &= ~(1<<7); // PD7=0
	}
	if(ISR_cnt==ISR_pwm2)
	{
		PORTB &= ~(1<<0); // PB0=0
	}
	if(ISR_cnt>=2000)
	{
		ISR_cnt=0; // 2000 * 10us=20ms
		PORTD |= (1<<7); // PD7=1
		PORTB |= (1<<0); // PB0=1
	}
}

void timer_init0 (void)
{
    cli();// disable global interupt
    TCCR0A = 0;// set entire TCCR1A register to 0
    TCCR0B = 0;// same for TCCR1B
    TCNT0  = 0;//initialize counter value to 0
    // set compare match register for 100khz increments
    OCR0A = OCR0_RELOAD;// = (16*10^6) / (1*100000) - 1 (must be <255)   
    TCCR0B |= (1 << WGM12); // turn on CTC mode   
    TCCR0B |= (1 << CS10); // Set CS10 bits for 1 prescaler  
    TIMSK0 |= (1 << OCIE0A); // enable timer compare interrupt    
    sei(); // enable global interupt
}

void timer_init1 (void)
{
	// Turn on timer with no prescaler on the clock.  We use it for delays and to measure period.
	TCCR1B |= _BV(CS10); // Check page 110 of ATmega328P datasheet
}

void wait_1ms(void)
{
	unsigned int saved_TCNT1;
	
	saved_TCNT1=TCNT1;
	
	while((TCNT1-saved_TCNT1)<(F_CPU/1000L)); // Wait for 1 ms to pass
}

void waitms(int ms)
{
	while(ms--) wait_1ms();
}

#define PIN_PERIOD (PINB & (1<<1)) // PB1

// GetPeriod() seems to work fine for frequencies between 30Hz and 300kHz.
long int GetPeriod (int n)
{
	int i, overflow;
	unsigned int saved_TCNT1a, saved_TCNT1b;
	
	overflow=0;
	TIFR1=1; // TOV1 can be cleared by writing a logic one to its bit location.  Check ATmega328P datasheet page 113.
	while (PIN_PERIOD!=0) // Wait for square wave to be 0
	{
		if(TIFR1&1)	{ TIFR1=1; overflow++; if(overflow>5) return 0;}
	}
	overflow=0;
	TIFR1=1;
	while (PIN_PERIOD==0) // Wait for square wave to be 1
	{
		if(TIFR1&1)	{ TIFR1=1; overflow++; if(overflow>5) return 0;}
	}
	
	overflow=0;
	TIFR1=1;
	saved_TCNT1a=TCNT1;
	for(i=0; i<n; i++) // Measure the time of 'n' periods
	{
		while (PIN_PERIOD!=0) // Wait for square wave to be 0
		{
			if(TIFR1&1)	{ TIFR1=1; overflow++; if(overflow>1024) return 0;}
		}
		while (PIN_PERIOD==0) // Wait for square wave to be 1
		{
			if(TIFR1&1)	{ TIFR1=1; overflow++; if(overflow>1024) return 0;}
		}
	}
	saved_TCNT1b=TCNT1;
	if(saved_TCNT1b<saved_TCNT1a) overflow--; // Added an extra overflow.  Get rid of it.

	return overflow*0x10000L+(saved_TCNT1b-saved_TCNT1a);
}

void adc_init(void)
{
    ADMUX = (1<<REFS0);
    ADCSRA = (1<<ADEN)|(1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0);
}

uint16_t adc_read(int channel)
{
    channel &= 0x7;
    ADMUX = (ADMUX & 0xf8)|channel;
     
    ADCSRA |= (1<<ADSC);
     
    while(ADCSRA & (1<<ADSC)); //as long as ADSC pin is 1 just wait.
     
    return (ADCW);
}

void PrintNumber(long int N, int Base, int digits)
{ 
	char HexDigit[]="0123456789ABCDEF";
	int j;
	#define NBITS 32
	char buff[NBITS+1];
	buff[NBITS]=0;

	j=NBITS-1;
	while ( (N>0) | (digits>0) )
	{
		buff[j--]=HexDigit[N%Base];
		N/=Base;
		if(digits!=0) digits--;
	}
	usart_pstr(&buff[j+1]);
}

void ConfigurePins (void)
{
	DDRB  &= 0b11111101; // Configure PB1 as input
	PORTB |= 0b00000010; // Activate pull-up in PB1
	
	DDRD  |= 0b11111100; // PD[7..2] configured as outputs
	PORTD &= 0b00000011; // PD[7..2] = 0
	
	DDRB  |= 0b00000001; // PB0 configured as output
	PORTB &= 0x11111110; // PB0 = 0
}

// In order to keep this as nimble as possible, avoid
// using floating point or printf() on any of its forms!
int main (void)
{
	unsigned int adc;
	unsigned long int v;
	long int count, f;
	unsigned char LED_toggle=0;
	
	usart_init(); // configure the usart and baudrate
	adc_init();
	ConfigurePins();
	timer_init0();
	timer_init1();

	waitms(500); // Wait for putty to start

	usart_pstr("\x1b[2J\x1b[1;1H"); // Clear screen using ANSI escape sequence.
	usart_pstr("\r\nATMega328P multi I/O example.\r\n");
	usart_pstr("Measures the voltage at channels 0 and 1 (pins 23 and 24 of DIP28 package)\r\n");
	usart_pstr("Measures period on PB1 (pin 15 of DIP28 package)\r\n");
	usart_pstr("Toggles PD2, PD3, PD4, PD5, PD6 (pins 4, 5, 6, 11, 12 of DIP28 package)\r\n");
	usart_pstr("Generates Servo PWMs in PD7, PB0 (13, 14 of DIP28 package)\r\n\r\n");

	while(1)
	{
		adc=adc_read(0);
		v=(adc*5000L)/1023L;
		usart_pstr("ADC[0]=0x");
		PrintNumber(adc, 16, 3);
		usart_pstr(", ");
		PrintNumber(v/1000, 10, 1);
		usart_pstr(".");
		PrintNumber(v%1000, 10, 3);
		usart_pstr("V ");
		
		adc=adc_read(1);
		v=(adc*5000L)/1023L;
		usart_pstr("ADC[1]=0x");
		PrintNumber(adc, 16, 3);
		usart_pstr(", ");
		PrintNumber(v/1000, 10, 1);
		usart_pstr(".");
		PrintNumber(v%1000, 10, 3);
		usart_pstr("V ");
		
		count=GetPeriod(100);
		if(count>0)
		{
			f=(F_CPU*100L)/count;
			usart_pstr("f=");
			PrintNumber(f, 10, 7);
			usart_pstr("Hz, count=");
			PrintNumber(count, 10, 6);
			usart_pstr("          \r");
		}
		else
		{
			usart_pstr("NO SIGNAL                     \r");
		}

		// Now toggle the pins on/off to see if they are working.
		// First turn all off:
		PORTD &= ~(1<<2); // PD2=0
		PORTD &= ~(1<<3); // PD3=0
		PORTD &= ~(1<<4); // PD4=0
		PORTD &= ~(1<<5); // PD5=0
		PORTD &= ~(1<<6); // PD6=0
		// Now turn on one of the outputs per loop cycle to check
		switch (LED_toggle++)
		{
			case 0:
				PORTD |= (1<<2); // PD2=1
				break;
			case 1:
				PORTD |= (1<<3); // PD3=1
				break;
			case 2:
				PORTD |= (1<<4); // PD4=1
				break;
			case 3:
				PORTD |= (1<<5); // PD5=1
				break;
			case 4:
				PORTD |= (1<<6); // PD6=1
				break;
			default:
				break;
		}
		if(LED_toggle>4) LED_toggle=0;
		
		// Change the servo PWM signals
		if (ISR_pwm1<200)
		{
			ISR_pwm1++;
		}
		else
		{
			ISR_pwm1=100;	
		}

		if (ISR_pwm2>100)
		{
			ISR_pwm2--;
		}
		else
		{
			ISR_pwm2=200;	
		}
		
		_delay_ms(200);
	}
}
