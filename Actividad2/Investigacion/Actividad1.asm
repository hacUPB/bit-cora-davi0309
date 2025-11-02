(WAITD)
	@KBD
	D=M
	@100
	D=D-A
	@CLEAR
	D;JEQ
	
	

   




	

	@WAITD
	0;JMP

    (CLEAR)
	@278
    D=A
    @R0
    M=D // contador = 278
    @count
    M=D

    @SCREEN
    D=A
    @R1
    M=D
    D=M
    @j
    M=D // j = SCREEN

	(LOOP)
    @count
    D=M
    @WAITD
    D;JEQ

    @j
    A=M
    M=1
    
    @30
    D=A

    @j
    M=D+M //le sumo a la posicion donde van los del arreglo
    @count
    M=M-1 //Le resto a la cantidad de celdas qeu necesito llenar
    
    @LOOP
    0;JMP
	@WAITD
	0;JMP
    
	
