# Actividad 01

## ¿Qué es un computador Digital Moderno?

Es un dispositivo electrónico diseñado para manipular información siguiendo instrucciones previamente definidas y guardadas en su memoria (ROM). Esta máquina es capaz de ejecutar múltiples tareas o programas utilizando el mismo conjunto de componentes físicos.

## ¿Cuales son sus partes?

La estructura principal está compuesta por la Unidad Central de Procesamiento (CPU), que actúa como el "centro de mando" del sistema. Dentro de ella se encuentra la Unidad Aritmético-Lógica (ALU), responsable de realizar tanto cálculos matemáticos (como sumas o multiplicaciones) como operaciones lógicas (AND, OR, NOT). También incluye registros internos como A y D, junto con el conjunto de instrucciones que puede ejecutar.

Por otro lado, tenemos las memorias RAM y ROM. La RAM permite leer y escribir datos temporales que pueden cambiar mientras el programa se está ejecutando, y su acceso se realiza por medio del registro A. En cambio, la ROM contiene las instrucciones fijas que el computador debe seguir, estas no se puede modificar durante la ejecución.

Además, los equipos cuentan con dispositivos de entrada (como teclado, mouse, sensores o micrófonos), que permiten alimentar el sistema con datos o comandos, osea inputs y dispositivos de salida (como pantallas, impresoras o altavoces) llamados en su defecto outputs, que muestran los resultados de la ejecución del programa.

# Actividad 2

## ¿Qué es entonces un programa?

Un programa es un conjunto de instrucciones almacenadas en la memoria del sistema. Aunque hoy en día se escriben principalmente en lenguajes de alto nivel, en sus inicios estos programas se codificaban directamente en lenguaje de máquina o en lenguaje ensamblador, ambos más cercanos al hardware. Un detalle importante es que los computadores pueden tratar esas instrucciones como datos, lo cual les da la capacidad de ejecutar cualquier tarea con el mismo hardware.

## ¿Qué es un lenguaje Ensamblador?

El lenguaje ensamblador es una forma simbólica y comprensible para humanos de representar instrucciones de máquina. Cada instrucción en ensamblador se relaciona directamente con una instrucción binaria que la CPU puede ejecutar. Para que estas instrucciones sean comprendidas por la máquina, se requiere un programa traductor llamado ensamblador.

## ¿Qué es lenguaje de máquina?

Es el código que el procesador puede ejecutar directamente, compuesto por secuencias de ceros y unos llamado codigo binario. Estas secuencias indican a la CPU qué debe hacer, con qué registros trabajar y qué datos utilizar. Es el nivel más bajo de programación y depende completamente del tipo de procesador, ya que cada arquitectura tiene su propio conjunto de instrucciones en lenguaje de máquina, por ejemplo Linux maneja diferente qie Apple.

# Actividad 3

## ¿Qué son PC, D y A?

El PC es un registro especial que contiene la dirección de la próxima instrucción por ejecutar desde la ROM. Después de cada instrucción, este valor se incrementa automáticamente, excepto cuando hay instrucciones como bucles o saltos.

El registro D se utiliza para guardar valores momentáneos, ya sea datos obtenidos de la memoria, números definidos por el programa o guardados por nuestra cuenta.

El registro A sirve tanto para indicar una dirección de memoria como para almacenar valores. Puede ser usado para acceder a una posición de memoria específica o como segundo registro de datos cuando sea necesario.

## ¿Para qué los usa la CPU?

El PC se utiliza para mantener el orden de ejecución de instrucciones. Se actualiza con cada ciclo, a menos que se indique un salto a una dirección específica. El registro A se emplea para apuntar a ubicaciones en la RAM y también para cargar constantes o valores intermedios. Por último, el D se encarga de manejar temporalmente los datos necesarios para operaciones.

# Actividad 4
### Ejercicio

Considera el siguiente fragmento de código en lenguaje ensamblador:
``` bash
@16384
D = A
@16
M = D
```
El propósito de este fragmento es almacenar el número 16384 en la celda 16 de la memoria RAM. A continuación, se debe escribir un código que almacene el número 100 en la posición 32 de la RAM.

### Ejecucion

Siguiendo el mismo patrón del ejemplo anterior, este es el código que lo logra:

@100
D = A
@32
M = D

