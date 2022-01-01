#include <reg51.h>

unsigned char led_pattern[4] = {0x79, 0x66, 0x06, 0x06};


void delay(int time)
{
	unsigned int i,j;
	for (i=0; i<time; i++)
		for (j=0; j<125; j++);
}

void display()
{
		P2 = 0x1;
		P0 = led_pattern[0];
		delay(10);//selected to avoid flickering and show as static
		
		P2 = 0x2;
		P0 = led_pattern[1];
		delay(10);
	
		P2 = 0x4;
		P0 = led_pattern[2];
		delay(10);
		
		P2 = 0x8;
		P0 = led_pattern[3];
		delay(10);
		}

void main(void)
{
	while(1)
			display();
}
