#include <reg51.h>
sbit select_bit = P2 ^ 0;
void delay(void)
{
    TMOD = 0x00;
    TL1 = 0x14;
    TH1 = 0xA9;
    TR1 = 1;
    while (!TF1);
    TR1 = 0;
    TF1 = 0;
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
