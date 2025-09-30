ORG 0000H
AJMP MAIN;
ORG 0050H
MAIN: MOV R1,#40H;
      MOV R2,#0AH;
LOOP: MOV A,@R1;
      MOV R0,A;
AGAIN:CLR C;
      INC R1;
      MOV A,R0;
      SUBB A,@R1;
      DEC R2;
      MOV A,00H;
      SUBB A,R2;
      JZ FINISH;  
      JC AGAIN;
      SJMP LOOP;
FINISH:MOV 50H,R0;
END
      


      

      