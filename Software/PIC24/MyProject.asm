
MyProject_rotiraj:

;MyProject.c,14 :: 		static inline void rotiraj(int korak, char s[], int left_right){ // left_right = 1 - lijevo, left_right = -1 - desno
;MyProject.c,15 :: 		i = 4*s[2] + 2*s[1] + s[0];
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
;MyProject.c,16 :: 		LATB.F6 = s[2];
	MOV.B	[W4], W0
	BTSS	W0, #0
	BCLR.B	LATB, #6
	BTSC	W0, #0
	BSET.B	LATB, #6
;MyProject.c,17 :: 		LATB.F7 = s[1];
	MOV.B	[W3], W0
	BTSS	W0, #0
	BCLR.B	LATB, #7
	BTSC	W0, #0
	BSET.B	LATB, #7
;MyProject.c,18 :: 		LATB.F8 = s[0];
	MOV.B	[W11], W0
	BTSS	W0, #0
	BCLR	LATB, #8
	BTSC	W0, #0
	BSET	LATB, #8
;MyProject.c,19 :: 		while(korak > 0){
L_MyProject_rotiraj0:
	CP	W10, #0
	BRA GT	L_MyProject_rotiraj74
	GOTO	L_MyProject_rotiraj1
L_MyProject_rotiraj74:
;MyProject.c,20 :: 		LATB.F13 = lookup[indexes[i]][0];
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
;MyProject.c,21 :: 		LATB.F12 = lookup[indexes[i]][1];
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
;MyProject.c,22 :: 		LATB.F11 = lookup[indexes[i]][2];
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
;MyProject.c,23 :: 		LATB.F10 = lookup[indexes[i]][3];
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
;MyProject.c,24 :: 		korak--;
	SUB	W10, #1, W0
	MOV	W0, W10
;MyProject.c,25 :: 		indexes[i] += left_right;
	SE	[W2], W0
	ADD	W0, W12, W0
	MOV.B	W0, [W2]
;MyProject.c,26 :: 		if (indexes[i] >= 8 && left_right == 1)
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA GE	L_MyProject_rotiraj75
	GOTO	L_MyProject_rotiraj61
L_MyProject_rotiraj75:
	CP	W12, #1
	BRA Z	L_MyProject_rotiraj76
	GOTO	L_MyProject_rotiraj60
L_MyProject_rotiraj76:
L_MyProject_rotiraj59:
;MyProject.c,27 :: 		indexes[i] = 0;
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,26 :: 		if (indexes[i] >= 8 && left_right == 1)
L_MyProject_rotiraj61:
L_MyProject_rotiraj60:
;MyProject.c,28 :: 		if (indexes[i] < 0  && left_right == -1)
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L_MyProject_rotiraj77
	GOTO	L_MyProject_rotiraj63
L_MyProject_rotiraj77:
	MOV	#65535, W0
	CP	W12, W0
	BRA Z	L_MyProject_rotiraj78
	GOTO	L_MyProject_rotiraj62
L_MyProject_rotiraj78:
L_MyProject_rotiraj58:
;MyProject.c,29 :: 		indexes[i] = 7;
	MOV	#lo_addr(_indexes), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
;MyProject.c,28 :: 		if (indexes[i] < 0  && left_right == -1)
L_MyProject_rotiraj63:
L_MyProject_rotiraj62:
;MyProject.c,30 :: 		Delay_us(pauza);
	MOV	#1466, W7
L_MyProject_rotiraj8:
	DEC	W7
	BRA NZ	L_MyProject_rotiraj8
	NOP
	NOP
;MyProject.c,31 :: 		}
	GOTO	L_MyProject_rotiraj0
L_MyProject_rotiraj1:
;MyProject.c,32 :: 		LATB.F13 = 0;
	BCLR	LATB, #13
;MyProject.c,33 :: 		LATB.F12 = 0;
	BCLR	LATB, #12
;MyProject.c,34 :: 		LATB.F11 = 0;
	BCLR	LATB, #11
;MyProject.c,35 :: 		LATB.F10 = 0;
	BCLR	LATB, #10
;MyProject.c,36 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,37 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,38 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,39 :: 		}
L_end_rotiraj:
	RETURN
; end of MyProject_rotiraj

_uart_interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;MyProject.c,41 :: 		void uart_interrupt() iv IVT_ADDR_U1RXINTERRUPT ics ICS_AUTO {
;MyProject.c,42 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,43 :: 		uart_ch = UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_ch), W1
	MOV.B	W0, [W1]
