#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

#define sBAUD 9600
#define sOUTPORT PORTB
#define sINPORT  PINB
#define sTXD (1<<PB0) // PB0 is used as sTXd, Pin14 of ATmega328p (DIP28)
#define sRXD (1<<PB1) // PB1 is used as sRXD, Pin15 of ATmega328p (DIP28)

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

unsigned char echo=0;

void ConfigureSoftwareUART (void)
{
	DDRB |= sTXD;    // Configure pin sTXD as output
	PORTB |= sTXD;   // Default state of transmit pin is 1
	DDRB &= (~sRXD); // Configure pin sRXD as input
}

void SendByte (unsigned char c)
{
	unsigned char i;
	
	// Send start bit
	sOUTPORT &= (~sTXD);
  	_delay_us(1E6/sBAUD);
  	// Send 8 data bits
	for (i=0; i<8; i++)
  	{
    	if( c & 1 )
    	{
      		sOUTPORT |= sTXD;
      	}
    	else
      	{
      		sOUTPORT &= (~sTXD);
      	}
    	c >>= 1;
		_delay_us(1E6/sBAUD);
 	}
 	// Send the stop bit
	sOUTPORT |= sTXD;
	_delay_us(1E6/sBAUD);
}

unsigned char GetByte (void)
{
	unsigned char c, i;
	
	// Wait for input pin to change to zero (start bit)
	while(sINPORT&sRXD); 
	// Wait one and a half bit-time to sample in the middle of incomming bits
	_delay_us((3*1E6)/(2*sBAUD));
	// Receive 8 data bits
	for (i=0, c=0; i<8; i++)
  	{
  		c>>=1;
  		if(sINPORT&sRXD) c|=0x80;
		_delay_us(1E6/sBAUD);
	}
	if(echo==1) SendByte(c); // If echo activated send back what was received
	if(c==0x05) // Control+E activates echo
	{
		echo=1;
	}
	if(c==0x06) // Control+F de-activates echo
	{
		echo=0;
	}
	return c;
}

void SendString(char * s)
{
	while(*s != 0) SendByte(*s++);
}

void GetString(char * s, int nmax)
{
	unsigned char c;
	int n;
	
	while(1)
	{
		c=GetByte();
		if( (c=='\n') || (c=='\r') || n==(nmax-1) )
		{
			*s=0;
			return;
		}
		else
		{
			*s=c;
			s++;
			n++;
		}
	}
}

int main(void)
{
	char buff[80];
	unsigned char i;
	
	ConfigureSoftwareUART();
	SendString("Hello, World!  Using software (bit-bang) UART\r\n");
	while(1) 
	{
		SendString("\r\nType Something: ");
		GetString(buff, sizeof(buff)-1);
		SendString("\r\nYou typed: ");
		SendString(buff);		
	}
	return 0;
}
