
MyProject_rotate:

;MyProject.c,12 :: 		static inline void rotate(int step, char s[], int left_right){ // left_right = 1 - lijevo, left_right = -1 - desno
;MyProject.c,13 :: 		i = 4*s[2] + 2*s[1] + s[0];
	ADD	W11, #2, W4
	MOV.B	[W4], W0
	ZE	W0, W0
	SL	W0, #2, W1
	ADD	W11, #1, W3
	MOV.B	[W3], W0
	ZE	W0, W0
	SL	W0, #1, W0
	ADD	W1, W0, W2
	ZE	[W11], W1
	MOV	#lo_addr(_i), W0
	ADD	W2, W1, [W0]
;MyProject.c,14 :: 		LATB.F6 = s[2];
	MOV.B	[W4], W0
	BTSS	W0, #0
	BCLR.B	LATB, #6
	BTSC	W0, #0
	BSET.B	LATB, #6
;MyProject.c,15 :: 		LATB.F7 = s[1];
	MOV.B	[W3], W0
	BTSS	W0, #0
	BCLR.B	LATB, #7
	BTSC	W0, #0
	BSET.B	LATB, #7
;MyProject.c,16 :: 		LATB.F8 = s[0];
	MOV.B	[W11], W0
	BTSS	W0, #0
	BCLR	LATB, #8
	BTSC	W0, #0
	BSET	LATB, #8
;MyProject.c,17 :: 		while(step > 0){
L_MyProject_rotate0:
	CP	W10, #0
	BRA GT	L_MyProject_rotate107
	GOTO	L_MyProject_rotate1
L_MyProject_rotate107:
;MyProject.c,18 :: 		LATB.F13 = lookup[indexes[i]][0];
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W2
	MOV.B	[W2], W0
	SE	W0, W0
	SL	W0, #3, W1
	MOV	#lo_addr(_lookup), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #13
	BTSC	W0, #0
	BSET	LATB, #13
;MyProject.c,19 :: 		LATB.F12 = lookup[indexes[i]][1];
	MOV.B	[W2], W0
	SE	W0, W0
	SL	W0, #3, W1
	MOV	#lo_addr(_lookup), W0
	ADD	W0, W1, W0
	ADD	W0, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,20 :: 		LATB.F11 = lookup[indexes[i]][2];
	MOV.B	[W2], W0
	SE	W0, W0
	SL	W0, #3, W1
	MOV	#lo_addr(_lookup), W0
	ADD	W0, W1, W0
	ADD	W0, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,21 :: 		LATB.F10 = lookup[indexes[i]][3];
	MOV.B	[W2], W0
	SE	W0, W0
	SL	W0, #3, W1
	MOV	#lo_addr(_lookup), W0
	ADD	W0, W1, W0
	ADD	W0, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,22 :: 		step--;
	SUB	W10, #1, W0
	MOV	W0, W10
;MyProject.c,23 :: 		indexes[i] += left_right;
	SE	[W2], W0
	ADD	W0, W12, W0
	MOV.B	W0, [W2]
;MyProject.c,24 :: 		if (indexes[i] >= 8 && left_right == 1)
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA GE	L_MyProject_rotate108
	GOTO	L_MyProject_rotate79
L_MyProject_rotate108:
	CP	W12, #1
	BRA Z	L_MyProject_rotate109
	GOTO	L_MyProject_rotate78
L_MyProject_rotate109:
L_MyProject_rotate77:
;MyProject.c,25 :: 		indexes[i] = 0;
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,24 :: 		if (indexes[i] >= 8 && left_right == 1)
L_MyProject_rotate79:
L_MyProject_rotate78:
;MyProject.c,26 :: 		if (indexes[i] < 0  && left_right == -1)
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L_MyProject_rotate110
	GOTO	L_MyProject_rotate81
L_MyProject_rotate110:
	MOV	#65535, W0
	CP	W12, W0
	BRA Z	L_MyProject_rotate111
	GOTO	L_MyProject_rotate80
L_MyProject_rotate111:
L_MyProject_rotate76:
;MyProject.c,27 :: 		indexes[i] = 7;
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
;MyProject.c,26 :: 		if (indexes[i] < 0  && left_right == -1)
L_MyProject_rotate81:
L_MyProject_rotate80:
;MyProject.c,28 :: 		Delay_us(pauza);
	MOV	#1466, W7
L_MyProject_rotate8:
	DEC	W7
	BRA NZ	L_MyProject_rotate8
	NOP
	NOP
;MyProject.c,29 :: 		}
	GOTO	L_MyProject_rotate0
L_MyProject_rotate1:
;MyProject.c,30 :: 		LATB.F13 = 0;
	BCLR	LATB, #13
;MyProject.c,31 :: 		LATB.F12 = 0;
	BCLR	LATB, #12
;MyProject.c,32 :: 		LATB.F11 = 0;
	BCLR	LATB, #11
;MyProject.c,33 :: 		LATB.F10 = 0;
	BCLR	LATB, #10
;MyProject.c,34 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,35 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,36 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,37 :: 		}
L_end_rotate:
	RETURN
