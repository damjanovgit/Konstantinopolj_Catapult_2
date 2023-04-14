#line 1 "C:/Users/Medion/Desktop/4.godina/7.semestar/Mikrokontrolerski sistemi/Konstantinopolj_Catapult_2/Software/PIC24/MyProject.c"
const int lookup[8][4] = {{1, 0, 0, 0}, {1, 1, 0, 0}, {0, 1, 0, 0}, {0, 1, 1, 0}, {0, 0, 1, 0}, {0, 0, 1, 1}, {0, 0, 0, 1}, {1, 0, 0, 1}};
int indexes[8] = {0, 0, 0, 0, 0, 0, 0, 0};
char uart_ch;
int uart_data = 0;
int lookup_inx = 0, flag = 0;

int m = 0;
int i = 0;
const int pauza = 1100;
char step_code[3] = {1, 1, 1};
int korak1 = 0;
char out[100] = "";

static inline void rotiraj(int korak, char s[], int left_right){
 i = 4*s[2] + 2*s[1] + s[0];
 LATB.F6 = s[2];
 LATB.F7 = s[1];
 LATB.F8 = s[0];
 while(korak != 0){
 LATB.F13 = lookup[indexes[i]][0];
 LATB.F12 = lookup[indexes[i]][1];
 LATB.F11 = lookup[indexes[i]][2];
 LATB.F10 = lookup[indexes[i]][3];
 Delay_us(pauza);
 korak--;
 indexes[i] += left_right;
 if (indexes[i] >= 8 && left_right == 1)
 indexes[i] = 0;
 if (indexes[i] < 0 && left_right == -1)
 indexes[i] = 7;
 }
 LATB.F13 = 0;
 LATB.F12 = 0;
 LATB.F11 = 0;
 LATB.F10 = 0;
 LATB.F6 = 1;
 LATB.F7 = 1;
 LATB.F8 = 1;
}

void uart_interrupt() iv IVT_ADDR_U1RXINTERRUPT ics ICS_AUTO {
 IFS0bits.U1RXIF = 0;
 uart_ch = UART1_Read();
 if(uart_ch == 'q'){
 m = 0;
 flag = 1;
 }
 else{
 out[m] = uart_ch;
 m++;
 }
}

void kalibracija(){
 LATB.F6 = 1;
 LATB.F7 = 0;
 LATB.F8 = 0;
 while(PORTB.F5 != 1){
 LATB.F13 = lookup[indexes[4]][0];
 LATB.F12 = lookup[indexes[4]][1];
 LATB.F11 = lookup[indexes[4]][2];
 LATB.F10 = lookup[indexes[4]][3];
 Delay_us(pauza);
 indexes[4]--;
 if (indexes[4] < 0)
 indexes[4] = 7;
 }
 LATB.F13 = 0;
 LATB.F12 = 0;
 LATB.F11 = 0;
 LATB.F10 = 0;
 LATB.F6 = 0;
 LATB.F7 = 0;
 LATB.F8 = 1;
 while(PORTB.F15 != 1){
 LATB.F13 = lookup[indexes[1]][0];
 LATB.F12 = lookup[indexes[1]][1];
 LATB.F11 = lookup[indexes[1]][2];
 LATB.F10 = lookup[indexes[1]][3];
 Delay_us(pauza);
 indexes[1]--;
 if (indexes[1] < 0)
 indexes[1] = 7;
 }
 LATB.F13 = 0;
 LATB.F12 = 0;
 LATB.F11 = 0;
 LATB.F10 = 0;
 step_code[0] = 1;
 step_code[1] = 0;
 step_code[2] = 0;
 rotiraj(3000, step_code, 1);
}

void main() {
#line 98 "C:/Users/Medion/Desktop/4.godina/7.semestar/Mikrokontrolerski sistemi/Konstantinopolj_Catapult_2/Software/PIC24/MyProject.c"
 OSCDIVbits.DIV = 0;


 ANSA = 0;
 ANSB = 0;

 TRISB = 0b0000010000000001;
 TRISA = 0b00000;

 ODCA = 0;
 ODCB = 0;

 LATA = 0;
 LATB = 0;
#line 117 "C:/Users/Medion/Desktop/4.godina/7.semestar/Mikrokontrolerski sistemi/Konstantinopolj_Catapult_2/Software/PIC24/MyProject.c"
 Unlock_IOLOCK();
 PPS_Mapping_NoLock(3, _INPUT, _U1RX);
 PPS_Mapping_NoLock(2, _OUTPUT, _U1TX);
 Lock_IOLOCK();

 IEC0bits.U1RXIE = 1;
 IFS0bits.U1RXIF = 0;
#line 126 "C:/Users/Medion/Desktop/4.godina/7.semestar/Mikrokontrolerski sistemi/Konstantinopolj_Catapult_2/Software/PIC24/MyProject.c"
 UART1_Init(9600);

 Delay_ms(100);
 UART1_Write_Text("OK");
#line 132 "C:/Users/Medion/Desktop/4.godina/7.semestar/Mikrokontrolerski sistemi/Konstantinopolj_Catapult_2/Software/PIC24/MyProject.c"
 kalibracija();
 LATB.F6 = 1;
 LATB.F7 = 1;
 LATB.F8 = 1;
 Delay_ms(100);
 while(1) {
 if(flag == 1){
 flag = 0;

 if(strcmp("L1_A",out)==0){
 step_code[0] = 0;
 step_code[1] = 0;
 step_code[2] = 0;
 rotiraj(11, step_code, 1);
 }
 else if(strcmp("L1_D",out)==0){
 step_code[0] = 0;
 step_code[1] = 0;
 step_code[2] = 0;
 rotiraj(11, step_code, -1);
 }
 else if(strcmp("L2_J",out)==0){
 step_code[0] = 1;
 step_code[1] = 0;
 step_code[2] = 1;
 rotiraj(11, step_code, 1);
 }
 else if(strcmp("L2_L",out)==0){
 step_code[0] = 1;
 step_code[1] = 0;
 step_code[2] = 1;
 rotiraj(11, step_code, -1);
 }
 else if(out[0] == 'O' && out[1] == 'L'){
 korak1 = atoi(out+2);
 step_code[0] = 0;
 step_code[1] = 1;
 step_code[2] = 0;
 rotiraj(korak1, step_code, 1);
 UART1_Write('1');
 }
 else if(out[0] == 'O' && out[1] == 'D'){
 korak1 = atoi(out+2);
 step_code[0] = 0;
 step_code[1] = 1;
 step_code[2] = 0;
 rotiraj(korak1, step_code, -1);
 UART1_Write('1');
 }
 else if(out[0] == 'N'){
 step_code[0] = 1;
 step_code[1] = 1;
 step_code[2] = 0;
 rotiraj(4552, step_code, 1);
 }
 else if(out[0] == 'I'){
 step_code[0] = 0;
 step_code[1] = 0;
 step_code[2] = 1;
 rotiraj(2000, step_code, 1);
 rotiraj(2000, step_code, -1);
 }
 else if(out[0] == 'B'){
 step_code[0] = 1;
 step_code[1] = 0;
 step_code[2] = 0;
 rotiraj(285, step_code, -1);
 }
 memset(out, 0, sizeof(out));
 }
 }
}
