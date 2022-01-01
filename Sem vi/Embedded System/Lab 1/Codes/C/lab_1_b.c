#include<reg51.h>

void delay(int time)
{
	unsigned int i,j;
	for (i=0;i<time;i++)
		for (j=0;j<125;j++);
}

void main()
{
	unsigned char value = 0xb6;
	unsigned char reversevalue;
	unsigned char a,b;
	a=value/0x10;
	b=value%0x10;
	reversevalue = b*(0x10) + a;

	while(1)
	{
		P0 = value;
		delay(1000);
		P0 = reversevalue;
		delay(1000);
	}
}
