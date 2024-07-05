;
; Some basic CIO routines
;

.include "atari.inc"
.export _CIO_TEST, _main


; Zero-page equates
BUFPTRL = $CB
BUFPTRH = $CC


; Opens IOCB#X ($10, $20, etc) with aux1 in A
; With device name buffer ptr in BUFPTR
CIO_OPEN:
    ; Aux byte
    sta ICAX1, X
    ; Command
    lda #OPEN
    sta ICCOM, X
    ; Buffer
    lda BUFPTRL
    sta ICBAL, X
    lda BUFPTRH
    sta ICBAH, X

    lda #$FF
    sta ICBLL, X
    sta ICBLH, X

    ; CIO Call
    jsr CIOV

    ; TODO: Error handling

    rts

; Closes IOCB#X ($10, $20, etc)
CIO_CLOSE:
    ; Command
    lda #CLOSE
    sta ICCOM, X

    ; CIO Call
    jsr CIOV

    ; TODO: Error handling

    rts


; Reads buf from channel in x for a bytes
CIO_READ:
    ; Buflen
    sta ICBLL, X
    lda #0
    sta ICBLH, X

    ; Command
    lda #GETREC
    sta ICCOM, X
    ; Buffer
    lda BUFPTRL
    sta ICBAL, X
    lda BUFPTRH
    sta ICBAH, X

    ; CIO Call
    jsr CIOV

    ; TODO: Error handling

    rts

; Writes buf to channel in x
CIO_WRITE:
    ; Command
    lda #PUTREC
    sta ICCOM, X
    ; Buffer
    lda BUFPTRL
    sta ICBAL, X
    lda BUFPTRH
    sta ICBAH, X

    lda #$FF
    sta ICBLL, X
    sta ICBLH, X

    ; CIO Call
    jsr CIOV

    ; TODO: Error handling

    rts

EDEV: .byte "E:",$9B
MSG:  .byte "Hello World!",$9B

_CIO_TEST:
    ; Open E:
    lda #<EDEV
    sta BUFPTRL
    lda #>EDEV
    sta BUFPTRH

    lda #OPNOT
    ldx #$20
    jsr CIO_OPEN

    ; Write to E:
    lda #<MSG
    sta BUFPTRL
    lda #>MSG
    sta BUFPTRH

    ldx #$20
    jsr CIO_WRITE

    ; Close E:
    ldx #$20
    jsr CIO_CLOSE

    rts

_main:
    jsr _CIO_TEST
    rts
