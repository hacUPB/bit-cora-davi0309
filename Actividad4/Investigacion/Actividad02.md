# Actividad 2

## preguntas 

### 1. Entendiendo la aplicación: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: quiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.
¿Como funciona la funcion pop()?
```cpp
void pop() {
    if (top != nullptr) {
        Node* temp = top;   // guardamos el nodo que vamos a borrar
        top = top->next;    // movemos top al siguiente nodo
        delete temp;        // liberamos memoria
    }
}
```
¿Como funciona la funcion push(float x, float y)?
```cpp
void push(float x, float y) {
    Node* newNode = new Node(x, y);  // creamos un nuevo nodo
    newNode->next = top;             // el nuevo nodo apunta al que antes era el top
    top = newNode;                   // ahora el nuevo nodo se convierte en el top
}
```
- La pila está vacía → top = nullptr.

- Presionas "a" → se crea un nodo con la posición del mouse.

- Como next = top, ese nodo guarda el "camino" al anterior.

- top = newNode → el nuevo nodo queda arriba de la pila.

### 2. Realiza evaluaciones formativas. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.


**¿Qué representa un nodo (Node) en este programa y qué dos cosas principales guarda?**

Me dice donde esta el circulo y apunta al siguiente en a pila

Ans GPT: Un Node guarda la posición del círculo y un puntero next al siguiente nodo en la pila.

**¿Cuál es la función de la variable top dentro de la clase Stack?**

Top siempre guarda o apunta hacia el ultimo nodo en la pila

Ans GPT: top siempre apunta al último nodo agregado. Muy bien explicado.

**Explica con tus palabras la diferencia entre push() y pop() en este programa.**

Push lo que hace es que genera un nuevo circulo y toma la posicion de top en la pila, en cambio pop lo que hace es que elimina desde el top hacia abajo osea el ultimo creado hasta el primero.

Ans GPT: push() agrega un nuevo nodo arriba de la pila (el nuevo apunta al antiguo top), pop() elimina solo el nodo en top, no todos hacia abajo (eso lo haría clear()).

**¿Qué ocurre en memoria cuando se ejecuta circleStack.push(ofGetMouseX(), ofGetMouseY()); al presionar la tecla 'a'?**

Que me crea un circulo justo en la posicion donde esta el mouse en ese momento

Ans GPT:se crea un nuevo nodo en la posición actual del mouse.

**¿Qué hace el puntero next en cada nodo y por qué es importante?**

Me selecciona el siguiente en la fila hasta llegar a top, es importante ya que con esto podemos borrar y crear facilmente los nodos y conectralos entre si

Ans GPT:El next no “selecciona”, sino que guarda un enlace al siguiente nodo. Es como un hilo que conecta todos los nodos. Gracias a esto podemos recorrerlos y mantener la estructura enlazada.

**¿Qué pasa si llamamos a pop() cuando la pila está vacía (top == nullptr)?**

No pasa nada por que borra desde top y como top en sulo no borra nada.

Ans GPT: Si top == nullptr, pop() no hace nada (gracias al if). Evita errores.

**¿Por qué en el destructor de Stack (~Stack()) se llama a la función clear()?**

Para que cuando se cierre el proyecto no queden datos en la memoria y se borre de manera eficas los datos en la memoria dinamica.

Ans GPT: El destructor llama a clear() para liberar memoria y no dejar fugas (memory leaks).

**En la función display(), ¿cómo se recorren todos los nodos de la pila para dibujarlos?**

Se hace con un while y se va guardando una posicion actual y cuando estamos al fina de la iteracion ponemos este corriente como el next o siguiente.

Ans GPT: No se guarda "una posición actual para ponerla en next".

Lo que se hace es avanzar con un puntero current = current->next; hasta que sea nullptr.

**¿Qué diferencia conceptual hay entre la pila de este programa y la cola (queue) que también vimos?**

Que este elimina el ultimo que fue creado en cambio el otro lo hace por el primero que creo

Ans GPT:
Pila: último en entrar, primero en salir (LIFO).

Cola: primero en entrar, primero en salir (FIFO).

**Si quisieras dibujar solo el último círculo agregado, ¿qué parte del código modificarías o qué variable usarías?**

Modificaria el display para que solo dibuje el que esta en top

Ans GPT: Bastaba con modificar display() para que solo dibuje top.

### 3. Pruebas: pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.

Realice varias pruebas y la mayoria eran de como cambiana la variable top por ejemplo en el `push()` y en el `pop()`, tambien en el display hice varios Breakpoint para ver como cambiaban y se guardaban las posiciones.

