#include <reg51.h>
sbit select_bit = P0 ^ 0;
void delay(int factor)
{
    int i;
    TMOD = 0x00;
    for (i = 0; i < factor; i++)
    {
        TL0 = 0x00;
        TH0 = 0x70;
        TR0 = 1;
        while (!TF0);
        TR0 = 0;
        TF0 = 0;
    }
}
void main(void)
{
    int i;
    while (1)
    {
        select_bit = 1;
        delay(10);
        select_bit = 0;
        delay(10);
        for (i = 0; i < 5; i++)
        {
            select_bit = 1;
            delay(2);
            select_bit = 0;
            delay(2);
        }
    };
}