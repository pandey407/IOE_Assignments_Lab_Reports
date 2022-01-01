#include <reg51.h>
sbit select_bit = P0 ^ 0;
void delay(int factor)
{
    int i;
    for (i = 0; i < factor; i++)
    {
        TMOD = 0x03;
        TH0 = 0x1A;
        TR1 = 1;
        while (!TF1);
        TR1 = 0;
        TF1 = 0;
    }
}
void main(void)
{
    int i;
    while (1)
    {
        select_bit = 1;
        delay(192);
        select_bit = 0;
        delay(192);
        for (i = 0; i < 5; i++)
        {
            select_bit = 1;
            delay(38);
            select_bit = 0;
            delay(38);
        }
    };
}