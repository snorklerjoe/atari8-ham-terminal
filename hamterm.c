/* A multi-featured terminal program for amateur radio.
 */

#include <atari.h>
#include <conio.h>

#include "dlist.h"


#define DISPLAYLISTMEM       0x5000

int i;

extern void fillscreen_static(void);

void main() {

    // Install custom display list
    install_dl((void*)DISPLAYLISTMEM);

    _setcolor(1, HUE_BLUEGREEN, 15);
    _setcolor(2, HUE_GREY, 0);
    _setcolor(4, HUE_GOLD, 0);


    for(;;){
        cputc(cgetc());
    }
}
