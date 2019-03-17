
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,5 :: 		void interrupt(void) {
;MyProject.c,7 :: 		if (Button(&PORTB, 0, 1, 1)) {
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt0
;MyProject.c,8 :: 		isAll = !isAll;
	MOVF       _isAll+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _isAll+0
;MyProject.c,9 :: 		}
L_interrupt0:
;MyProject.c,11 :: 		INTCON.T0IF = 0;
	BCF        INTCON+0, 2
;MyProject.c,12 :: 		}
L_end_interrupt:
L__interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_snake:

;MyProject.c,15 :: 		void snake(void) {
;MyProject.c,16 :: 		PORTB.B1 = ~PORTB.B1;
	MOVLW      2
	XORWF      PORTB+0, 1
;MyProject.c,17 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_snake1:
	DECFSZ     R13+0, 1
	GOTO       L_snake1
	DECFSZ     R12+0, 1
	GOTO       L_snake1
	NOP
;MyProject.c,18 :: 		PORTB.B2 = ~PORTB.B2;
	MOVLW      4
	XORWF      PORTB+0, 1
;MyProject.c,19 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_snake2:
	DECFSZ     R13+0, 1
	GOTO       L_snake2
	DECFSZ     R12+0, 1
	GOTO       L_snake2
	NOP
;MyProject.c,20 :: 		PORTB.B3 = ~PORTB.B3;
	MOVLW      8
	XORWF      PORTB+0, 1
;MyProject.c,21 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_snake3:
	DECFSZ     R13+0, 1
	GOTO       L_snake3
	DECFSZ     R12+0, 1
	GOTO       L_snake3
	NOP
;MyProject.c,22 :: 		PORTB.B4 = ~PORTB.B4;
	MOVLW      16
	XORWF      PORTB+0, 1
;MyProject.c,23 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_snake4:
	DECFSZ     R13+0, 1
	GOTO       L_snake4
	DECFSZ     R12+0, 1
	GOTO       L_snake4
	NOP
;MyProject.c,24 :: 		PORTB.B5 = ~PORTB.B5;
	MOVLW      32
	XORWF      PORTB+0, 1
;MyProject.c,25 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_snake5:
	DECFSZ     R13+0, 1
	GOTO       L_snake5
	DECFSZ     R12+0, 1
	GOTO       L_snake5
	NOP
;MyProject.c,26 :: 		PORTB.B6 = ~PORTB.B6;
	MOVLW      64
	XORWF      PORTB+0, 1
;MyProject.c,27 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_snake6:
	DECFSZ     R13+0, 1
	GOTO       L_snake6
	DECFSZ     R12+0, 1
	GOTO       L_snake6
	NOP
;MyProject.c,28 :: 		PORTB.B7 = ~PORTB.B7;
	MOVLW      128
	XORWF      PORTB+0, 1
;MyProject.c,29 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_snake7:
	DECFSZ     R13+0, 1
	GOTO       L_snake7
	DECFSZ     R12+0, 1
	GOTO       L_snake7
	NOP
;MyProject.c,30 :: 		}
L_end_snake:
	RETURN
; end of _snake

_all:

;MyProject.c,33 :: 		void all(void) {
;MyProject.c,34 :: 		PORTB = ~PORTB;
	COMF       PORTB+0, 1
;MyProject.c,35 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_all8:
	DECFSZ     R13+0, 1
	GOTO       L_all8
	DECFSZ     R12+0, 1
	GOTO       L_all8
	NOP
;MyProject.c,36 :: 		}
L_end_all:
	RETURN
; end of _all

_init_timer0:

;MyProject.c,38 :: 		void init_timer0(void) {
;MyProject.c,40 :: 		OPTION_REG.T0CS = 0;
	BCF        OPTION_REG+0, 5
;MyProject.c,42 :: 		OPTION_REG.T0SE = 0;
	BCF        OPTION_REG+0, 4
;MyProject.c,44 :: 		OPTION_REG.PSA = 0;
	BCF        OPTION_REG+0, 3
;MyProject.c,46 :: 		OPTION_REG.PS0 = 1;
	BSF        OPTION_REG+0, 0
;MyProject.c,47 :: 		OPTION_REG.PS1 = 1;
	BSF        OPTION_REG+0, 1
;MyProject.c,48 :: 		OPTION_REG.PS2 = 1;
	BSF        OPTION_REG+0, 2
;MyProject.c,50 :: 		INTCON.T0IF = 0;
	BCF        INTCON+0, 2
;MyProject.c,52 :: 		INTCON.T0IE = 1;
	BSF        INTCON+0, 5
;MyProject.c,54 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;MyProject.c,56 :: 		TMR0 = 0;
	CLRF       TMR0+0
;MyProject.c,57 :: 		}
L_end_init_timer0:
	RETURN
; end of _init_timer0

_main:

;MyProject.c,59 :: 		void main() {
;MyProject.c,61 :: 		TRISB = 0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,63 :: 		PORTB = 0;
	CLRF       PORTB+0
;MyProject.c,64 :: 		init_timer0();
	CALL       _init_timer0+0
;MyProject.c,65 :: 		for(;;) {
L_main9:
;MyProject.c,66 :: 		if (isAll) {
	MOVF       _isAll+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;MyProject.c,67 :: 		all();
	CALL       _all+0
;MyProject.c,68 :: 		} else {
	GOTO       L_main13
L_main12:
;MyProject.c,69 :: 		snake();
	CALL       _snake+0
;MyProject.c,70 :: 		}
L_main13:
;MyProject.c,71 :: 		}
	GOTO       L_main9
;MyProject.c,72 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
