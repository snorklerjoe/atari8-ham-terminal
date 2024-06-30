/* Basic interrupts
 * 
 * This includes vbi's, RESET/keypress, & timer stuff.
 * DLI stuff is in dlist.h
 */

#ifndef _interrupts_h
#define _interrupts_h

#include <atari.h>

// Gets ready to have interrupts.
void interrupts_init(void);

// Sets the deferred vbi routine.
void set_def_vbi_routine(void (*vbi_routine)(void));

// Routine to run on START keypress
void set_start_routine(void (*routine)(void));
// Routine to run on SELECT keypress
void set_select_routine(void (*routine)(void));
// Routine to run on OPTION keypress
void set_option_routine(void (*routine)(void));

void set_timer2_vector(void (*routine)(void));
void set_timer2_val(unsigned int val);

#endif