## Preguntas de reflexión para el stack:

### 1. ¿Cómo se gestiona la memoria en una implementación manual de un stack en C++? Reflexiona sobre cómo el uso de new y delete en la creación y destrucción de nodos afecta el rendimiento y la seguridad de tu programa.

Los nodos aqui se crean en la memoria dinamica, lo que hace que tengamos que eliminarlos manualmente cosa que no pasa si se trabajara la memoria en el stack, con el rendimiento la ventaja seria que puedo crear tantos nodos como lo soporte la Ram lo maluco seria que cada llamada de new y delete podria utilizando por ejemplo el stack normal ser mar rapido comparado con esto ya que tenemos que pedirle y devolver un espacio en memoria cada vez que se llaman estas 2 funciones, y tener en cuenta que no podemos tener punteros apuntando a direcciones vacias ni fugas de memoria por olvidar los metodos delete, pop o clear.


### 2. ¿Por qué es importante liberar la memoria cuando se desapila un nodo en un stack? Considera las consecuencias de no liberar memoria en términos de fugas de memoria y cómo esto puede impactar aplicaciones de largo tiempo de ejecución.

Por ejemplo en esta parte del codigo:
```cpp
Node* temp = top;     // Guardas el nodo que vas a eliminar
top = top->next;      // Avanzas el top al siguiente nodo
delete temp;          // Libera la memoria que usaba ese nodo
```
si no tiene `delete temp;` se generaria una fuga de memoria, ¿por que?,  ya que el puntero que estamos usando que en este caso es temp y este cambia a top y top cambia a el siguiente, si no tenemos `delete` y se vuelve a correr esta funcion no hay manera de llegar a el espacio en memoria donde estaba ese dato y podemos evitar que el programa se vuelva lento e inestable.



### 3. ¿Qué diferencias existen entre usar un stack de la STL (std::stack) y crear un stack manualmente? Explora cómo la abstracción que proporciona la STL puede simplificar la implementación, pero también cómo una implementación manual ofrece mayor control sobre la gestión de recursos.

La diferencia seria que si lo hacemos manualmente seria mas flexible y mas manejable si queremos que nuestro codigo realice cosas diferentes lo malo seria que al realizarlo por nuestra cuenta todo lo que es `push`, `pop`, `display` y `clear` lo que si no lo hacemos bien podria generar problemas en el codigo y dar fugas de memoria si no se trabajan bien estas funciones. En cambio si se hace con STL (std::stack) todo se es automatico y solo se llaman estas funciones lo que podria ser mas seguro.

### 4. ¿Cómo afecta la estructura de un stack al orden de acceso y eliminación de elementos? Analiza cómo la naturaleza LIFO (Last In, First Out) del stack influye en los tipos de problemas que esta estructura de datos puede resolver eficientemente.

Como en el Stack cuando hacemos push los datos se guardan encima de todos los anteriores y cuando hacemos pop se elimina el ultimo creado, tambien no podemos acceder a datos interemedios ni al primero solo al ultimo cosa que no pasa en los arreglos, loq ue hace que sea perfecto para operaciones como deshacer operaciones tipo Ctrl Z o cuando abrimos varias ventanas y se cierran volviendo a la anterior.

### 5. ¿Cómo podrías modificar el stack para almacenar tipos de datos más complejos (e.g., objetos con múltiples atributos) sin causar problemas de memoria? Reflexiona sobre cómo gestionar adecuadamente la memoria para objetos más complejos y cómo esto afectaría tu implementación actual.

Se modificaria desde el Node y se colocarian los atributos dentro de este, creando los objetos directamente dentro de este o creandolo con STL (std::stack) para que no sea tan complicado borrar estos ya que estos gestionan su propia memoria correctamente lo que evita daños en el codigo si no se llega a borrar estos atributos correctamente si queremos almacenar datos mas complejos.

## Preguntas de autoevaluación

### 1. ¿Puedo explicar detalladamente cómo funciona el proceso de apilar y desapilar nodos en un stack, incluyendo la gestión de memoria?

Si, el ultimo elemento que entra es el primero que sale, en nuestro programa se sabe siempre cual es el que esta arriba del todo con la variable `top`, push me crea un nuevo nodo en la memoria dinamica con la posicion del circulo y con next=nulo, y este se enlaza al nodo que antes estaba en top y este toma la posicion de top, con pop miramos que la pila no este vacia, luego guardamos la posicion del nodo que esta en top y pasamos guardamos en top la posicion de el nodo que le sigue al que antes estaba en top, luego borramos loq ue antes estaba en top.

