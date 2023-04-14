
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
;MyProject.c,19 :: 		while(korak != 0){
L_MyProject_rotiraj0:
	CP	W10, #0
	BRA NZ	L_MyProject_rotiraj63
	GOTO	L_MyProject_rotiraj1
L_MyProject_rotiraj63:
;MyProject.c,20 :: 		LATB.F13 = lookup[indexes[i]][0];
	MOV	_i, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_indexes), W0
	ADD	W0, W1, W2
	MOV	[W2], W0
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
	MOV	[W2], W0
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
	MOV	[W2], W0
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
	MOV	[W2], W0
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
;MyProject.c,24 :: 		Delay_us(pauza);
	MOV	#1466, W7
L_MyProject_rotiraj2:
	DEC	W7
	BRA NZ	L_MyProject_rotiraj2
	NOP
	NOP
;MyProject.c,25 :: 		korak--;
	SUB	W10, #1, W0
	MOV	W0, W10
;MyProject.c,26 :: 		indexes[i] += left_right;
	MOV	_i, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_indexes), W0
	ADD	W0, W1, W0
	ADD	W12, [W0], [W0]
;MyProject.c,27 :: 		if (indexes[i] >= 8 && left_right == 1)
	MOV	_i, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_indexes), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #8
	BRA GE	L_MyProject_rotiraj64
	GOTO	L_MyProject_rotiraj53
L_MyProject_rotiraj64:
	CP	W12, #1
	BRA Z	L_MyProject_rotiraj65
	GOTO	L_MyProject_rotiraj52
L_MyProject_rotiraj65:
L_MyProject_rotiraj51:
;MyProject.c,28 :: 		indexes[i] = 0;
	MOV	_i, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_indexes), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV	W0, [W1]
;MyProject.c,27 :: 		if (indexes[i] >= 8 && left_right == 1)
L_MyProject_rotiraj53:
L_MyProject_rotiraj52:
;MyProject.c,29 :: 		if (indexes[i] < 0  && left_right == -1)
	MOV	_i, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_indexes), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA LT	L_MyProject_rotiraj66
	GOTO	L_MyProject_rotiraj55
L_MyProject_rotiraj66:
	MOV	#65535, W0
	CP	W12, W0
	BRA Z	L_MyProject_rotiraj67
	GOTO	L_MyProject_rotiraj54
L_MyProject_rotiraj67:
L_MyProject_rotiraj50:
;MyProject.c,30 :: 		indexes[i] = 7;
	MOV	_i, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_indexes), W0
	ADD	W0, W1, W1
	MOV	#7, W0
	MOV	W0, [W1]
;MyProject.c,29 :: 		if (indexes[i] < 0  && left_right == -1)
L_MyProject_rotiraj55:
L_MyProject_rotiraj54:
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
	BRA Z	L__uart_interrupt69
	GOTO	L_uart_interrupt10
L__uart_interrupt69:
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
;MyProject.c,58 :: 		while(PORTB.F5 != 1){
L_kalibracija12:
	BTSC	PORTB, #5
	GOTO	L_kalibracija13
;MyProject.c,59 :: 		LATB.F13 = lookup[indexes[4]][0];
	MOV	_indexes+8, W0
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
L_kalibracija14:
	DEC	W7
	BRA NZ	L_kalibracija14
	NOP
	NOP
;MyProject.c,64 :: 		indexes[4]--;
	MOV	#1, W1
	MOV	#lo_addr(_indexes+8), W0
	SUBR	W1, [W0], [W0]
;MyProject.c,65 :: 		if (indexes[4] < 0)
	MOV	_indexes+8, W0
	CP	W0, #0
	BRA LT	L__kalibracija71
	GOTO	L_kalibracija16
L__kalibracija71:
;MyProject.c,66 :: 		indexes[4] = 7;
	MOV	#7, W0
	MOV	W0, _indexes+8
L_kalibracija16:
;MyProject.c,67 :: 		}
	GOTO	L_kalibracija12
L_kalibracija13:
;MyProject.c,68 :: 		LATB.F13 = 0;
	BCLR	LATB, #13
;MyProject.c,69 :: 		LATB.F12 = 0;
	BCLR	LATB, #12
;MyProject.c,70 :: 		LATB.F11 = 0;
	BCLR	LATB, #11
