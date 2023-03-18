#include <avr/io.h>
#include <stdio.h>
#include "usart.h"
#include <util/delay.h>

int main( void )
{
	int j;

	usart_init (); // configure the usart and baudrate

	_delay_ms(500); // Give putty some time to start.
	printf("Hello, World!\n");
	for(j=0; j<10; j++)	printf("j= %d\n", j);

	while(1)
	{
		// do nothing
	}
}
