        ORG     0000H           ; Start of code

START:  MOV     A, 31H         ; Load HEX value (45 decimal)
        MOV     B, #0AH         ; Set B = 10 (for division)

        DIV     AB              ; A = A / 10 (tens), B = A % 10 (units)

        SWAP    A               ; Shift tens to high nibble
        ANL     A, #0F0H        ; Mask out any garbage in low nibble
        ORL     A, B            ; Add units to low nibble ? A = BCD

        MOV     36H, A           ; Output BCD result to Port 1

HERE:   SJMP    HERE            ; Infinite loop

        END
