//Punto1 Carga en D el valor 1978.
@1978
D=A
//Punto2 Guarda en la posición 100 de la RAM el número 69.
@69
D=A
@100
M=D
//Punto3 Guarda en la posición 200 de la RAM el contenido de la posición 24 de la RAM
@30
D=A
@24
M=D
D=M

@200
M=D
//Punto4 Lee lo que hay en la posición 100 de la RAM, resta 15 y guarda el resultado en la posición 100 de la RAM.
@100
M=A
@15
D=A

@100
M=M-D

//Punto5 Suma el contenido de la posición 0 de la RAM, el contenido de la posición 1 de la RAM y con la constante 69.
// Guarda el resultado en la posición 2 de la RAM.
@0
M=1
D=M
@1
M=1
D=D+M
@69
D=D+A
@2
M=D

//Punto6 Si el valor almacenado en D es igual a 0 salta a la posición 100 de la ROM.
@100
D;JEQ

//Punto7 Si el valor almacenado en la posición 100 de la RAM es menor a 100 salta a la posición 20 de la ROM.
@100
D=A
D=D-M

@20
D;JGT

