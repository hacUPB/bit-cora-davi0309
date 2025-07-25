
@R0
D=M //direccion inicial
@j
M=D



//creamos un contador para el tamaño
@R1
D=M
@count
M=D  //cuantas celdas tengo que llenar

(LOOP)
@count
D=M
@END
D;JEQ

@j
A=M
M=-1

@j
M=M+1 //le sumo a la posicion donde van los del arreglo
@count
M=M-1 //Le resto a la cantidad de celdas qeu necesito llenar

@LOOP  //es aqui donde el bucle se repite
0;JMP

(END)
@END  // aqui se te lleva cuando no gay mas celdas por llenar
0;JMP