@R1 //R1=J
M=0
@R0 //R2 = sum
M=0



(LOOP)
@R1
D=M
@10
D=D-A
@END
D;JEQ //Si J es >= 0 termina
 //Como R1 es 0 llega a 16 sin sumarle nada
@R1
D=M
@16
A=D+A
D=M

@R0
M=D+M

@R1
M=M+1

@LOOP
0;JMP

(END)
@END
0;JMP