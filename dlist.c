#include "dlist.h"

unsigned char display_list[32] = {
    0x70, 0x42, 0x40, 0x9c, 0xf0, 0xf0, 0xa2, 0xa2, 0xa2, 0xa2,
    0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2,
    0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0xa2, 0x41,
    0x20, 0x9c
};

void dli_routine(void) {
    asm("pha");

    __asm__("lda #%b", COLOR_BLACK);  // Color
    asm("sta $D40A");  // WSYNC

    asm("sta $D01A");  // COLBK

    asm("pla");
    asm("rti");
}

// Specify the address to which the display list should be copied
void install_dl(unsigned char *dl_addr) {
    memcpy(dl_addr, &display_list, sizeof(display_list));
    OS.sdlst = 	dl_addr;
    OS.vdslst = &dli_routine;
    ANTIC.nmien = (NMIEN_DLI | NMIEN_VBI);
}
