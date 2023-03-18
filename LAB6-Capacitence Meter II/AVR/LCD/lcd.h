#define F_CPU 16000000L

#define LCD_RS_0 (PORTD &= ~(1<<3))
#define LCD_RS_1 (PORTD |=  (1<<3))
#define LCD_E_0  (PORTD &= ~(1<<4))
#define LCD_E_1  (PORTD |=  (1<<4))
#define LCD_D4_0 (PORTD &= ~(1<<5))
#define LCD_D4_1 (PORTD |=  (1<<5))
#define LCD_D5_0 (PORTD &= ~(1<<6))
#define LCD_D5_1 (PORTD |=  (1<<6))
#define LCD_D6_0 (PORTD &= ~(1<<7))
#define LCD_D6_1 (PORTD |=  (1<<7))
#define LCD_D7_0 (PORTB &= ~(1<<0))
#define LCD_D7_1 (PORTB |=  (1<<0))
#define CHARS_PER_LINE 16

void LCD_pulse (void);
void LCD_byte (unsigned char x);
void WriteData (unsigned char x);
void WriteCommand (unsigned char x);
void LCD_4BIT (void);
void LCDprint(char * string, unsigned char line, unsigned char clear);
