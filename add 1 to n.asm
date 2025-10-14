ORG 0000H

; Step 1: Store value of n in memory location 20H
MOV A, #10         ; Let's add numbers from 1 to 10
MOV 20H, A         ; Store n = 10 in 20H

; Step 2: Initialize registers
MOV R0, 20H        ; R0 = loop counter (n)
MOV R1, #1         ; R1 = current number to add (starts at 1)
MOV R2, #0         ; R2 = sum accumulator (result)

LOOP:
MOV A, R2          ; A = current sum
ADD A, R1          ; A = A + current number
MOV R2, A          ; update sum in R2

INC R1             ; next number: R1 = R1 + 1
DJNZ R0, LOOP      ; decrement counter, loop if not zero

; Step 3: Store final result in 70H
MOV 70H, R2

; End program with infinite loop
HERE: SJMP HERE

END
