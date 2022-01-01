#include <reg51.h>
sbit select_bit = P2 ^ 0;
void delay(void)
{
    int i;
    TMOD = 0x03;
    for (i = 0; i < 15; i++)
    {
        TL0 = 0x48;
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
        delay();
        for (i = 0; i < 4; i++)
        {
            select_bit = 0;
            delay();
        }
    };
}