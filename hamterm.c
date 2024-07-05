/* A multi-featured terminal program for amateur radio.
 */

#include <atari.h>

#include "dlist.h"
#include "interrupts.h"
#include "cio.h"


#define DISPLAYLISTMEM       0x5000

// Buffer variables
int i;
unsigned char x,y;
unsigned char buf[64];


// Uptime & UTC (once time setting is implemented) time
unsigned long int uptime_sec;
unsigned char hr,min,sec;

// Routine that runs roughly every second
void on_sec(void) {
    // Get set to run again in another second:
    set_timer2_val(60);

    // Alternate cursor:
    OS.crsinh = 0xFF ^ OS.crsinh;

    // Draw current time & update uptime:
    uptime_sec = (OS.rtclok[0] * 65536 + OS.rtclok[1] * 256 + OS.rtclok[2])/60;

    sec = uptime_sec % 60;
    min = uptime_sec / 60;
    hr = uptime_sec / 3600;

//    x = wherex();
//    y = wherey();
//    gotoxy(0,0);

//    cprintf("Time %02d:%02d:%02d", hr, min, sec);
//
//    gotoxy(x,y);
}

void vbi_routine(void) {
}

void on_start(void) {
    _setcolor(4, HUE_GREY, 0);
}
void on_option(void) {
    _setcolor(4, HUE_GREY, 6);
}

void setup(void) {
    install_dl((void*)DISPLAYLISTMEM);

    _setcolor(1, HUE_BLUEGREEN, 15);
    _setcolor(2, HUE_GREY, 0);
    _setcolor(4, HUE_GOLD, 0);

    interrupts_init();

//    set_def_vbi_routine(&vbi_routine);
    set_start_routine(&on_start);
    set_option_routine(&on_option);

    set_timer2_vector(&on_sec);
    set_timer2_val(1);
}

void main() {
//    setup();

    __asm__("jsr _CIO_TEST");

//    OS.crsinh = 0x00;
/*
    strcpy(buf, "E:\n");


    // OPEN E: FOR WRITING
    OS.iocb[2].command = IOCB_OPEN;
    OS.iocb[2].buflen = 12;
    OS.iocb[2].buffer = &buf;
    OS.iocb[2].aux1 = 0x08;  // Open for writing
    OS.iocb[2].aux2 = 0x00;
    asm("ldx #$20");
    asm("jsr $E456");  // CIOV

    // PUTCHAR
    OS.iocb[2].command = IOCB_PUTCHR;
    OS.iocb[2].buffer = &buf;
    asm("ldx #$20");
    asm("jsr $E456");  // CIOV
*/



    for(;;){
        //cputc(cgetc());
    }
}
