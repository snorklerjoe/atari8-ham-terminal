; Main program.

.include "utils.s"

.export _main
.import TERMINIT, TERMCLOSE, PRINT, GETCH, PUTCH
.importzp BUFPTR

MSG:  .byte "Hello World!",$9B

_CIO_TEST:
    ; Init
    jsr TERMINIT

    ; Print
    staddr MSG,BUFPTR
    jsr PRINT

loop:
    ; Wait for char
    jsr GETCH
    ; write it
    jsr PUTCH
    cmp #$9B
    bne loop

    staddr MSG,BUFPTR
    jsr PRINT

    ; Close
    jsr TERMCLOSE

    rts

_main:
    jsr _CIO_TEST
    rts


