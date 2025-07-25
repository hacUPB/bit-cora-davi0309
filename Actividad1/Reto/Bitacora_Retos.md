# Bitacora
## Reto 01
Reto1. Carga en D el valor 1978.

- Muy básico. Fue como una introducción suave al ejercicio. No me costó nada.

Reto2. Guarda en la posición 100 de la RAM el número 69.

- Otro paso sencillo, pero ya me hizo pensar en cómo mover datos entre registros y memoria.

Reto3. Guarda en la posición 200 de la RAM el contenido de la posición 24 de la RAM.

- Este fue más interesante porque tuve que copiar datos de una dirección a otra. Me ayudó a entender cómo usar valores ya almacenados.

Reto4. Lee lo que hay en la posición 100 de la RAM, resta 15 y guarda el resultado en la misma posición.

- Aquí ya tocó hacer operaciones. Me gustó porque empieza a parecerse a programación de verdad, manipulando lo que hay en memoria.

Reto5. Suma el contenido de la posición 0, la posición 1 y con la constante 69. Guarda el resultado en la posición 2.

- Este fue un poco más largo, pero me gustó porque me obligó a pensar en cómo hacer operaciones por partes. Me pareció más lógico que los anteriores.

Reto6. Si el valor almacenado en D es igual a 0 salta a la posición 100 de la ROM.

- Este fue clave para entender cómo funcionan las decisiones en ensamblador. Se siente como hacer un if pero mucho más crudo.

Reto7. Si el valor almacenado en la posición 100 de la RAM es menor a 100 salta a la posición 20 de la ROM.

- Este fue el más complejo. Me tocó pensar cómo comparar dos valores correctamente. Me costó en la resta pero fue el más útil para aprender lógica de control.

Reto8. ¿Qué hace este programa?, en qué posición de la memoria está `var1`, `var2` y `var3`? ¿Por qué en esas posiciones?

- El programa primero crea una variable `var1` luego en la memoria `D` carga lo que tenga la RAM de la variable `var1` con `D=M`, creamos la variable `var2` y sumamos el valor que ya esta en `D` con el de la RAM de `var2` con `D=D+M`, por ultimo creamos la variable `var3` y guardamos el resultado de la suma en la RAM de `var3` colocando `M=D`.
- `var1`, `var2` y `var3` estan en las posiciones 16, 17 y 18 correspondientemente, se guarda en estas posiciones por que las direcciones de 0-15 estan reservadas por el hardware para funciones o instrucciones especificas y apartir de la direccion 16 se crean las variables libres.

Reto9. ¿Qué hace este programa?¿En qué parte de la memoria RAM está la variable `i` y `sum`? ¿Por qué en esas posiciones?

- La primera parte del programa guarda el numero 1 en una variable nueva que creamos llamada `i`, luego inicializamos la variable `sum` y en el espacio de la RAM un 0, luego vamos a la direccion `i`, leemos el contenido de la RAM osea `M` y se lo suma a la RAM de `sum` y guarda el resultado con `M=D+M` y por ultimo incrementa el valor de `i` en 1.
- Depende, si estamos tomando el ejercicio 8 como parte de los procesos, si es asi `i` estaria en la posición 19 y `sum` en la posicion 20 pero si solo estamos tomando el ejercicio 9 estarian en las posiciomes 16 y 17, por que los espacios de direccion del 0-15 estan reservados para funciones especificas.
- Una manera de optimizar el codigo en dos simples pasos seria ir o inicializar la variable `@i` luego colocamos `M=M+1` y esto incrementara en 1 la variable.

Reto10. Las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólico `R0` a `R15`. Escribe un programa en lenguaje ensamblador que guarde en `R1` la operación `2 * R0`.

- Este ejercicio fue algo relativamente sencillo ya que es colo los primeros retos pero usando nombres simbolicos para las direcciones, pero la logica era sumar dos vecez el valor de `M` y guardarlo en `R1`.

Reto11. ¿Qué hace este programa?
- es un ciclo que va desde 1000 hasta 0, se comienza dandole un valor en la RAM a `i` de 1000 y entrando a un ciclo donde por cada loop se le resta uno a la RAM en `i` y tiene un condicional: si llega a 0 esa cuenta salte al final del codigo en su defecto a la etiqueta (CONT).

¿En qué memoria está almacenada la variable i? ¿En qué dirección de esa memoria?
- la variable `i` esta guardada en la RAM y su direccion al ser la primera variable que creamos en este programa es la 16.


¿En qué memoria y en qué dirección de memoria está almacenado el comentario //`i = 1000?`
- los comentarios no se almacenan en la memoria y por ende no tienen dirección, por que no ocupa un espacio en la RAM ni en la ROM.

¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?
- la primera instrucción del programa es `@1000` esta guardada en la memoria ROM la cual es la memoria de las instrucciónes y al ser la primera instrucción esta en la memoria 0.

¿Qué son CONT y LOOP?
- CONT y LOOP son etiquetas y estas se definen entre parentesis como en el codigo mostrado, estas sirven para marcar posiciones en el codigo a las que se puede saltar, con las debidas órdenes las cuales son `@LOOP`y `@CONT`.

¿Cuál es la diferencia entre los símbolos `i` y `CONT`?
- La diferencia es que `i` es una variable que se guarda en la RAM y contiene un valor, en cambio `CONT`es una etiqueta la cual se guarda en la ROM y sirve para hacer saltos con `@CONT`.

Reto12. Implementar el codigo en ensamblador: `R4 = R1 + R2 + 69`:
- Fue algo sencillo de hacer ya que era lo que estabamos trabajando pero con los nombres simbolicos para las primeras 15 posiciones, se inicializo las variable `R1` y `R2` con un uno para que si se viera la suma y de resto era ir guardando y sumando dentro de `D`.

Reto13. Implementa en ensamblador:`// if R0 >= 0 then R1 = 1 else R1 = -1`
- Este fue sencillo pero útil para entender cómo hacer condiciones en ensamblador usando variables. Me ayudó a ver que se pueden simular los if usando saltos condicionales.

Reto14. Implementa en ensamblador:`R4 = RAM[R1]`:
- Corto, pero tuve que pensar bien en el acceso indirecto. Me hizo recordar que hay que mover el puntero manualmente para acceder al valor.

Reto15. Implementa en ensamblador el siguiente problema. En la posición R0 está almacenada la dirección inicial de una región de memoria. En la posición R1 está almacenado el tamaño de la región de memoria. Almacena un -1 en esa región de memoria:

- Me parecio algo confuso manejar lo del puntero en este ejercicio ya que tenia que ir cambiando y guardando -1 en las variables segun el tamaño, me gusto por que se parece a un ciclo for y me ayudo a entender mejor como manipular zonas de memoria con el puntero.

Reto16. Implementa en lenguaje ensamblador el siguiente programa:
- Este punto me costo bastante realizarlo, por que no entendia si el Array habia que llenarlo en el codigo o manual desde la RAM.

¿Qué hace este programa?
- Este programa recorre todo el arreglo y suma el contenido de cada posicion en la RAM a la variable sum, osea tengo un array de 10 y se recorre desde 16 hasta 25 por que los arreglos comienzan a contar desde 0, luego con cada vez que apunta en una direccion le suma el contenido que tiene en la RAM a la variable sum osea si tenemos en cada una de las posiciones del array un 10 el resultado final de sum deberia ser 100.

¿Dirección base de arr?
- En mi codigo la dirección base de arr comienza en la posicion RAM16 y de hay se crean 9 espacios mas hasta llegar a RAM25.

¿Cuál es la dirección base de sum en la memoria RAM y por qué?
- La direccion de sum es RAM0 por que usamos la instrucción @R0 y como normalmente vengo poniendo en las primeras 15 primeras posiciónes variables contantes o acumuladores por eso lo puse.

¿Cuál es la dirección base de j en la memoria RAM y por qué?
- j está en RAM1, porque se usa @R1 para guardar el índice del ciclo, y como usamos @R0 para la suma es natural hacer @R1 para no mezclar los datos.

Reto17. Implementa en lenguaje ensamblador Hack:`if ( (D - 7) == 0) goto ROM[69]`:
- Algo que ya habiamos hecho para reforzar la logica de las comparaciones. No hay operadores lógicos directos, pero se pueden simular con restas y saltos condicionales algo sencillo.

Reto18. Utiliza esta herramienta para dibujar un bitmap en la pantalla:
- Una actividad algo diferente pero igual de entretenida de trabajar, ya que no sabia que se podia dibujar y se pasaba a codigo.

Reto19. Analiza el siguiente programa en lenguaje de máquina:
- La traducción que le hicimos al binario para pasarlo al asm detecta si alguna tecla del teclado está siendo presionada y sostenida. Cuando esto pasa comienza a dibujar líneas negras en la pantalla, simulando un efecto de relleno. Cuando se deja de presionar la tecla, la línea se retrae o borra hacia atrás y en la RAM en la posicion 24576 se muestra que numero esta atribuido a cada tecla que presionamos.

Reto20. Implementa un programa en lenguaje ensamblador que dibuje el bitmap que diseñaste en la pantalla solo si se presiona la tecla “d”.
- Algo sencillo teniendo el punto 19 como referencia ya que era pegar nuestro dibujo y colocar una condicion que hiciera que cuando se predionara D validara si era 0 o no, un punto entrenetido de hacer.