; end of MyProject_rotate

_uart_interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;MyProject.c,39 :: 		void uart_interrupt() iv IVT_ADDR_U1RXINTERRUPT ics ICS_AUTO {
;MyProject.c,40 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,41 :: 		uart_ch = UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_ch), W1
	MOV.B	W0, [W1]
;MyProject.c,42 :: 		if(uart_ch == 'q'){
	MOV.B	#113, W1
	CP.B	W0, W1
	BRA Z	L__uart_interrupt113
	GOTO	L_uart_interrupt10
L__uart_interrupt113:
;MyProject.c,43 :: 		m = 0;
	CLR	W0
	MOV	W0, _m
;MyProject.c,44 :: 		flag = 1;
	MOV	#1, W0
	MOV	W0, _flag
;MyProject.c,45 :: 		}
	GOTO	L_uart_interrupt11
L_uart_interrupt10:
;MyProject.c,47 :: 		out[m] = uart_ch;
	MOV	#lo_addr(_out), W1
	MOV	#lo_addr(_m), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_uart_ch), W0
	MOV.B	[W0], [W1]
;MyProject.c,48 :: 		m++;
	MOV	#1, W1
	MOV	#lo_addr(_m), W0
	ADD	W1, [W0], [W0]
;MyProject.c,49 :: 		}
L_uart_interrupt11:
;MyProject.c,50 :: 		}
L_end_uart_interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _uart_interrupt

_calibration:

