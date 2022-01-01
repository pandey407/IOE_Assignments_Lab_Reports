#include <reg51.h>
sbit select_bit = P0 ^ 0;
void delay(char TH, char TL)
{
    TH1 = TH;
    TL1 = TL;
    TMOD = 0x10;
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
        delay(0x4B, 0xFE);
        select_bit = 0;
        delay(0x4B, 0xFE);
        for (i = 0; i < 5; i++)
        {
            select_bit = 1;
            delay(0xDC, 0x00);
            select_bit = 0;
            delay(0xDC, 0x00);
        }
    };
}