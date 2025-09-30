; 8051 program to find the biggest number between two values
; stored in memory locations 30H and 31H
; Result is stored in 32H

        ORG 0000H

        MOV 30H, #55H      ; First number
        MOV 31H, #3AH      ; Second number

        MOV A, 30H         ; Move first number into A
        CJNE A, 31H, COMPARE ; Compare with second number

  
IF_EQUAL:        
         MOV 32H, A         ; Store either in 32H
         SJMP END;

COMPARE:
        JC BIGGER   ; If A < second number, carry is set

        ; A (30H) is bigger
        MOV 32H, 30H
        SJMP END

BIGGER:
        MOV 32H, 31H       ; Second number is bigger
        SJMP END;
END:    
        SJMP END           ; Infinite loop to end program
