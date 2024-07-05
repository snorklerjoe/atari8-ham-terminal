; Main program.

.include "utils.s"

.export _main
.import TERMINIT, TERMCLOSE, PRINT
.importzp BUFPTR

MSG:  .byte "Hello World!",$9B

_CIO_TEST:
    ; Open E:
    jsr TERMINIT

    ; Write to E:
    staddr MSG,BUFPTR
    jsr PRINT
    jsr PRINT

    ; Close E:
    jsr TERMCLOSE

    rts

_main:
    jsr _CIO_TEST
    rts


