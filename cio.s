;
; Some basic CIO helper routines
;

.include "atari.inc"
.export CIO_OPEN, CIO_CLOSE, CIO_WRITE, CIO_GET, CIO_PUT, CIO_ARBITRARY
.exportzp BUFPTR


; Zero-page equates
BUFPTRL = $CB
BUFPTRH = $CC
BUFPTR = $CB


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
CIO_GET:
    ; Buflen
    sta ICBLL, X
    lda #0
    sta ICBLH, X

    ; Command
    lda #GETCHR
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

; Writes A bytes of buf to channel in X
CIO_PUT:
    ; Buf len
    sta ICBLL, X
    lda #00
    sta ICBLH, X

    ; Command
    lda #PUTCHR
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

; Performs an arbitrary cio Call
; A is Command
; X, Y are aux 1 and 2
CIO_ARBITRARY:
    ; Command
    sta ICCOM, X
    ; Aux bytes
    txa
    sta ICAX1, X
    tya
    sta ICAX2, X

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
