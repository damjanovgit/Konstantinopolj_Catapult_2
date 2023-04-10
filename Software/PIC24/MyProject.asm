
MyProject_rotiraj:

;MyProject.c,13 :: 		static inline void rotiraj(int korak, char s[], int left_right){ // left_right = 1 - lijevo, left_right = -1 - desno
;MyProject.c,14 :: 		LATB.F6 = s[2];
	ADD	W11, #2, W0
	MOV.B	[W0], W0
	BTSS	W0, #0
	BCLR.B	LATB, #6
	BTSC	W0, #0
	BSET.B	LATB, #6
;MyProject.c,15 :: 		LATB.F7 = s[1];
	ADD	W11, #1, W0
	MOV.B	[W0], W0
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
;MyProject.c,17 :: 		while(korak != 0){
L_MyProject_rotiraj0:
	CP	W10, #0
	BRA NZ	L_MyProject_rotiraj53
	GOTO	L_MyProject_rotiraj1
L_MyProject_rotiraj53:
;MyProject.c,18 :: 		LATB.F13 = lookup[i][0];
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
;MyProject.c,19 :: 		LATB.F12 = lookup[i][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,20 :: 		LATB.F11 = lookup[i][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,21 :: 		LATB.F10 = lookup[i][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,22 :: 		Delay_us(2000);
	MOV	#2666, W7
L_MyProject_rotiraj2:
	DEC	W7
	BRA NZ	L_MyProject_rotiraj2
	NOP
	NOP
;MyProject.c,23 :: 		korak--;
	SUB	W10, #1, W0
	MOV	W0, W10
;MyProject.c,24 :: 		i+= left_right;
	MOV	#lo_addr(_i), W0
	ADD	W12, [W0], W0
	MOV	W0, _i
;MyProject.c,25 :: 		if (i >= 8)
	CP	W0, #8
	BRA GE	L_MyProject_rotiraj54
	GOTO	L_MyProject_rotiraj4
L_MyProject_rotiraj54:
;MyProject.c,26 :: 		i = 0;
	CLR	W0
	MOV	W0, _i
L_MyProject_rotiraj4:
;MyProject.c,27 :: 		if (i < 0)
	MOV	_i, W0
	CP	W0, #0
	BRA LT	L_MyProject_rotiraj55
	GOTO	L_MyProject_rotiraj5
L_MyProject_rotiraj55:
;MyProject.c,28 :: 		i = 7;
	MOV	#7, W0
	MOV	W0, _i
L_MyProject_rotiraj5:
;MyProject.c,29 :: 		}
	GOTO	L_MyProject_rotiraj0
L_MyProject_rotiraj1:
;MyProject.c,30 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,31 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,32 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,33 :: 		}
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

;MyProject.c,35 :: 		void uart_interrupt() iv IVT_ADDR_U1RXINTERRUPT ics ICS_AUTO {
;MyProject.c,36 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,37 :: 		uart_ch = UART1_Read();
	CALL	_UART1_Read
	MOV	#lo_addr(_uart_ch), W1
	MOV.B	W0, [W1]
;MyProject.c,38 :: 		if(uart_ch == 'q'){
	MOV.B	#113, W1
	CP.B	W0, W1
	BRA Z	L__uart_interrupt57
	GOTO	L_uart_interrupt6
L__uart_interrupt57:
;MyProject.c,39 :: 		m = 0;
	CLR	W0
	MOV	W0, _m
;MyProject.c,40 :: 		flag = 1;
	MOV	#1, W0
	MOV	W0, _flag
;MyProject.c,41 :: 		}
	GOTO	L_uart_interrupt7
L_uart_interrupt6:
;MyProject.c,43 :: 		out[m] = uart_ch;
	MOV	#lo_addr(_out), W1
	MOV	#lo_addr(_m), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_uart_ch), W0
	MOV.B	[W0], [W1]
;MyProject.c,44 :: 		m++;
	MOV	#1, W1
	MOV	#lo_addr(_m), W0
	ADD	W1, [W0], [W0]
;MyProject.c,45 :: 		}
L_uart_interrupt7:
;MyProject.c,46 :: 		}
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

;MyProject.c,48 :: 		void kalibracija(){
;MyProject.c,49 :: 		LATB.F6 = 1;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BSET.B	LATB, #6
;MyProject.c,50 :: 		LATB.F7 = 0;
	BCLR.B	LATB, #7
;MyProject.c,51 :: 		LATB.F8 = 0;
	BCLR	LATB, #8
;MyProject.c,52 :: 		while(PORTB.F5 != 1){
L_kalibracija8:
	BTSC	PORTB, #5
	GOTO	L_kalibracija9
;MyProject.c,53 :: 		LATB.F13 = lookup[i][0];
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
;MyProject.c,54 :: 		LATB.F12 = lookup[i][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,55 :: 		LATB.F11 = lookup[i][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,56 :: 		LATB.F10 = lookup[i][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,57 :: 		Delay_us(2000);
	MOV	#2666, W7
L_kalibracija10:
	DEC	W7
	BRA NZ	L_kalibracija10
	NOP
	NOP
;MyProject.c,58 :: 		i--;
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	SUBR	W1, [W0], [W0]
;MyProject.c,59 :: 		if (i < 0)
	MOV	_i, W0
	CP	W0, #0
	BRA LT	L__kalibracija59
	GOTO	L_kalibracija12
L__kalibracija59:
;MyProject.c,60 :: 		i = 7;
	MOV	#7, W0
	MOV	W0, _i
L_kalibracija12:
;MyProject.c,61 :: 		}
	GOTO	L_kalibracija8
L_kalibracija9:
;MyProject.c,62 :: 		LATB.F6 = 0;
	BCLR.B	LATB, #6
;MyProject.c,63 :: 		LATB.F7 = 0;
	BCLR.B	LATB, #7
;MyProject.c,64 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,65 :: 		while(PORTB.F15 != 1){
L_kalibracija13:
	BTSC	PORTB, #15
	GOTO	L_kalibracija14
;MyProject.c,66 :: 		LATB.F13 = lookup[i][0];
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
;MyProject.c,67 :: 		LATB.F12 = lookup[i][1];
	ADD	W2, #2, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #12
	BTSC	W0, #0
	BSET	LATB, #12
;MyProject.c,68 :: 		LATB.F11 = lookup[i][2];
	ADD	W2, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #11
	BTSC	W0, #0
	BSET	LATB, #11
;MyProject.c,69 :: 		LATB.F10 = lookup[i][3];
	ADD	W2, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 50
	MOV	[W1], W0
	BTSS	W0, #0
	BCLR	LATB, #10
	BTSC	W0, #0
	BSET	LATB, #10
;MyProject.c,70 :: 		Delay_us(1500);
	MOV	#2000, W7
L_kalibracija15:
	DEC	W7
	BRA NZ	L_kalibracija15
;MyProject.c,71 :: 		i--;
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	SUBR	W1, [W0], [W0]
;MyProject.c,72 :: 		if (i < 0)
	MOV	_i, W0
	CP	W0, #0
	BRA LT	L__kalibracija60
	GOTO	L_kalibracija17
L__kalibracija60:
;MyProject.c,73 :: 		i = 7;
	MOV	#7, W0
	MOV	W0, _i
L_kalibracija17:
;MyProject.c,74 :: 		}
	GOTO	L_kalibracija13
L_kalibracija14:
;MyProject.c,75 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,76 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,77 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,78 :: 		rotiraj(3000, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#3000, W10
	CALL	MyProject_rotiraj
;MyProject.c,79 :: 		}
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

;MyProject.c,81 :: 		void main() {
;MyProject.c,84 :: 		OSCDIVbits.DIV = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	OSCDIVbits, W1
	MOV	#32768, W0
	AND	W1, W0, W0
	MOV	WREG, OSCDIVbits
;MyProject.c,87 :: 		ANSA = 0;
	CLR	ANSA
;MyProject.c,88 :: 		ANSB = 0;
	CLR	ANSB
;MyProject.c,90 :: 		TRISB = 0b0000010000000001;
	MOV	#1025, W0
	MOV	WREG, TRISB
;MyProject.c,91 :: 		TRISA = 0b00000;
	CLR	TRISA
;MyProject.c,93 :: 		ODCA = 0;
	CLR	ODCA
;MyProject.c,94 :: 		ODCB = 0;
	CLR	ODCB
;MyProject.c,96 :: 		LATA = 0;
	CLR	LATA
;MyProject.c,97 :: 		LATB = 0;
	CLR	LATB
;MyProject.c,103 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;MyProject.c,104 :: 		PPS_Mapping_NoLock(3, _INPUT, _U1RX);
	MOV.B	#19, W12
	MOV.B	#1, W11
	MOV.B	#3, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,105 :: 		PPS_Mapping_NoLock(2, _OUTPUT, _U1TX);
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#2, W10
	CALL	_PPS_Mapping_NoLock
;MyProject.c,106 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;MyProject.c,108 :: 		IEC0bits.U1RXIE = 1; // Omogucavanje RX prekida
	BSET	IEC0bits, #11
;MyProject.c,109 :: 		IFS0bits.U1RXIF = 0;
	BCLR	IFS0bits, #11
;MyProject.c,112 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;MyProject.c,114 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main18:
	DEC	W7
	BRA NZ	L_main18
	DEC	W8
	BRA NZ	L_main18
;MyProject.c,115 :: 		UART1_Write_Text("OK");
	MOV	#lo_addr(?lstr1_MyProject), W10
	CALL	_UART1_Write_Text
;MyProject.c,118 :: 		kalibracija();
	CALL	_kalibracija
;MyProject.c,119 :: 		LATB.F6 = 1;
	BSET.B	LATB, #6
;MyProject.c,120 :: 		LATB.F7 = 1;
	BSET.B	LATB, #7
;MyProject.c,121 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;MyProject.c,122 :: 		Delay_ms(100);
	MOV	#3, W8
	MOV	#2261, W7
L_main20:
	DEC	W7
	BRA NZ	L_main20
	DEC	W8
	BRA NZ	L_main20
;MyProject.c,123 :: 		while(1) {
L_main22:
;MyProject.c,124 :: 		if(flag == 1){
	MOV	_flag, W0
	CP	W0, #1
	BRA Z	L__main62
	GOTO	L_main24
L__main62:
;MyProject.c,125 :: 		flag = 0;
	CLR	W0
	MOV	W0, _flag
;MyProject.c,127 :: 		if(strcmp("L1_A",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr2_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main63
	GOTO	L_main25
L__main63:
;MyProject.c,128 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,129 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,130 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,131 :: 		rotiraj(11, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,132 :: 		}
	GOTO	L_main26
L_main25:
;MyProject.c,133 :: 		else if(strcmp("L1_D",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr3_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main64
	GOTO	L_main27
L__main64:
;MyProject.c,134 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,135 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,136 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,137 :: 		rotiraj(11, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,138 :: 		}
	GOTO	L_main28
L_main27:
;MyProject.c,139 :: 		else if(strcmp("L2_J",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr4_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main65
	GOTO	L_main29
L__main65:
;MyProject.c,140 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,141 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,142 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,143 :: 		rotiraj(11, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,144 :: 		}
	GOTO	L_main30
L_main29:
;MyProject.c,145 :: 		else if(strcmp("L2_L",out)==0){
	MOV	#lo_addr(_out), W11
	MOV	#lo_addr(?lstr5_MyProject), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main66
	GOTO	L_main31
L__main66:
;MyProject.c,146 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,147 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,148 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,149 :: 		rotiraj(11, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#11, W10
	CALL	MyProject_rotiraj
;MyProject.c,150 :: 		}
	GOTO	L_main32
L_main31:
;MyProject.c,151 :: 		else if(out[0] == 'O' && out[1] == 'L'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main67
	GOTO	L__main49
L__main67:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#76, W0
	CP.B	W1, W0
	BRA Z	L__main68
	GOTO	L__main48
L__main68:
L__main47:
;MyProject.c,152 :: 		korak1 = atoi(out+2);
	MOV	#lo_addr(_out+2), W10
	CALL	_atoi
	MOV	W0, _korak1
;MyProject.c,153 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,154 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W2
	MOV.B	#1, W1
	MOV.B	W1, [W2]
;MyProject.c,155 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W2
	CLR	W1
	MOV.B	W1, [W2]
;MyProject.c,156 :: 		rotiraj(korak1, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,157 :: 		}
	GOTO	L_main36
;MyProject.c,151 :: 		else if(out[0] == 'O' && out[1] == 'L'){
L__main49:
L__main48:
;MyProject.c,158 :: 		else if(out[0] == 'O' && out[1] == 'D'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#79, W0
	CP.B	W1, W0
	BRA Z	L__main69
	GOTO	L__main51
L__main69:
	MOV	#lo_addr(_out+1), W0
	MOV.B	[W0], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA Z	L__main70
	GOTO	L__main50
L__main70:
L__main46:
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
;MyProject.c,163 :: 		rotiraj(korak1, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	W0, W10
	CALL	MyProject_rotiraj
;MyProject.c,164 :: 		}
	GOTO	L_main40
;MyProject.c,158 :: 		else if(out[0] == 'O' && out[1] == 'D'){
L__main51:
L__main50:
;MyProject.c,165 :: 		else if(out[0] == 'N'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#78, W0
	CP.B	W1, W0
	BRA Z	L__main71
	GOTO	L_main41
L__main71:
;MyProject.c,166 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,167 :: 		step_code[1] = 1;
	MOV	#lo_addr(_step_code+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,168 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,169 :: 		rotiraj(5690, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#5690, W10
	CALL	MyProject_rotiraj
;MyProject.c,170 :: 		}
	GOTO	L_main42
L_main41:
;MyProject.c,171 :: 		else if(out[0] == 'I'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#73, W0
	CP.B	W1, W0
	BRA Z	L__main72
	GOTO	L_main43
L__main72:
;MyProject.c,172 :: 		step_code[0] = 0;
	MOV	#lo_addr(_step_code), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,173 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,174 :: 		step_code[2] = 1;
	MOV	#lo_addr(_step_code+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,175 :: 		rotiraj(2000, step_code, 1);
	MOV	#1, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2000, W10
	CALL	MyProject_rotiraj
;MyProject.c,176 :: 		rotiraj(2000, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#2000, W10
	CALL	MyProject_rotiraj
;MyProject.c,177 :: 		}
	GOTO	L_main44
L_main43:
;MyProject.c,178 :: 		else if(out[0] == 'B'){
	MOV	#lo_addr(_out), W0
	MOV.B	[W0], W1
	MOV.B	#66, W0
	CP.B	W1, W0
	BRA Z	L__main73
	GOTO	L_main45
L__main73:
;MyProject.c,179 :: 		step_code[0] = 1;
	MOV	#lo_addr(_step_code), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;MyProject.c,180 :: 		step_code[1] = 0;
	MOV	#lo_addr(_step_code+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,181 :: 		step_code[2] = 0;
	MOV	#lo_addr(_step_code+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;MyProject.c,182 :: 		rotiraj(285, step_code, -1);
	MOV	#65535, W12
	MOV	#lo_addr(_step_code), W11
	MOV	#285, W10
	CALL	MyProject_rotiraj
;MyProject.c,183 :: 		}
L_main45:
L_main44:
L_main42:
L_main40:
L_main36:
L_main32:
L_main30:
L_main28:
L_main26:
;MyProject.c,184 :: 		memset(out, 0, sizeof(out));
	MOV	#100, W12
	CLR	W11
	MOV	#lo_addr(_out), W10
	CALL	_memset
;MyProject.c,185 :: 		}
L_main24:
;MyProject.c,186 :: 		}
	GOTO	L_main22
;MyProject.c,187 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