;MyProject.c,44 :: 		if(uart_ch == 'q'){
	MOV.B	#113, W1
	CP.B	W0, W1
	BRA Z	L__uart_interrupt80
	GOTO	L_uart_interrupt10
L__uart_interrupt80:
;MyProject.c,45 :: 		m = 0;
	CLR	W0
	MOV	W0, _m
;MyProject.c,46 :: 		flag = 1;
	MOV	#1, W0
	MOV	W0, _flag
;MyProject.c,47 :: 		}
	GOTO	L_uart_interrupt11
L_uart_interrupt10:
;MyProject.c,49 :: 		out[m] = uart_ch;
	MOV	#lo_addr(_out), W1
	MOV	#lo_addr(_m), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_uart_ch), W0
	MOV.B	[W0], [W1]
;MyProject.c,50 :: 		m++;
	MOV	#1, W1
	MOV	#lo_addr(_m), W0
	ADD	W1, [W0], [W0]
;MyProject.c,51 :: 		}
L_uart_interrupt11:
;MyProject.c,52 :: 		}
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

_kalibracija:

;MyProject.c,54 :: 		void kalibracija(){
;MyProject.c,55 :: 		LATB.F6 = 1;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BSET.B	LATB, #6
;MyProject.c,56 :: 		LATB.F7 = 0;
	BCLR.B	LATB, #7
;MyProject.c,57 :: 		LATB.F8 = 0;
	BCLR	LATB, #8
;MyProject.c,58 :: 		while(1){
L_kalibracija12:
;MyProject.c,59 :: 		if(PORTB.F5 == 1)
	BTSS	PORTB, #5
	GOTO	L_kalibracija14
;MyProject.c,60 :: 		break;
	GOTO	L_kalibracija13
L_kalibracija14:
;MyProject.c,61 :: 		LATB.F13 = lookup[indexes[4]][0];
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
;MyProject.c,62 :: 		LATB.F12 = lookup[indexes[4]][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,63 :: 		LATB.F11 = lookup[indexes[4]][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,64 :: 		LATB.F10 = lookup[indexes[4]][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,65 :: 		Delay_us(pauza);
	MOV	#1466, W7
L_kalibracija15:
	DEC	W7
	BRA NZ	L_kalibracija15
	NOP
	NOP
;MyProject.c,66 :: 		indexes[4]--;
	MOV.B	#1, W1
	MOV	#lo_addr(_indexes+4), W0
	SUBR.B	W1, [W0], [W0]
;MyProject.c,67 :: 		if (indexes[4] < 0)
	MOV	#lo_addr(_indexes+4), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__kalibracija82
	GOTO	L_kalibracija17
L__kalibracija82:
;MyProject.c,68 :: 		indexes[4] = 7;
	MOV	#lo_addr(_indexes+4), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
L_kalibracija17:
;MyProject.c,69 :: 		}
	GOTO	L_kalibracija12
L_kalibracija13:
;MyProject.c,70 :: 		LATB.F13 = 0;
	BCLR	LATB, #13
;MyProject.c,71 :: 		LATB.F12 = 0;
	BCLR	LATB, #12
;MyProject.c,72 :: 		LATB.F11 = 0;
	BCLR	LATB, #11
;MyProject.c,73 :: 		LATB.F10 = 0;
	BCLR	LATB, #10
;MyProject.c,74 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,75 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,76 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,77 :: 		rotiraj(910, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#910, W10
	CALL	MyProject_rotiraj
;MyProject.c,78 :: 		LATB.F6 = 0;
	BCLR.B	LATB, #6
;MyProject.c,79 :: 		LATB.F7 = 0;
	BCLR.B	LATB, #7
;MyProject.c,80 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,81 :: 		while(1){
L_kalibracija18:
;MyProject.c,82 :: 		if(PORTB.F15 == 1)
	BTSS	PORTB, #15
	GOTO	L_kalibracija20
;MyProject.c,83 :: 		break;
	GOTO	L_kalibracija19
L_kalibracija20:
;MyProject.c,84 :: 		LATB.F13 = lookup[indexes[1]][0];
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
;MyProject.c,85 :: 		LATB.F12 = lookup[indexes[1]][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,86 :: 		LATB.F11 = lookup[indexes[1]][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,87 :: 		LATB.F10 = lookup[indexes[1]][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,88 :: 		Delay_us(pauza);
	MOV	#1466, W7
L_kalibracija21:
	DEC	W7
	BRA NZ	L_kalibracija21
	NOP
	NOP
;MyProject.c,89 :: 		indexes[1]--;
	MOV.B	#1, W1
	MOV	#lo_addr(_indexes+1), W0
	SUBR.B	W1, [W0], [W0]
;MyProject.c,90 :: 		if (indexes[1] < 0)
	MOV	#lo_addr(_indexes+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__kalibracija83
	GOTO	L_kalibracija23
L__kalibracija83:
;MyProject.c,91 :: 		indexes[1] = 7;
	MOV	#lo_addr(_indexes+1), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
L_kalibracija23:
;MyProject.c,92 :: 		}
	GOTO	L_kalibracija18
L_kalibracija19:
;MyProject.c,93 :: 		LATB.F13 = 0;
	BCLR	LATB, #13
;MyProject.c,94 :: 		LATB.F12 = 0;
	BCLR	LATB, #12
;MyProject.c,95 :: 		LATB.F11 = 0;
	BCLR	LATB, #11
;MyProject.c,96 :: 		LATB.F10 = 0;
	BCLR	LATB, #10
;MyProject.c,97 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,98 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,99 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,100 :: 		rotiraj(3000, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#3000, W10
	CALL	MyProject_rotiraj
;MyProject.c,101 :: 		}
L_end_kalibracija:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _kalibracija

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;MyProject.c,103 :: 		void main() {
;MyProject.c,106 :: 		OSCDIVbits.DIV = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	OSCDIVbits, W1
	MOV	#32768, W0
	AND	W1, W0, W0
	MOV	WREG, OSCDIVbits
;MyProject.c,109 :: 		ANSA = 0;
	CLR	ANSA
;MyProject.c,110 :: 		ANSB = 0;
	CLR	ANSB
;MyProject.c,112 :: 		TRISB = 0b0000010000000001;
	MOV	#1025, W0
	MOV	WREG, TRISB
;MyProject.c,113 :: 		TRISA = 0b00000;
	CLR	TRISA
;MyProject.c,115 :: 		ODCA = 0;
	CLR	ODCA
;MyProject.c,116 :: 		ODCB = 0;
	CLR	ODCB
;MyProject.c,118 :: 		LATA = 0;
	CLR	LATA
;MyProject.c,119 :: 		LATB = 0;
	CLR	LATB
;MyProject.c,125 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;MyProject.c,126 :: 		PPS_Mapping_NoLock(3, _INPUT, _U1RX);
	MOV.B	#19, W12
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,127 :: 		PPS_Mapping_NoLock(2, _OUTPUT, _U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,128 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;MyProject.c,130 :: 		IEC0bits.U1RXIE = 1; // Omogucavanje RX prekida
	BSET	IEC0bits, #11
;MyProject.c,131 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,134 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;MyProject.c,136 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main24:
	DEC	W7
	BRA NZ	L_main24
	DEC	W8
	BRA NZ	L_main24
;MyProject.c,137 :: 		UART1_Write_Text("OK");
	MOV	#lo_addr(?lstr1_MyProject), W10
	CALL	_UART1_Write_Text
;MyProject.c,140 :: 		kalibracija();
	CALL	_kalibracija
;MyProject.c,141 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,142 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,143 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,144 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main26:
	DEC	W7
	BRA NZ	L_main26
	DEC	W8
	BRA NZ	L_main26
;MyProject.c,145 :: 		while(1) {
L_main28:
;MyProject.c,146 :: 		if(flag == 1){
	MOV	_flag, W0
	CP	W0, #1
	BRA Z	L__main85
	GOTO	L_main30
L__main85:
;MyProject.c,147 :: 		flag = 0;
	CLR	W0
	MOV	W0, _flag
;MyProject.c,148 :: 		if(out[0] == 'A'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA Z	L__main86
	GOTO	L_main31
L__main86:
;MyProject.c,149 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,150 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,151 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,152 :: 		rotiraj(20, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#20, W10
	CALL	MyProject_rotiraj
;MyProject.c,153 :: 		}
	GOTO	L_main32
L_main31:
;MyProject.c,154 :: 		else if(out[0] == 'D'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA Z	L__main87
	GOTO	L_main33
L__main87:
;MyProject.c,155 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,156 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,157 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,158 :: 		rotiraj(20, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#20, W10
	CALL	MyProject_rotiraj
;MyProject.c,159 :: 		}
	GOTO	L_main34
L_main33:
;MyProject.c,160 :: 		else if(out[0] == 'J'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#74, W0
	CP.B	W1, W0
	BRA Z	L__main88
	GOTO	L_main35
L__main88:
;MyProject.c,161 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,162 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,163 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,164 :: 		rotiraj(20, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#20, W10
	CALL	MyProject_rotiraj
;MyProject.c,165 :: 		}
	GOTO	L_main36
L_main35:
;MyProject.c,166 :: 		else if(out[0] == 'L'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#76, W0
	CP.B	W1, W0
	BRA Z	L__main89
	GOTO	L_main37
L__main89:
;MyProject.c,167 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,168 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,169 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,170 :: 		rotiraj(20, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#20, W10
	CALL	MyProject_rotiraj
;MyProject.c,171 :: 		}
	GOTO	L_main38
L_main37:
;MyProject.c,172 :: 		else if(out[0] == 'O' && out[1] == 'L'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main90
	GOTO	L__main68
L__main90:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#76, W0
	CP.B	W1, W0
	BRA Z	L__main91
	GOTO	L__main67
L__main91:
L__main66:
;MyProject.c,173 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,174 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,175 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,176 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,177 :: 		rotiraj(korak1, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,178 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,179 :: 		}
	GOTO	L_main42
;MyProject.c,172 :: 		else if(out[0] == 'O' && out[1] == 'L'){
L__main68:
L__main67:
;MyProject.c,180 :: 		else if(out[0] == 'O' && out[1] == 'D'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main92
	GOTO	L__main70
L__main92:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA Z	L__main93
	GOTO	L__main69
L__main93:
L__main65:
;MyProject.c,181 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,182 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,183 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,184 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,185 :: 		rotiraj(korak1, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,186 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,187 :: 		}
	GOTO	L_main46
;MyProject.c,180 :: 		else if(out[0] == 'O' && out[1] == 'D'){
L__main70:
L__main69:
;MyProject.c,188 :: 		else if(out[0] == 'K' && out[1] == 'A'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#75, W0
	CP.B	W1, W0
	BRA Z	L__main94
	GOTO	L__main72
L__main94:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA Z	L__main95
	GOTO	L__main71
L__main95:
L__main64:
;MyProject.c,189 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,190 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,191 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,192 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,193 :: 		rotiraj(korak1, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,194 :: 		}
	GOTO	L_main50
;MyProject.c,188 :: 		else if(out[0] == 'K' && out[1] == 'A'){
L__main72:
L__main71:
;MyProject.c,195 :: 		else if(out[0] == 'N'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main96
	GOTO	L_main51
L__main96:
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
;MyProject.c,199 :: 		rotiraj(4552, step_code, 1); // 80 stepeni 4552, 40 stepeni 2276
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#4552, W10
	CALL	MyProject_rotiraj
;MyProject.c,200 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,201 :: 		}
	GOTO	L_main52
L_main51:
;MyProject.c,202 :: 		else if(out[0] == 'I'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#73, W0
	CP.B	W1, W0
	BRA Z	L__main97
	GOTO	L_main53
L__main97:
;MyProject.c,203 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,204 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,205 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,206 :: 		rotiraj(2000, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2000, W10
	CALL	MyProject_rotiraj
;MyProject.c,207 :: 		rotiraj(2000, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2000, W10
	CALL	MyProject_rotiraj
;MyProject.c,208 :: 		}
	GOTO	L_main54
L_main53:
;MyProject.c,209 :: 		else if(out[0] == 'C'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#67, W0
	CP.B	W1, W0
	BRA Z	L__main98
	GOTO	L_main55
L__main98:
;MyProject.c,210 :: 		kalibracija();
	CALL	_kalibracija
;MyProject.c,211 :: 		}
	GOTO	L_main56
L_main55:
;MyProject.c,212 :: 		else if(out[0] == 'B'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#66, W0
	CP.B	W1, W0
	BRA Z	L__main99
	GOTO	L_main57
L__main99:
;MyProject.c,213 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,214 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,215 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,216 :: 		rotiraj(285, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#285, W10
	CALL	MyProject_rotiraj
;MyProject.c,217 :: 		}
L_main57:
L_main56:
L_main54:
L_main52:
L_main50:
L_main46:
L_main42:
L_main38:
L_main36:
L_main34:
L_main32:
;MyProject.c,218 :: 		memset(out, 0, sizeof(out));
	MOV	#100, W12
	CLR	W11
	MOV	#lo_addr(_out), W10
	CALL	_memset
;MyProject.c,219 :: 		}
L_main30:
;MyProject.c,220 :: 		}
	GOTO	L_main28
;MyProject.c,221 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
