; Utilities & Macros

; Macro to take location (addr) and put at (pointer)
; Only uses the A register
.macro staddr addr,pointer
    lda #<addr
    sta pointer
    lda #>addr
    sta pointer+1
.endmacro

