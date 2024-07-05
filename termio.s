; Screen i/o
.include "atari.inc"
.include "utils.s"

.export TERMINIT, TERMCLOSE, PRINT
.import CIO_OPEN, CIO_CLOSE, CIO_WRITE, CIO_READ
.importzp BUFPTR

SCR_IOCB = $10
KEY_IOCB = $20

SDEV: .byte "S:",$9B
KDEV: .byte "K:",$9B

; Inits the screen & kbd and opens IOCB0
TERMINIT:
    ; SCREEN
    ; Close if previously opened...
    ldx #SCR_IOCB
    jsr CIO_CLOSE

    ; Open anew...
    staddr SDEV,BUFPTR
    lda #OPNOT
    jsr CIO_OPEN


    ; KEYBOARD
    ; Close if previously opened...
    ldx #KEY_IOCB
    jsr CIO_CLOSE

    ; Open anew...
    staddr KDEV,BUFPTR
    lda #OPNIN
    jsr CIO_OPEN
    rts

; Closes down the screen
TERMCLOSE:
    ; SCREEN
    ldx #SCR_IOCB
    jsr CIO_CLOSE

    ; KEYBOARD
    ldx #KEY_IOCB
    jsr CIO_CLOSE
    rts

; Prints to the screen 
; Call after a `staddr {buf} BUFPTR`
PRINT:
    ldx #SCR_IOCB
    jsr CIO_WRITE
    rts