### 2. ¿Soy capaz de identificar y corregir una fuga de memoria en una implementación de stack manual?

No tanto, ya que la verdad no se como se ven los datos que no se eliminaron y no cuentan con un puntero que me indiquen donde estan.

### 3. ¿Puedo modificar el stack para que incluya una función que busque un elemento específico, sin alterar el orden de los elementos apilados?

Supongo, se haria por medio de un while y solo vamos a ir moviendonos por medio de los punteros que tenga esta lista enlazada

### 4. ¿Entiendo cómo la estructura LIFO del stack afecta el flujo de datos y puedo dar ejemplos de problemas que se resuelvan mejor con un stack?

Totalmente, ya que el orden de eliminación siempre será el inverso al de cuando entran y esto hace que hayan unos problemas especificos que funcionan de manera mas eficiente de esta manera.

### 5. ¿Puedo implementar y depurar un stack para tipos de datos más complejos, asegurándome de que no haya fugas de memoria ni errores de puntero?

Si, y mas si uso el STL que me ayuda a que sea mas sencillo de hacer.

## Preguntas de reflexión para la queue:

### 1. ¿Cómo se maneja la memoria en una implementación manual de una queue en C++? Reflexiona sobre cómo se gestionan los nodos al encolar y desencolar elementos y las implicaciones en términos de eficiencia y seguridad.

Los nodos se crean cuando llamo `circleQueue.enqueue(ofGetMouseX(), ofGetMouseY());` y el metodo `enqueue()` lo que hace es crear en la memoria dinamica un nuevo nodo, y e puntero se conecta al nuevo nodo y rear se actualiza alq ue acabamos de crear, el metodo `dequeue()`, elimina nodos pero lo hace de esta manera, guarda una referencia del primer nodo luego mueve front al que le sigue del primero, y con delete se libera la memoria de este nodo que antes estaba en front.

### 2. ¿Qué desafíos específicos presenta la implementación de una queue en comparación con un stack en términos de gestión de memoria? Considera las diferencias en el manejo de punteros front y rear, y cómo estos afectan el proceso de encolado y desencolado.

Lo dificil que veo al utilizar queue es que estamos usando dos punteros y en stack solo se maneja 1, entonces en el queue hay que mantener una coherencia y estar muy atentos a si estamos cambiando el rear y el front de una manera optima ya que si esto no pasa se vuelve un enredo gigante, en stack es mucho mas facil por que manejamos solo un puntero que sirve tanto como para entrada de datos como para salida.

### 3. ¿Cómo afecta la estructura FIFO (First In, First Out) de una queue a su uso en diferentes tipos de problemas? Analiza cómo la estructura FIFO influye en la resolución de problemas donde el orden de procesamiento es crucial, como en sistemas de colas de espera.

Afecta en que se procesa siempre secuencial mente y siempre tiene un orden cronolojico y evita que las tareas mas antiguas queden olvidadas por que si o si todos van a moverse "por asi decirlo", y podria funcioanr en sistemas como tickets en los que entra mucha gente y se atienden los que llegaron primero, tambien pienso en como funcionan las impresoras si le mando varios documentos para imprimir cargan en el orden de llegada.

### 4. ¿Cómo podrías implementar una queue circular y cuál sería su ventaja respecto a una queue lineal en términos de uso de memoria? Reflexiona sobre cómo una queue circular puede mejorar la eficiencia en ciertos contextos y qué cambios serían necesarios en la implementación.

Lo bueno de implementar un queue circular es que si estamos trabajando con arreglos nunca se desperdicia memoria ya que comparado con el lineal que va eliminando desde front y crea desde rear, en el circular si elimino la primera posicion por ejemplo puedo pasar a rear a ese punto y crear o guardar un dato en la posicion donde antes estaba el front pero estas posiciones se me modificarian.(La vdd no entiendo muy bien esto como funciona y como puede implementarse)

### 5.¿Qué problemas podrían surgir si no se gestionan correctamente los punteros front y rear en una queue, y cómo podrías evitarlos? Considera posibles errores como la pérdida de referencias a nodos y cómo una gestión cuidadosa de los punteros puede prevenir estos problemas.

Depronto, al no mover bien rear podriamos a apuntar a algo que no es realmente la cola y que nos dañe el codigo, tambien causar fugas de memoria, o si la cola y la cara no estan sincronizadas puede desatar muchos errores.