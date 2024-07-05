; Screen i/o
.include "atari.inc"
.include "utils.s"

.export TERMINIT, TERMCLOSE, PRINT, PUTCH, GETCH, CHRAVAIL
.import CIO_OPEN, CIO_CLOSE, CIO_WRITE, CIO_GET, CIO_PUT
.importzp BUFPTR

; If using IOCB0, it could break other things that expect that to be E:
SCR_IOCB = $10
KEY_IOCB = $20

SDEV: .byte "E:",$9B
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

_CHRBUF: .byte $00, $9B

; Gets char from kbd into A
GETCH:
    ldx #KEY_IOCB
    lda #$FF
    sta CH
    staddr _CHRBUF,BUFPTR
    lda #01
    jsr CIO_GET
    lda _CHRBUF
    rts


; Sets carry flag if a character is available to be read, else clears it.
CHRAVAIL:
    clc
    ldx CH
    inx
    rts


; Puts char from A to screen
PUTCH:
    sta _CHRBUF
    ldx #SCR_IOCB
    staddr _CHRBUF,BUFPTR
    lda #01
    jsr CIO_PUT
    rts