;MyProject.c,71 :: 		LATB.F10 = 0;
	BCLR	LATB, #10
;MyProject.c,72 :: 		LATB.F6 = 0;
	BCLR.B	LATB, #6
;MyProject.c,73 :: 		LATB.F7 = 0;
	BCLR.B	LATB, #7
;MyProject.c,74 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,75 :: 		while(PORTB.F15 != 1){
L_kalibracija17:
	BTSC	PORTB, #15
	GOTO	L_kalibracija18
;MyProject.c,76 :: 		LATB.F13 = lookup[indexes[1]][0];
	MOV	_indexes+2, W0
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
;MyProject.c,77 :: 		LATB.F12 = lookup[indexes[1]][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,78 :: 		LATB.F11 = lookup[indexes[1]][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,79 :: 		LATB.F10 = lookup[indexes[1]][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,80 :: 		Delay_us(pauza);
	MOV	#1466, W7
L_kalibracija19:
	DEC	W7
	BRA NZ	L_kalibracija19
	NOP
	NOP
;MyProject.c,81 :: 		indexes[1]--;
	MOV	#1, W1
	MOV	#lo_addr(_indexes+2), W0
	SUBR	W1, [W0], [W0]
;MyProject.c,82 :: 		if (indexes[1] < 0)
	MOV	_indexes+2, W0
	CP	W0, #0
	BRA LT	L__kalibracija72
	GOTO	L_kalibracija21
L__kalibracija72:
;MyProject.c,83 :: 		indexes[1] = 7;
	MOV	#7, W0
	MOV	W0, _indexes+2
L_kalibracija21:
;MyProject.c,84 :: 		}
	GOTO	L_kalibracija17
L_kalibracija18:
;MyProject.c,85 :: 		LATB.F13 = 0;
	BCLR	LATB, #13
;MyProject.c,86 :: 		LATB.F12 = 0;
	BCLR	LATB, #12
;MyProject.c,87 :: 		LATB.F11 = 0;
	BCLR	LATB, #11
;MyProject.c,88 :: 		LATB.F10 = 0;
	BCLR	LATB, #10
;MyProject.c,89 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,90 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,91 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,92 :: 		rotiraj(3000, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#3000, W10
	CALL	MyProject_rotiraj
;MyProject.c,93 :: 		}
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

;MyProject.c,95 :: 		void main() {
;MyProject.c,98 :: 		OSCDIVbits.DIV = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	OSCDIVbits, W1
	MOV	#32768, W0
	AND	W1, W0, W0
	MOV	WREG, OSCDIVbits
;MyProject.c,101 :: 		ANSA = 0;
	CLR	ANSA
;MyProject.c,102 :: 		ANSB = 0;
	CLR	ANSB
;MyProject.c,104 :: 		TRISB = 0b0000010000000001;
	MOV	#1025, W0
	MOV	WREG, TRISB
;MyProject.c,105 :: 		TRISA = 0b00000;
	CLR	TRISA
;MyProject.c,107 :: 		ODCA = 0;
	CLR	ODCA
;MyProject.c,108 :: 		ODCB = 0;
	CLR	ODCB
;MyProject.c,110 :: 		LATA = 0;
	CLR	LATA
;MyProject.c,111 :: 		LATB = 0;
	CLR	LATB
;MyProject.c,117 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;MyProject.c,118 :: 		PPS_Mapping_NoLock(3, _INPUT, _U1RX);
	MOV.B	#19, W12
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,119 :: 		PPS_Mapping_NoLock(2, _OUTPUT, _U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,120 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;MyProject.c,122 :: 		IEC0bits.U1RXIE = 1; // Omogucavanje RX prekida
	BSET	IEC0bits, #11
;MyProject.c,123 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,126 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;MyProject.c,128 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main22:
	DEC	W7
	BRA NZ	L_main22
	DEC	W8
	BRA NZ	L_main22
;MyProject.c,129 :: 		UART1_Write_Text("OK");
	MOV	#lo_addr(?lstr1_MyProject), W10
	CALL	_UART1_Write_Text
;MyProject.c,132 :: 		kalibracija();
	CALL	_kalibracija
;MyProject.c,133 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,134 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,135 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,136 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main24:
	DEC	W7
	BRA NZ	L_main24
	DEC	W8
	BRA NZ	L_main24
;MyProject.c,137 :: 		while(1) {
L_main26:
;MyProject.c,138 :: 		if(flag == 1){
	MOV	_flag, W0
	CP	W0, #1
	BRA Z	L__main74
	GOTO	L_main28
L__main74:
;MyProject.c,139 :: 		flag = 0;
	CLR	W0
	MOV	W0, _flag
;MyProject.c,141 :: 		if(strcmp("L1_A",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr2_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main75
	GOTO	L_main29
L__main75:
;MyProject.c,142 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,143 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,144 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,145 :: 		rotiraj(11, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,146 :: 		}
	GOTO	L_main30
L_main29:
;MyProject.c,147 :: 		else if(strcmp("L1_D",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr3_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main76
	GOTO	L_main31
L__main76:
;MyProject.c,148 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,149 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,150 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,151 :: 		rotiraj(11, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,152 :: 		}
	GOTO	L_main32
L_main31:
;MyProject.c,153 :: 		else if(strcmp("L2_J",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr4_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main77
	GOTO	L_main33
L__main77:
;MyProject.c,154 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,155 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,156 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,157 :: 		rotiraj(11, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,158 :: 		}
	GOTO	L_main34
L_main33:
;MyProject.c,159 :: 		else if(strcmp("L2_L",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr5_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main78
	GOTO	L_main35
L__main78:
;MyProject.c,160 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,161 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,162 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,163 :: 		rotiraj(11, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,164 :: 		}
	GOTO	L_main36
L_main35:
;MyProject.c,165 :: 		else if(out[0] == 'O' && out[1] == 'L'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main79
	GOTO	L__main59
L__main79:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#76, W0
	CP.B	W1, W0
	BRA Z	L__main80
	GOTO	L__main58
L__main80:
L__main57:
;MyProject.c,166 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,167 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,168 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,169 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,170 :: 		rotiraj(korak1, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,171 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,172 :: 		}
	GOTO	L_main40
;MyProject.c,165 :: 		else if(out[0] == 'O' && out[1] == 'L'){
L__main59:
L__main58:
;MyProject.c,173 :: 		else if(out[0] == 'O' && out[1] == 'D'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main81
	GOTO	L__main61
L__main81:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA Z	L__main82
	GOTO	L__main60
L__main82:
L__main56:
;MyProject.c,174 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,175 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,176 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,177 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,178 :: 		rotiraj(korak1, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,179 :: 		UART1_Write('1');
	MOV	#49, W10
	CALL	_UART1_Write
;MyProject.c,180 :: 		}
	GOTO	L_main44
;MyProject.c,173 :: 		else if(out[0] == 'O' && out[1] == 'D'){
L__main61:
L__main60:
;MyProject.c,181 :: 		else if(out[0] == 'N'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main83
	GOTO	L_main45
L__main83:
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
;MyProject.c,185 :: 		rotiraj(4552, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#4552, W10
	CALL	MyProject_rotiraj
;MyProject.c,186 :: 		}
	GOTO	L_main46
L_main45:
;MyProject.c,187 :: 		else if(out[0] == 'I'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#73, W0
	CP.B	W1, W0
	BRA Z	L__main84
	GOTO	L_main47
L__main84:
;MyProject.c,188 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,189 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,190 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,191 :: 		rotiraj(2000, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2000, W10
	CALL	MyProject_rotiraj
;MyProject.c,192 :: 		rotiraj(2000, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2000, W10
	CALL	MyProject_rotiraj
;MyProject.c,193 :: 		}
	GOTO	L_main48
L_main47:
;MyProject.c,194 :: 		else if(out[0] == 'B'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#66, W0
	CP.B	W1, W0
	BRA Z	L__main85
	GOTO	L_main49
L__main85:
;MyProject.c,195 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,196 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,197 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,198 :: 		rotiraj(285, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#285, W10
	CALL	MyProject_rotiraj
;MyProject.c,199 :: 		}
L_main49:
L_main48:
L_main46:
L_main44:
L_main40:
L_main36:
L_main34:
L_main32:
L_main30:
;MyProject.c,200 :: 		memset(out, 0, sizeof(out));
	MOV	#100, W12
	CLR	W11
	MOV	#lo_addr(_out), W10
	CALL	_memset
;MyProject.c,201 :: 		}
L_main28:
;MyProject.c,202 :: 		}
	GOTO	L_main26
;MyProject.c,203 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
