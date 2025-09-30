        ORG     0000H           ; Start of program

START:  MOV     A, 31H        ; Load BCD value (e.g., 45 decimal)
        MOV     R0, A           ; Save original BCD

        ; --- Extract units digit ---
        ANL     A, #0FH         ; A = units (low nibble)
        MOV     R1, A           ; R1 = units

        ; --- Extract tens digit ---
        MOV     A, R0           ; Restore original BCD
        ANL     A, #0FH         ; Mask lower nibble
        SWAP    A               ; Move high nibble to low (tens digit)
        MOV     B, #0AH         ; B = 10
        MUL     AB              ; A = tens * 10

        ; --- Add units ---
        ADD     A, R1 
        MOV 36H,A          ; A = (tens * 10) + units

        ; --- Output to Port 1 for verification ---
        MOV     P1, A           ; Output result to Port 1

HERE:   SJMP    HERE            ; Infinite loop

        END