;MyProject.c,52 :: 		void calibration(){
;MyProject.c,53 :: 		LATB.F6 = 1;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BSET.B	LATB, #6
;MyProject.c,54 :: 		LATB.F7 = 0;
	BCLR.B	LATB, #7
;MyProject.c,55 :: 		LATB.F8 = 0;
	BCLR	LATB, #8
;MyProject.c,56 :: 		while(1){
L_calibration12:
;MyProject.c,57 :: 		if(PORTB.F5 == 1)
	BTSS	PORTB, #5
	GOTO	L_calibration14
;MyProject.c,58 :: 		break;
	GOTO	L_calibration13
L_calibration14:
;MyProject.c,59 :: 		LATB.F13 = lookup[indexes[4]][0];
	MOV	#lo_addr(_indexes+4), W0
	SE	[W0], W0
	SL	W0, #3, W1
	MOV	#lo_addr(_lookup), W0
	ADD	W0, W1, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W2], W0
	BTSS	W0, #0
	BCLR	LATB, #13
	BTSC	W0, #0
	BSET	LATB, #13
;MyProject.c,60 :: 		LATB.F12 = lookup[indexes[4]][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,61 :: 		LATB.F11 = lookup[indexes[4]][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,62 :: 		LATB.F10 = lookup[indexes[4]][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,63 :: 		Delay_us(pauza);
	MOV	#1466, W7
L_calibration15:
	DEC	W7
	BRA NZ	L_calibration15
	NOP
	NOP
;MyProject.c,64 :: 		indexes[4]--;
	MOV.B	#1, W1
	MOV	#lo_addr(_indexes+4), W0
	SUBR.B	W1, [W0], [W0]
;MyProject.c,65 :: 		if (indexes[4] < 0)
	MOV	#lo_addr(_indexes+4), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__calibration115
	GOTO	L_calibration17
L__calibration115:
;MyProject.c,66 :: 		indexes[4] = 7;
	MOV	#lo_addr(_indexes+4), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
L_calibration17:
;MyProject.c,67 :: 		}
	GOTO	L_calibration12
L_calibration13:
;MyProject.c,68 :: 		LATB.F13 = 0;
	BCLR	LATB, #13
;MyProject.c,69 :: 		LATB.F12 = 0;
	BCLR	LATB, #12
;MyProject.c,70 :: 		LATB.F11 = 0;
	BCLR	LATB, #11
;MyProject.c,71 :: 		LATB.F10 = 0;
	BCLR	LATB, #10
;MyProject.c,72 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,73 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,74 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,75 :: 		rotate(910, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#910, W10
	CALL	MyProject_rotate
;MyProject.c,76 :: 		LATB.F6 = 0;
	BCLR.B	LATB, #6
;MyProject.c,77 :: 		LATB.F7 = 0;
	BCLR.B	LATB, #7
;MyProject.c,78 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,79 :: 		while(1){
L_calibration18:
;MyProject.c,80 :: 		if(PORTB.F15 == 1)
	BTSS	PORTB, #15
	GOTO	L_calibration20
;MyProject.c,81 :: 		break;
	GOTO	L_calibration19
L_calibration20:
;MyProject.c,82 :: 		LATB.F13 = lookup[indexes[1]][0];
	MOV	#lo_addr(_indexes+1), W0
	SE	[W0], W0
	SL	W0, #3, W1
	MOV	#lo_addr(_lookup), W0
	ADD	W0, W1, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W2], W0
	BTSS	W0, #0
	BCLR	LATB, #13
	BTSC	W0, #0
	BSET	LATB, #13
;MyProject.c,83 :: 		LATB.F12 = lookup[indexes[1]][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,84 :: 		LATB.F11 = lookup[indexes[1]][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,85 :: 		LATB.F10 = lookup[indexes[1]][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,86 :: 		Delay_us(pauza);
	MOV	#1466, W7
L_calibration21:
	DEC	W7
	BRA NZ	L_calibration21
	NOP
	NOP
;MyProject.c,87 :: 		indexes[1]--;
	MOV.B	#1, W1
	MOV	#lo_addr(_indexes+1), W0
	SUBR.B	W1, [W0], [W0]
;MyProject.c,88 :: 		if (indexes[1] < 0)
	MOV	#lo_addr(_indexes+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__calibration116
	GOTO	L_calibration23
L__calibration116:
;MyProject.c,89 :: 		indexes[1] = 7;
	MOV	#lo_addr(_indexes+1), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
L_calibration23:
;MyProject.c,90 :: 		}
	GOTO	L_calibration18
L_calibration19:
;MyProject.c,91 :: 		LATB.F13 = 0;
	BCLR	LATB, #13
;MyProject.c,92 :: 		LATB.F12 = 0;
	BCLR	LATB, #12
;MyProject.c,93 :: 		LATB.F11 = 0;
	BCLR	LATB, #11
;MyProject.c,94 :: 		LATB.F10 = 0;
	BCLR	LATB, #10
;MyProject.c,95 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,96 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,97 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,98 :: 		rotate(3000, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#3000, W10
	CALL	MyProject_rotate
;MyProject.c,99 :: 		}
L_end_calibration:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _calibration

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;MyProject.c,101 :: 		void main() {
;MyProject.c,102 :: 		OSCDIVbits.DIV = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	OSCDIVbits, W1
	MOV	#32768, W0
	AND	W1, W0, W0
	MOV	WREG, OSCDIVbits
;MyProject.c,104 :: 		ANSA = 0;
	CLR	ANSA
;MyProject.c,105 :: 		ANSB = 0;
	CLR	ANSB
;MyProject.c,107 :: 		TRISB = 0b0000010000000001;
	MOV	#1025, W0
	MOV	WREG, TRISB
;MyProject.c,108 :: 		TRISA = 0b00000;
	CLR	TRISA
;MyProject.c,110 :: 		ODCA = 0;
	CLR	ODCA
;MyProject.c,111 :: 		ODCB = 0;
	CLR	ODCB
;MyProject.c,113 :: 		LATA = 0;
	CLR	LATA
;MyProject.c,114 :: 		LATB = 0;
	CLR	LATB
;MyProject.c,116 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;MyProject.c,117 :: 		PPS_Mapping_NoLock(3, _INPUT, _U1RX);
	MOV.B	#19, W12
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,118 :: 		PPS_Mapping_NoLock(2, _OUTPUT, _U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,119 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;MyProject.c,121 :: 		IEC0bits.U1RXIE = 1;
	BSET	IEC0bits, #11
;MyProject.c,122 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,124 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;MyProject.c,125 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main24:
	DEC	W7
	BRA NZ	L_main24
	DEC	W8
	BRA NZ	L_main24
;MyProject.c,126 :: 		calibration();
	CALL	_calibration
;MyProject.c,127 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,128 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,129 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,130 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main26:
	DEC	W7
	BRA NZ	L_main26
	DEC	W8
	BRA NZ	L_main26
;MyProject.c,131 :: 		while(1) {
L_main28:
;MyProject.c,132 :: 		if(flag == 1){
	MOV	_flag, W0
	CP	W0, #1
	BRA Z	L__main118
	GOTO	L_main30
L__main118:
;MyProject.c,133 :: 		flag = 0;
	CLR	W0
	MOV	W0, _flag
;MyProject.c,134 :: 		if(out[0] == 'A'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA Z	L__main119
	GOTO	L_main31
L__main119:
;MyProject.c,135 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,136 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,137 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,138 :: 		rotate(20, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#20, W10
	CALL	MyProject_rotate
;MyProject.c,139 :: 		}
	GOTO	L_main32
L_main31:
;MyProject.c,140 :: 		else if(out[0] == 'D'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA Z	L__main120
	GOTO	L_main33
L__main120:
;MyProject.c,141 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,142 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,143 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,144 :: 		rotate(20, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#20, W10
	CALL	MyProject_rotate
;MyProject.c,145 :: 		}
	GOTO	L_main34
L_main33:
;MyProject.c,146 :: 		else if(out[0] == 'J'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#74, W0
	CP.B	W1, W0
	BRA Z	L__main121
	GOTO	L_main35
L__main121:
;MyProject.c,147 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,148 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,149 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,150 :: 		rotate(20, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#20, W10
	CALL	MyProject_rotate
;MyProject.c,151 :: 		}
	GOTO	L_main36
L_main35:
;MyProject.c,152 :: 		else if(out[0] == 'L'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#76, W0
	CP.B	W1, W0
	BRA Z	L__main122
	GOTO	L_main37
L__main122:
;MyProject.c,153 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,154 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,155 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,156 :: 		rotate(20, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#20, W10
	CALL	MyProject_rotate
;MyProject.c,157 :: 		}
	GOTO	L_main38
L_main37:
;MyProject.c,158 :: 		else if(out[0] == 'O' && out[1] == 'L'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main123
	GOTO	L__main91
L__main123:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#76, W0
	CP.B	W1, W0
	BRA Z	L__main124
	GOTO	L__main90
L__main124:
L__main89:
;MyProject.c,159 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,160 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,161 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,162 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,163 :: 		rotate(korak1, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotate
;MyProject.c,164 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,165 :: 		}
	GOTO	L_main42
;MyProject.c,158 :: 		else if(out[0] == 'O' && out[1] == 'L'){
L__main91:
L__main90:
;MyProject.c,166 :: 		else if(out[0] == 'O' && out[1] == 'D'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main125
	GOTO	L__main93
L__main125:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA Z	L__main126
	GOTO	L__main92
L__main126:
L__main88:
;MyProject.c,167 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,168 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,169 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,170 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,171 :: 		rotate(korak1, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotate
;MyProject.c,172 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,173 :: 		}
	GOTO	L_main46
;MyProject.c,166 :: 		else if(out[0] == 'O' && out[1] == 'D'){
L__main93:
L__main92:
;MyProject.c,174 :: 		else if(out[0] == 'K' && out[1] == 'A'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#75, W0
	CP.B	W1, W0
	BRA Z	L__main127
	GOTO	L__main95
L__main127:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA Z	L__main128
	GOTO	L__main94
L__main128:
L__main87:
;MyProject.c,175 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,176 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,177 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,178 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,179 :: 		rotate(korak1, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotate
;MyProject.c,180 :: 		}
	GOTO	L_main50
;MyProject.c,174 :: 		else if(out[0] == 'K' && out[1] == 'A'){
L__main95:
L__main94:
;MyProject.c,181 :: 		else if(out[0] == 'N' && out[1] == '1'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main129
	GOTO	L__main97
L__main129:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#49, W0
	CP.B	W1, W0
	BRA Z	L__main130
	GOTO	L__main96
L__main130:
L__main86:
;MyProject.c,182 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,183 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,184 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,185 :: 		rotate(2276, step_code, 1); // 40 stepeni
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2276, W10
	CALL	MyProject_rotate
;MyProject.c,186 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,187 :: 		}
	GOTO	L_main54
;MyProject.c,181 :: 		else if(out[0] == 'N' && out[1] == '1'){
L__main97:
L__main96:
;MyProject.c,188 :: 		else if(out[0] == 'N' && out[1] == '2'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main131
	GOTO	L__main99
L__main131:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#50, W0
	CP.B	W1, W0
	BRA Z	L__main132
	GOTO	L__main98
L__main132:
L__main85:
;MyProject.c,189 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,190 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,191 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,192 :: 		rotate(2845, step_code, 1); // 50 stepeni
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2845, W10
	CALL	MyProject_rotate
;MyProject.c,193 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,194 :: 		}
	GOTO	L_main58
;MyProject.c,188 :: 		else if(out[0] == 'N' && out[1] == '2'){
L__main99:
L__main98:
;MyProject.c,195 :: 		else if(out[0] == 'N' && out[1] == '3'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main133
	GOTO	L__main101
L__main133:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#51, W0
	CP.B	W1, W0
	BRA Z	L__main134
	GOTO	L__main100
L__main134:
L__main84:
;MyProject.c,196 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,197 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,198 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,199 :: 		rotate(3840, step_code, 1); // 67.5 stepeni
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#3840, W10
	CALL	MyProject_rotate
;MyProject.c,200 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,201 :: 		}
	GOTO	L_main62
;MyProject.c,195 :: 		else if(out[0] == 'N' && out[1] == '3'){
L__main101:
L__main100:
;MyProject.c,202 :: 		else if(out[0] == 'N' && out[1] == '4'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main135
	GOTO	L__main103
L__main135:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#52, W0
	CP.B	W1, W0
	BRA Z	L__main136
	GOTO	L__main102
L__main136:
L__main83:
;MyProject.c,203 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,204 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,205 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,206 :: 		rotate(4552, step_code, 1); // 80 stepeni
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#4552, W10
	CALL	MyProject_rotate
;MyProject.c,207 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,208 :: 		}
	GOTO	L_main66
;MyProject.c,202 :: 		else if(out[0] == 'N' && out[1] == '4'){
L__main103:
L__main102:
;MyProject.c,209 :: 		else if(out[0] == 'N' && out[1] == '5'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main137
	GOTO	L__main105
L__main137:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#53, W0
	CP.B	W1, W0
	BRA Z	L__main138
	GOTO	L__main104
L__main138:
L__main82:
;MyProject.c,210 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,211 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,212 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,213 :: 		rotate(5916, step_code, 1); // 104 stepeni
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#5916, W10
	CALL	MyProject_rotate
;MyProject.c,214 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,215 :: 		}
	GOTO	L_main70
;MyProject.c,209 :: 		else if(out[0] == 'N' && out[1] == '5'){
L__main105:
L__main104:
;MyProject.c,216 :: 		else if(out[0] == 'I'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#73, W0
	CP.B	W1, W0
	BRA Z	L__main139
	GOTO	L_main71
L__main139:
;MyProject.c,217 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,218 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,219 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,220 :: 		rotate(2000, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2000, W10
	CALL	MyProject_rotate
;MyProject.c,221 :: 		rotate(2000, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2000, W10
	CALL	MyProject_rotate
;MyProject.c,222 :: 		}
	GOTO	L_main72
L_main71:
;MyProject.c,223 :: 		else if(out[0] == 'C'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#67, W0
	CP.B	W1, W0
	BRA Z	L__main140
	GOTO	L_main73
L__main140:
;MyProject.c,224 :: 		calibration();
	CALL	_calibration
;MyProject.c,225 :: 		}
	GOTO	L_main74
L_main73:
;MyProject.c,226 :: 		else if(out[0] == 'B'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#66, W0
	CP.B	W1, W0
	BRA Z	L__main141
	GOTO	L_main75
L__main141:
;MyProject.c,227 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,228 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,229 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,230 :: 		rotate(285, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#285, W10
	CALL	MyProject_rotate
;MyProject.c,231 :: 		}
L_main75:
L_main74:
L_main72:
L_main70:
L_main66:
L_main62:
L_main58:
L_main54:
L_main50:
L_main46:
L_main42:
L_main38:
L_main36:
L_main34:
L_main32:
;MyProject.c,232 :: 		memset(out, 0, sizeof(out));
	MOV	#100, W12
	CLR	W11
	MOV	#lo_addr(_out), W10
	CALL	_memset
;MyProject.c,233 :: 		}
L_main30:
;MyProject.c,234 :: 		}
	GOTO	L_main28
;MyProject.c,235 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
