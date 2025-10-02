@sum
M=0
@i
M=1

(FOR)
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
@FOR
0;JMP

(END)
@END
0;JMP