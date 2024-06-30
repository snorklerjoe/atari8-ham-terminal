#include "interrupts.h"

// User-def'd deferred subroutine
void (*_user_def_sub)(void);

// User-def'd deferred console buttons subroutines
void (*_on_start)(void);
void (*_on_select)(void);
void (*_on_option)(void);

unsigned char _buf;


// Actually installed deferred vbi routine
void _vbi_routine(void) {

    // Just to be safe, save registers
    asm("PHA");
    asm("TXA");
    asm("PHA");
    asm("TYA");
    asm("PHA");

    // Run the installed routine, if any
    if((unsigned char)_user_def_sub != 0xFF) {
        _user_def_sub();
    }


    // Check function keys
    if( CONSOL_OPTION(GTIA_READ.consol) &&
        (unsigned char)_on_option != 0xFF
    ) {
        _on_option();
    }
    if( CONSOL_START(GTIA_READ.consol) &&
        (unsigned char)_on_start != 0xFF) {
        _on_start();
    }
    if( CONSOL_SELECT(GTIA_READ.consol) &&
        (unsigned char)_on_select != 0xFF
    ) {
        _on_select();
    }
    

    // Restore registers
    asm("PLA");
    asm("TAY");
    asm("PLA");
    asm("TAX");
    asm("PLA");
    

    // Jump to the os cleaner-upper
    asm("jmp $E462");
}


void interrupts_init(void) {
    set_def_vbi_routine((void*())0xFFFF);
    set_start_routine((void*())0xFFFF);
    set_select_routine((void*())0xFFFF);
    set_option_routine((void*())0xFFFF);

    // Call os routine setvbv
    asm("lda #$07");
    asm("ldx #>%v", _vbi_routine);
    asm("ldy #<%v", _vbi_routine);
    asm("jsr $E45C");
}

// Sets the deferred vbi routine.
void set_def_vbi_routine(void (*vbi_routine)(void)) {
    _user_def_sub = vbi_routine;
}

// Routine to run on START keypress
void set_start_routine(void (*routine)(void)) {
    _on_start = routine;
}

// Routine to run on SELECT keypress
void set_select_routine(void (*routine)(void)) {
    _on_select = routine;
}

// Routine to run on OPTION keypress
void set_option_routine(void (*routine)(void)) {
    _on_option = routine;
}


void set_timer2_vector(void (*routine)(void)) {
    OS.cdtmv2 = 0xFFFF;
    OS.cdtma2 = routine;
}

void set_timer2_val(unsigned int val) {
    OS.cdtmv2 = val;
}
