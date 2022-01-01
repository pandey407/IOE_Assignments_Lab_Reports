#include <reg51.h>
sbit select_bit = P2 ^ 0;
void delay(void)
{
    int i;
    TMOD = 0x20;
    for (i = 0; i < 15; i++)
    {
        TH1 = 0x48;
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
        delay();
        for (i = 0; i < 4; i++)
        {
            select_bit = 0;
            delay();
        }
    };
}