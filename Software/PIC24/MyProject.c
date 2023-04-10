const int lookup[8][4] = {{1, 0, 0, 0}, {1, 1, 0, 0}, {0, 1, 0, 0}, {0, 1, 1, 0}, {0, 0, 1, 0}, {0, 0, 1, 1}, {0, 0, 0, 1}, {1, 0, 0, 1}};
//const int lookup[4][4] = {{0, 1, 1, 1}, {1, 0, 1, 1}, {1, 1, 0, 1}, {1, 1, 1, 0}};
char uart_ch;
int uart_data = 0;
int lookup_inx = 0, flag = 0;
//int left_right = 1;
int m = 0;
int i = 0;
char step_code[3] = {1, 1, 1};
int korak1 = 0;
char out[100] = "";

static inline void rotiraj(int korak, char s[], int left_right){ // left_right = 1 - lijevo, left_right = -1 - desno
     LATB.F6 = s[2];
     LATB.F7 = s[1];
     LATB.F8 = s[0];
     while(korak != 0){
         LATB.F13 = lookup[i][0];
         LATB.F12 = lookup[i][1];
         LATB.F11 = lookup[i][2];
         LATB.F10 = lookup[i][3];
         Delay_us(2000);
         korak--;
         i+= left_right;
         if (i >= 8)
            i = 0;
         if (i < 0)
            i = 7;
     }
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
      LATB.F13 = lookup[i][0];
      LATB.F12 = lookup[i][1];
      LATB.F11 = lookup[i][2];
      LATB.F10 = lookup[i][3];
      Delay_us(2000);
      i--;
      if (i < 0)
        i = 7;
   }
   LATB.F6 = 0;
   LATB.F7 = 0;
   LATB.F8 = 1;
   while(PORTB.F15 != 1){
      LATB.F13 = lookup[i][0];
      LATB.F12 = lookup[i][1];
      LATB.F11 = lookup[i][2];
      LATB.F10 = lookup[i][3];
      Delay_us(1500);
      i--;
      if (i < 0)
        i = 7;
   }
   step_code[0] = 1;
   step_code[1] = 0;
   step_code[2] = 0;
   rotiraj(3000, step_code, 1);
}

void main() {
  /*OSCCONbits.COSC = 2;
  OSCCONbits.NOSC = 2;   */
  OSCDIVbits.DIV = 0;

  //AD1PCFGL = 0xFFFF;
  ANSA = 0;
  ANSB = 0;

  TRISB = 0b0000010000000001;
  TRISA = 0b00000;
  
  ODCA = 0;
  ODCB = 0;
  
  LATA = 0;
  LATB = 0;
/*TRISA.F2 = 1;
  TRISB.F3 = 1;*/
  /*RPINR18bits.U1RXR = 3;
  RPOR1bits.RP2R = 3;*/

  Unlock_IOLOCK();
  PPS_Mapping_NoLock(3, _INPUT, _U1RX);
  PPS_Mapping_NoLock(2, _OUTPUT, _U1TX);
  Lock_IOLOCK();

  IEC0bits.U1RXIE = 1; // Omogucavanje RX prekida
  IFS0bits.U1RXIF = 0;
/*PMD1.U1MD = 0;
  U1MODE.UARTEN = 1;*/
  UART1_Init(9600);
  //UART1_Init_Advanced(9600, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT, _UART_HI_SPEED);
  Delay_ms(100);
  UART1_Write_Text("OK");
  /*UART1_Write('\n');
  UART1_Write('\r');*/
  kalibracija();
  LATB.F6 = 1;
  LATB.F7 = 1;
  LATB.F8 = 1;
  Delay_ms(100);
  while(1) {
     if(flag == 1){
        flag = 0;
        //UART1_Write_Text(out);
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
        }
        else if(out[0] == 'O' && out[1] == 'D'){
           korak1 = atoi(out+2);
           step_code[0] = 0;
           step_code[1] = 1;
           step_code[2] = 0;
           rotiraj(korak1, step_code, -1);
        }
        else if(out[0] == 'N'){
           step_code[0] = 1;
           step_code[1] = 1;
           step_code[2] = 0;
           rotiraj(5690, step_code, 1);
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