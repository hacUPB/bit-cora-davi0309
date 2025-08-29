

//Conversión a asembler
@16384 
D=A 
@16 
M=D
@24576
D=M
@19
D;JNE
@16
D=M
@16384
D=D-A
@4 
D;JLE 
@16 
AM=M-1 
M=0 
@4 
0;JMP 
@16 
D=M 
@24576 
D=D-A 
@4 
D;JGE 
@16 
A=M 
M=-1 
@16 
M=M+1 
@4 
0;JMP 

//La traducción que le hicimos al binario para pasarlo al asm detecta si alguna tecla del teclado está siendo presionada y sostenida. Cuando esto pasa comienza a dibujar líneas negras en la pantalla, simulando un efecto de relleno. Cuando se deja de presionar la tecla, la línea se retrae o borra hacia atrás y en la RAM en la posicion 24576 se muestra que numero esta atribuido a cada tecla que presionamos.
