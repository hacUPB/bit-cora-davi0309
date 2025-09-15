@sum
M=0
@i
M=1
D=M

(WHILE)
@i
D=M
@100
D=D-A

@END
D;JGT

@i
D=M
@sum
M=D+M
@i
M=M+1
@WHILE
0;JMP

(END)
@END
0;JMP