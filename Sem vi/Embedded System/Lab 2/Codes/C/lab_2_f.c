#include <reg51.h>

unsigned char scroll_pattern[7] = { 0x79, 0x66, 0x06, 0x86, 	
								   0x79, 0x66, 0x06};

void delay(int time)
{
	unsigned int i,j;
	for (i=0; i<time; i++)
		for (j=0; j<125; j++);
}
	
void display(unsigned int i)
{
	unsigned int j;
	for(j=0; j<80; j++) 
	{
		P2 = 0x1;
		P0 = scroll_pattern[i-4];
		delay(10);//selected to avoid flickering
		
		P2 = 0x2;
		P0 = scroll_pattern[i-3];
		delay(10);
	
		P2 = 0x4;
		P0 = scroll_pattern[i-2];
		delay(10);
		
		P2 = 0x8;
		P0 = scroll_pattern[i-1];
		delay(10);
	}
}

void main(void)
{
	unsigned int i;
	while(1)
		for(i=4; i<8; i++)
			display(i);//scrolling happens here
}