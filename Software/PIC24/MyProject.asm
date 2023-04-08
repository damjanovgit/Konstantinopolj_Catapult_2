
_uart_interrupt:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;MyProject.c,13 :: 		void uart_interrupt() iv IVT_ADDR_U1RXINTERRUPT ics ICS_AUTO {
;MyProject.c,14 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,15 :: 		uart_ch = UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_ch), W1
	MOV.B	W0, [W1]
;MyProject.c,16 :: 		if(uart_ch == 'q'){
	MOV.B	#113, W1
	CP.B	W0, W1
	BRA Z	L__uart_interrupt41
	GOTO	L_uart_interrupt0
L__uart_interrupt41:
;MyProject.c,17 :: 		m = 0;
	CLR	W0
	MOV	W0, _m
;MyProject.c,18 :: 		flag = 1;
	MOV	#1, W0
	MOV	W0, _flag
;MyProject.c,19 :: 		}
	GOTO	L_uart_interrupt1
L_uart_interrupt0:
;MyProject.c,21 :: 		out[m] = uart_ch;
	MOV	#lo_addr(_out), W1
	MOV	#lo_addr(_m), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_uart_ch), W0
	MOV.B	[W0], [W1]
;MyProject.c,22 :: 		m++;
	MOV	#1, W1
	MOV	#lo_addr(_m), W0
	ADD	W1, [W0], [W0]
;MyProject.c,23 :: 		}
L_uart_interrupt1:
;MyProject.c,24 :: 		}
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

MyProject_rotiraj:

;MyProject.c,26 :: 		static inline void rotiraj(int korak, char s[], int left_right){ // left_right = 1 - lijevo, left_right = -1 - desno
;MyProject.c,27 :: 		LATB.F6 = s[2];
	ADD	W11, #2, W0
	MOV.B	[W0], W0
	BTSS	W0, #0
	BCLR.B	LATB, #6
	BTSC	W0, #0
	BSET.B	LATB, #6
;MyProject.c,28 :: 		LATB.F7 = s[1];
	ADD	W11, #1, W0
	MOV.B	[W0], W0
	BTSS	W0, #0
	BCLR.B	LATB, #7
	BTSC	W0, #0
	BSET.B	LATB, #7
;MyProject.c,29 :: 		LATB.F8 = s[0];
	MOV.B	[W11], W0
	BTSS	W0, #0
	BCLR	LATB, #8
	BTSC	W0, #0
	BSET	LATB, #8
;MyProject.c,30 :: 		while(korak != 0){
L_MyProject_rotiraj2:
	CP	W10, #0
	BRA NZ	L_MyProject_rotiraj43
	GOTO	L_MyProject_rotiraj3
L_MyProject_rotiraj43:
;MyProject.c,31 :: 		LATB.F13 = lookup[i][0];
	MOV	_i, W0
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
;MyProject.c,32 :: 		LATB.F12 = lookup[i][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,33 :: 		LATB.F11 = lookup[i][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,34 :: 		LATB.F10 = lookup[i][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,35 :: 		Delay_us(1000);
	MOV	#1333, W7
L_MyProject_rotiraj4:
	DEC	W7
	BRA NZ	L_MyProject_rotiraj4
	NOP
;MyProject.c,36 :: 		korak--;
	SUB	W10, #1, W0
	MOV	W0, W10
;MyProject.c,37 :: 		i+= left_right;
	MOV	#lo_addr(_i), W0
	ADD	W12, [W0], W0
	MOV	W0, _i
;MyProject.c,38 :: 		if (i >= 8)
	CP	W0, #8
	BRA GE	L_MyProject_rotiraj44
	GOTO	L_MyProject_rotiraj6
L_MyProject_rotiraj44:
;MyProject.c,39 :: 		i = 0;
	CLR	W0
	MOV	W0, _i
L_MyProject_rotiraj6:
;MyProject.c,40 :: 		if (i < 0)
	MOV	_i, W0
	CP	W0, #0
	BRA LT	L_MyProject_rotiraj45
	GOTO	L_MyProject_rotiraj7
L_MyProject_rotiraj45:
;MyProject.c,41 :: 		i = 7;
	MOV	#7, W0
	MOV	W0, _i
L_MyProject_rotiraj7:
;MyProject.c,42 :: 		}
	GOTO	L_MyProject_rotiraj2
L_MyProject_rotiraj3:
;MyProject.c,43 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,44 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,45 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,46 :: 		}
L_end_rotiraj:
	RETURN
; end of MyProject_rotiraj

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;MyProject.c,48 :: 		void main() {
;MyProject.c,51 :: 		OSCDIVbits.DIV = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	OSCDIVbits, W1
	MOV	#32768, W0
	AND	W1, W0, W0
	MOV	WREG, OSCDIVbits
;MyProject.c,54 :: 		ANSA = 0;
	CLR	ANSA
;MyProject.c,55 :: 		ANSB = 0;
	CLR	ANSB
;MyProject.c,57 :: 		TRISB = 0b0000000000000000;
	CLR	TRISB
;MyProject.c,58 :: 		TRISA = 0b00000;
	CLR	TRISA
;MyProject.c,60 :: 		ODCA = 0;
	CLR	ODCA
;MyProject.c,61 :: 		ODCB = 0;
	CLR	ODCB
;MyProject.c,63 :: 		LATA = 0;
	CLR	LATA
;MyProject.c,64 :: 		LATB = 0;
	CLR	LATB
;MyProject.c,70 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;MyProject.c,71 :: 		PPS_Mapping_NoLock(3, _INPUT, _U1RX);
	MOV.B	#19, W12
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,72 :: 		PPS_Mapping_NoLock(2, _OUTPUT, _U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,73 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;MyProject.c,75 :: 		IEC0bits.U1RXIE = 1; // Omogucavanje RX prekida
	BSET	IEC0bits, #11
;MyProject.c,76 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,79 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;MyProject.c,81 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main8:
	DEC	W7
	BRA NZ	L_main8
	DEC	W8
	BRA NZ	L_main8
;MyProject.c,82 :: 		UART1_Write_Text("OK");
	MOV	#lo_addr(?lstr1_MyProject), W10
	CALL	_UART1_Write_Text
;MyProject.c,85 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,86 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,87 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,88 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main10:
	DEC	W7
	BRA NZ	L_main10
	DEC	W8
	BRA NZ	L_main10
;MyProject.c,89 :: 		while(1) {
L_main12:
;MyProject.c,90 :: 		if(flag == 1){
	MOV	_flag, W0
	CP	W0, #1
	BRA Z	L__main47
	GOTO	L_main14
L__main47:
;MyProject.c,91 :: 		flag = 0;
	CLR	W0
	MOV	W0, _flag
;MyProject.c,93 :: 		if(strcmp("L1_A",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr2_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main48
	GOTO	L_main15
L__main48:
;MyProject.c,94 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,95 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,96 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,97 :: 		rotiraj(11, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,98 :: 		}
	GOTO	L_main16
L_main15:
;MyProject.c,99 :: 		else if(strcmp("L1_D",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr3_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main49
	GOTO	L_main17
L__main49:
;MyProject.c,100 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,101 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,102 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,103 :: 		rotiraj(11, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,104 :: 		}
	GOTO	L_main18
L_main17:
;MyProject.c,105 :: 		else if(strcmp("L2_J",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr4_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main50
	GOTO	L_main19
L__main50:
;MyProject.c,106 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,107 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,108 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,109 :: 		rotiraj(11, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,110 :: 		}
	GOTO	L_main20
L_main19:
;MyProject.c,111 :: 		else if(strcmp("L2_L",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr5_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main51
	GOTO	L_main21
L__main51:
;MyProject.c,112 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,113 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,114 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,115 :: 		rotiraj(11, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,116 :: 		}
	GOTO	L_main22
L_main21:
;MyProject.c,117 :: 		else if(out[0] == 'O' && out[1] == 'L'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main52
	GOTO	L__main37
L__main52:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#76, W0
	CP.B	W1, W0
	BRA Z	L__main53
	GOTO	L__main36
L__main53:
L__main35:
;MyProject.c,118 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,119 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,120 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,121 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,122 :: 		rotiraj(korak1, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,123 :: 		}
	GOTO	L_main26
;MyProject.c,117 :: 		else if(out[0] == 'O' && out[1] == 'L'){
L__main37:
L__main36:
;MyProject.c,124 :: 		else if(out[0] == 'O' && out[1] == 'D'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main54
	GOTO	L__main39
L__main54:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA Z	L__main55
	GOTO	L__main38
L__main55:
L__main34:
;MyProject.c,125 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,126 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,127 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,128 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,129 :: 		rotiraj(korak1, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,130 :: 		}
	GOTO	L_main30
;MyProject.c,124 :: 		else if(out[0] == 'O' && out[1] == 'D'){
L__main39:
L__main38:
;MyProject.c,131 :: 		else if(out[0] == 'N'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main56
	GOTO	L_main31
L__main56:
;MyProject.c,132 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,133 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,134 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,135 :: 		rotiraj(5690, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#5690, W10
	CALL	MyProject_rotiraj
;MyProject.c,136 :: 		}
	GOTO	L_main32
L_main31:
;MyProject.c,137 :: 		else if(out[0] == 'I'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#73, W0
	CP.B	W1, W0
	BRA Z	L__main57
	GOTO	L_main33
L__main57:
;MyProject.c,138 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,139 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,140 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,141 :: 		rotiraj(1138, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#1138, W10
	CALL	MyProject_rotiraj
;MyProject.c,142 :: 		rotiraj(1138, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#1138, W10
	CALL	MyProject_rotiraj
;MyProject.c,143 :: 		}
L_main33:
L_main32:
L_main30:
L_main26:
L_main22:
L_main20:
L_main18:
L_main16:
;MyProject.c,144 :: 		memset(out, 0, sizeof(out));
	MOV	#100, W12
	CLR	W11
	MOV	#lo_addr(_out), W10
	CALL	_memset
;MyProject.c,145 :: 		}
L_main14:
;MyProject.c,146 :: 		}
	GOTO	L_main12
;MyProject.c,147 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
