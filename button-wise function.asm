ORG 0000H
SETB 0xA8   ; EA - Global interrupt enable (bit 7 of IE)
SETB 0x88   ; EX0 - External Interrupt 0 enable (bit 0 of IE)
SETB 0x8A   ; EX1 - External Interrupt 1 enable (bit 2 of IE)

ORG 0003H
ACALL BTN_1;
RETI;
ORG 0013H
ACALL BTN_2;
RETI;
ORG 0003H
BTN_1: MOV A, 40H        ; Load first number into A
        MOV R0, A         ; Move A to R0 (A = num1)

        MOV A, 41H        ; Load second number into A
        MOV R1, A         ; Move A to R1 (A = num2)

        ; Step 3: Subtract and determine sign
        CLR C             ; Clear carry before subtraction
        MOV A, R0         ; A = num1
        SUBB A, R1;
        MOV R1,45H; 
        RET;    
        
ORG 0013H
BTN_2:MOV A,50H;
      ADD A,51H;
      MOV 52H,A;
      MOV A,#00;
      ADDC A,#00;
      MOV 53H,A;
      RET;

      
END