/* Main.c file generated by New Project wizard
 *
 * Created:   8 oct. 2014 by Josep Fernandez
 * Processor: PIC18F4550
 * Compiler:  MPLAB XC8
 */

#include <xc.h>
#define _XTAL_FREQ 8000000  

#include <string.h>
#include "config.h"
#include "GLCD.h"
#include "Picasso.h"

const char * s1 = "S N A K E\n";
const char * s2 = "M A R T I A N\n";

void writeTxt(byte page, byte y, char * s) {
   int i = 0;
   while (*s != '\n') { 
      putch(page, y+i, *(s++));
      i++;
   };
}	

void Snake(void) {
   writeTxt(0, 8, s1);
}

void bartSimpson(void) {
   for(int i = 0; i < 8; ++i) {
      for(int j = 0; j < 128; ++j) {
		writeByte(i, j, bitmap[i * 128 + j]);
      }
   }
}

void fantasmito(void) {
   for (int i = 122; i >= 0; i -= 5) {
       putch(0,i/5, 'A');
   }
}

void main(void) {
   PORTD = 0; 		   //Donem uns valors inicials als ports
   PORTB = 0;  
   TRISD = 0x00;		   //Configurem D i B de sortida
   TRISB = 0x00;
    
   GLCDinit();		   //Inicialitzem la pantalla
   clearGLCD(0,7,0,127);      //Borrem pantalla
   setStartLine(0);           //Definim inici

   //Saluda();
	bartSimpson();
   while (1);
}
