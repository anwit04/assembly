ORG 0000H

MOV R0, #30H        ; R0 ? start address of numbers
MOV R1, #0AH        ; Counter = 10 numbers
MOV A, @R0          ; Load first number into A
INC R0
DEC R1

NEXT:
    MOV B, @R0       ; Load next number into B
    CLR C             ; Clear carry before subtraction
    SUBB A, B         ; A = A - B
    JC BIGGER         ; If carry = 1 ? A < B, so B is bigger
    SJMP SKIP

BIGGER:
    MOV A, B          ; Store bigger number into A

SKIP:
    INC R0
    DJNZ R1, NEXT

MOV 40H, A            ; Store biggest number in 40H

HERE: SJMP HERE        ; Infinite loop

END
