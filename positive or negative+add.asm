        ORG 0000H         ; Program start address

        ; Step 1: Store two numbers at 40h and 41h       ; First number (example: 0x25 = 37)
       
        ; Step 2: Load both numbers into registers
        MOV A, 40H        ; Load first number into A
        MOV R0, A         ; Move A to R0 (A = num1)

        MOV A, 41H        ; Load second number into A
        MOV R1, A         ; Move A to R1 (A = num2)

        ; Step 3: Subtract and determine sign
        CLR C             ; Clear carry before subtraction
        MOV A, R0         ; A = num1
        SUBB A, R1        ; A = num1 - num2 with borrow (signed behavior)

        JNC POSITIVE      ; If no borrow, result is positive

        NEGATIVE; result
        ; Take 2's complement of A to get magnitude
        CPL A             ; 1's complement
        ADD A, #01H       ; +1 = 2's complement
        MOV 50H, A        ; Store magnitude
        MOV 51H, #01H     ; Sign = 1 (negative)
        SJMP END

POSITIVE:
        ; Result is positive or zero
        MOV 50H, A        ; Store result directly
        MOV 51H, #00H     ; Sign = 0 (positive)

END:
        SJMP END          ; Infinite loop to end program

        END               ; End of program
