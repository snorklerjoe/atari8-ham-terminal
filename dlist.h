#ifndef _dlist_h
#define _dlist_h

#include <atari.h>
#include <string.h>
#include <conio.h>


unsigned char display_list[];

// The actual dli routine
void dli_routine(void);

// Installs the dl and dli vector
// Specify the address to which the display list should be copied
void install_dl(unsigned char *dl_addr);

#endif
