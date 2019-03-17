#line 1 "E:/Proteus/Projects/Test0/MikroC/MyProject.c"
#line 1 "e:/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 3 "E:/Proteus/Projects/Test0/MikroC/MyProject.c"
volatile  _Bool  isAll =  1 ;

void interrupt(void) {

 if (Button(&PORTB, 0, 1, 1)) {
 isAll = !isAll;
 }

 INTCON.T0IF = 0;
}


void snake(void) {
 PORTB.B1 = ~PORTB.B1;
 Delay_ms(100);
 PORTB.B2 = ~PORTB.B2;
 Delay_ms(100);
 PORTB.B3 = ~PORTB.B3;
 Delay_ms(100);
 PORTB.B4 = ~PORTB.B4;
 Delay_ms(100);
 PORTB.B5 = ~PORTB.B5;
 Delay_ms(100);
 PORTB.B6 = ~PORTB.B6;
 Delay_ms(100);
 PORTB.B7 = ~PORTB.B7;
 Delay_ms(100);
}


void all(void) {
 PORTB = ~PORTB;
 Delay_ms(100);
}

void init_timer0(void) {

 OPTION_REG.T0CS = 0;

 OPTION_REG.T0SE = 0;

 OPTION_REG.PSA = 0;

 OPTION_REG.PS0 = 1;
 OPTION_REG.PS1 = 1;
 OPTION_REG.PS2 = 1;

 INTCON.T0IF = 0;

 INTCON.T0IE = 1;

 INTCON.GIE = 1;

 TMR0 = 0;
}

void main() {

 TRISB = 0b00000001;

 PORTB = 0;
 init_timer0();
 for(;;) {
 if (isAll) {
 all();
 } else {
 snake();
 }
 }
}
