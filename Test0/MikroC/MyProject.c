#include <stdbool.h>

volatile bool isAll = true;

void interrupt(void) {
  // check if button on port b0 is pressed with 1 ms debounce time
  if (Button(&PORTB, 0, 1, 1)) {
     isAll = !isAll;
  }
  // clear timer 0 overflow bit
  INTCON.T0IF = 0;
}

// invert ports one by one with delay
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

// invert all ports with delay
void all(void) {
  PORTB = ~PORTB;
  Delay_ms(100);
}

void init_timer0(void) {
  // use internal instruction cycle clock
  OPTION_REG.T0CS = 0;
  // increment TMR0
  OPTION_REG.T0SE = 0;
  // use prescaler
  OPTION_REG.PSA = 0;
  // set 2 as a prescaler value
  OPTION_REG.PS0 = 1;
  OPTION_REG.PS1 = 1;
  OPTION_REG.PS2 = 1;
  // clear timer overflow bit
  INTCON.T0IF = 0;
  // enable timer 0 interrupts
  INTCON.T0IE = 1;
  // enable global interrupts
  INTCON.GIE = 1;
  // set initial value for the timer 0 counter
  TMR0 = 0;
}

void main() {
  // set port b0 as input, other as output
  TRISB = 0b00000001;
  // clear port b0-b7
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