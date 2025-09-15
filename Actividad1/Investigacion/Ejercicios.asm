//RAM[200] = 250
@250
D=A
@200
M=D

@200
D=M
@100
M=D

//RAM[3] = 250

@250
D=A
@3
M=D
//RAM[3] = RAM[3] - 15
@15
D=A
@3
M=M-D

//RAM[2] = RAM[1] + RAM[0] + 17

@43
D=A
@0
M=D

@30
D=A
@1
M=D

@0
D=M
@1
D=D+M
@17
D=D+A
@2
M=D