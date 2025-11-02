# Bitacora
# Reto 02

## Reto1. Escribe un programa en lenguaje ensamblador que sume los primeros 100 números naturales.

¿Cómo están implementadas las variables i y sum?
- La variable i sirve como un contador que se inicia en 1 y se cuenta hasta el numero 101 por que tenemos el condicional JGT y despues de cada ciclo se aumenta en 1, la variable sum se encarga de ir sumando los valores de i de 1 a 100 siendo este 1+2+3+4+5... i+1, de esta manera hasta llegar a 5050.

¿En qué direcciones de memoria están estas variables?

La variable `sum` esta en la posicion 16 por que es la primera que creamos y la vairable `i` esta en la posicion 17.

¿Cómo está implementado el ciclo while?

La manera en que yo lo hice fue que `i` comenzara en 1 y se vaya sumando hasta llegar a 100 dandole asi a mi ciclo una vuelta mas ya que use la condicion `JGT` que es `if D>0 jump` entonces en el momento en el que `i` llega a 100 salta hacia `(END)`  y el porgrama acaba, mientras esta en el ciclo while `sum` va a ir sumandole a su memoria el valor que tena `i` en esa vuelta del ciclo.

¿Cómo se implementa la variable i?

- La variable `i` es un contador que se va a aumentar en 1 dentro del ciclo hasta llegar a 100 y si es mayor a 0 se termina este ciclo.

¿En qué parte de la memoria se almacena la variable i?

- Se almacena en la parte de la memoria 17 de la `RAM`.

Después de todo lo que has hecho, ¿Qué es entonces una variable?

- Es un espacio reservado de memoria para guardar datos que se pueden utilizar para pocesos logicos.

¿Qué es la dirección de una variable?

- Es el numero o identificador reservado que indica donde se almacenan las variables es como la ubicacion donde se puede encontrar o modificar el valor guardado de la variable.

¿Qué es el contenido de una variable?

- Es ese valor o dato que esta almacenado en una direccion de memoria especifica.

## Reto2. Transforma el programa en alto nivel anterior para que utilice un ciclo for en vez de un ciclo while.

Lo que cambia entre `While` y `for` es que en el for sabemos exactamente el numero de iteraciones, en cambio en el while las iteraciones siguen corriendoce mientras cumpla con una condicion.

``` c#

int sum = 0;
for (int i = 0; i <= 100; i+=1){
   sum += i;
  
}
```
## Reto3. Escribe un programa en lenguaje ensamblador que implemente el programa anterior.

En los lenguajes de alto nivel se diferencia entre `while` y `for` por el tipo de sintaxis y nombres pero en ensamblador la verdad no cambia nada (creo yo), ya que como solo manejamos saltos condicionales y incondicionales como en este caso usando etiquetas.
``` 
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
```
## Reto4. EXPLICACIÓN

```C++
int var = 10;
int *punt;
punt = &var;
*punt = 20;
```
#### ¿Cómo se declara un puntero en C++?
```C++
int *punt;
```

punt es una variable que almacenará la dirección de memoria de otra variable que guarda enteros.

#### ¿Cómo se define un puntero en C++?
```C++
punt = &var;
```
Definir (o inicializar) el puntero es asignarle la dirección de una variable.
En este caso, `punt` contendrá la dirección de `var`

#### ¿Cómo se almacena en C++ la dirección de memoria de una variable?

Con el operador `&` (operador de dirección).

#### ¿Cómo se escribe el contenido de la variable a la que apunta un puntero?
Con el operador de desreferenciación `*`.

## Reto5. Traduce este programa a lenguaje ensamblador:
```C++
int var = 10;
int *punt;
punt = &var;
*punt = 20;
```
Para mi el ejercicio fue mas facil de lo que pensaba, ya que creia que tocaba hacer mas cosas pero cuando guarde la direccion de `@var` en el puntero ya todo cogio forma y se facilito un monton.

## Reto6. Ahora vas a usar un puntero para leer la posición de memoria a la que este apunta, es decir, vas a leer por medio del puntero la variable cuya dirección está almacenada en él.
```C++
int var = 10;
int bis = 5;
int *p_var;
p_var = &var;
bis = *p_var;
```
Un ejercicio algo aprecido al anterior pero muy util, ya que no solo estamos jugando con el puntero y una variable si no que usamos varias variables para entender como se hace el cambio de memoria entre una variable y otra.

## Reto7.Traduce este programa a lenguaje ensamblador:
```
@10
D=A
@var
M=D

@5
D=A
@bis
M=D

@var
D=A
@punt
M=D


@punt
A=M
D=M
@bis
M=D
```
Interesante ver el resultado en Nand2tetris ya que vemos como la variable `@punt` va guardando en su memoria la direccion de las otras variables.

## Reto8. Vas a parar un momento y tratarás de recodar de memoria lo siguiente. Luego verifica con un compañero o con el profesor:
¿Qué hace esto int `*pvar;`?

Aqui estamos creando el puntero.

¿Qué hace esto `pvar = var;`?

Guarda en el puntero lo que tenga la memoria de `var`.

¿Qué hace esto `var2 = *pvar`?

Guarda en la memoria de `vae2` lo que alla en la dirección en la que este apuntando el puntero.

¿Qué hace esto `pvar = &var3`?

Guarda en `pvar`la direccion de `var3`.
## Reto9. Considera que el punto de entrada del siguiente programa es la función main, es decir, el programa inicia llamando la función main. Vas a proponer una posible traducción a lenguaje ensamblador de la función suma, cómo llamar a suma y cómo regresar a std::cout << "El valor de c es: " << c << std::endl; una vez suma termine.
```C++
#include <iostream>

int suma(int a, int b) {
   int var = a + b;
   return var;
}


int main() {
   int c = suma(6, 9);
   std::cout << "El valor de c es: " << c << std::endl;
   return 0;
}
```
Quice representar este ejercicio pidiendo lo de la suma a y b, y sumandolo y entregando el valor en c, pero al mostrar la suma la quice implementar en un ejercicio de antes, usando un DRAW para dibujar el resultado despues de que se realizo la suma.