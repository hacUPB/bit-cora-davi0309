# Actividad 1
## Preguntas

### 1. Entiende la aplicación: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: se requiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.

Se le pregunto a ChatGPT como funcionaba la parte del update de la clase LinkedList y esta fue su respuesta

```Cpp
void LinkedList::update(float x, float y) {
	Node * current = head;
	float prevX = x;
	float prevY = y;

	while (current != nullptr) {
		float tempX = current->x;
		float tempY = current->y;
		current->x = prevX;
		current->y = prevY;
		prevX = tempX;
		prevY = tempY;
		current = current->next;
	}
}
```
Esta función hace que cada nodo copie la posición del nodo anterior, y la cabeza (primer nodo) toma la posición dada por x,y (normalmente la posición del ratón). Es como empujar la posición nueva al frente y desplazar todas las demás hacia atrás.

Explicación línea por línea 

```Cpp
Node * current = head;
```
- Crea un puntero current que empieza apuntando al primer nodo de la lista (head).

- current recorrerá la lista nodo por nodo usando current = current->next;.
```Cpp
float prevX = x;
```
- prevX guarda la posición X previa que queremos asignar al nodo actual. Inicialmente contiene x (ej. la posición del mouse).
```Cpp
float prevY = y;
```
- Igual que prevX, pero para la coordenada Y.
```Cpp
while (current != nullptr) {
```
- Entra en el bucle sólo mientras current no sea nulo. Recorre todos los nodos desde head hasta tail.

Dentro del while — el cuerpo del bucle:
```Cpp
float tempX = current->x;
```
- Guarda en tempX la posición X antigua del nodo actual. Necesitamos conservarla antes de sobrescribirla.
```Cpp
float tempY = current->y;
```
- Igual que arriba, pero para Y.
```Cpp
current->x = prevX;
```
Asigna al nodo actual la posición X que estaba guardada en prevX. Es decir, el nodo "se mueve" a esa posición previa.
```Cpp
current->y = prevY;
```
Asigna la posición Y previa al nodo actual.
```Cpp
prevX = tempX;
```
Actualiza prevX para que ahora contenga la posición antigua del nodo que acabamos de procesar. Esa será la posición que copie el siguiente nodo en la siguiente iteración.
```Cpp
prevY = tempY;
```
Igual para Y.
```Cpp
current = current->next;
```
Avanza current al siguiente nodo de la lista.

Cuando current llega a nullptr, el bucle termina.

### 2. Realiza evaluaciones formativas. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.

**Estas fueron las preguntas de ChatGpt:**

Preguntas sobre estructura general

1.¿Qué diferencia hay entre Node y LinkedList en tu programa?

2.¿Qué representa la variable head dentro de la clase LinkedList?

3.¿Por qué en LinkedList se usa un puntero (Node *) en lugar de un objeto Node normal?

📌 Preguntas sobre setup() y la construcción de la lista

4.¿Qué hace el bucle en ofApp::setup() cuando llamas 10 veces a snake.addNode(width/2, height/2)?

5.¿Qué pasaría si no tuvieras ningún nodo en la lista y llamaras directamente a snake.update()?

📌 Preguntas sobre update() en LinkedList

6.¿Qué significa el parámetro x, y en la función LinkedList::update(float x, float y)?

7.En la primera iteración del while, ¿qué valores recibe el primer current->x y current->y?

8.¿Por qué es necesario guardar tempX y tempY antes de reasignar current->x y current->y?

9.¿Qué pasaría si quitaras esas variables temporales y simplemente hicieras prevX = current->x; prevY = current->y; después de la reasignación?

📌 Preguntas sobre la lógica del movimiento

10.¿Qué efecto visual tiene el hecho de que prevX y prevY se vayan actualizando dentro del bucle?

11.¿Qué sucedería si siempre actualizaras todos los nodos con la misma posición (x, y) en lugar de usar el mecanismo de “correr” valores?

12.¿Cómo se asegura el código de que cada nodo sigue al nodo anterior en vez de todos seguir al mouse al mismo tiempo?

📌 Preguntas de ampliación

13.Si quisieras que la serpiente creciera al presionar una tecla, ¿en qué parte del código harías el cambio?

14.¿Qué ocurriría si cambiaras current = current->next; por current = head; dentro del while?

15.¿Cómo modificarías la función draw() para que cada nodo tenga un color distinto según su posición en la lista?

**Y estas fueron mis respuestas**
1. el linkedlist gestiona mas la memoria y el Node es la estructura del nodo.

2. Donde comienza la lista enlazada 

3. para que podamos guardar las posiciones de los objetos y no trabajar directamente con ellos 

4. se agregan 10 Nodes a la lista snake 

5. no se dibujaria nada en pantalla por que no los guardamos en la lista 

6. la direccion o posicion X y Y del mouse 

7. guarda la X actual que tiene el objeto Node y lo mismo en Y 

8. para darselos al Node siguiente y que sepa donde va a estar que seria la posicion del Node antes de este 

9. que se quedarian en un solo punto ya que no se actualiza de buena manera la informacion 

10. que se ven como los circulos cambian de posicion por medio de saltos 

11. Que no se verian los diez circulos, ya que se solaparian ya que estan en el mismo punto 

12. con el current->next 

13. en el setUp 

14. Que solo se va a cambiar una vez de direccion ya que siempre va a ir al inicio de la lista enlazada 

15. realizaria que antes de cambiar al otro nodo con un ofsetcolor (random) se cambiara de color luego se llama al otro y se le da otro color diferente por el random

**Correcciones de Chargpt**

✅ Correcto: Node es la estructura base (cada circulito), y LinkedList es la clase que administra todos los nodos. Lo de la memoria está bien pensado, porque LinkedList se encarga de crear nodos con new y enlazarlos.

✅ Bien dicho: head es el primer nodo de la lista (el que lleva la “cabeza” de la serpiente).

⚠️ Aquí ojo: no es solo para “guardar posiciones”. La razón principal es que no podemos saber cuántos nodos habrá, entonces necesitamos punteros para enlazarlos dinámicamente en memoria.

✅ Correcto: en setup() se crean 10 nodos en la misma posición (centro de la pantalla).

⚠️ Casi: no es que “no se dibuje nada”, sino que si la lista está vacía (head == nullptr), el while de update() nunca corre y por lo tanto draw() tampoco tendría nada que mostrar. Técnicamente sí se dibujaría, pero dibujaría nada porque no hay nodos.

📌 Preguntas 6–9 (update)

✅ Exacto: los parámetros (x, y) son la posición del mouse que se pasa desde ofApp::update(mouseX, mouseY).

⚠️ Aquí un detalle: en la primera iteración, el current->x y current->y se reemplazan directamente por prevX y prevY (que en la primera vuelta son el mouse). No se “guardan”, sino que se sobrescriben. Lo que se guarda en tempX, tempY es la posición antigua de ese nodo.

✅ Muy bien: tempX, tempY sirven para “recordar” dónde estaba el nodo antes, y luego pasárselo al siguiente.

✅ Correcto: si quitaras tempX, tempY, los nodos perderían la posición previa y todos se colapsarían en el mismo punto.

📌 Preguntas 10–12 (efecto visual)

⚠️ Detalle: no son “saltos”, sino un efecto de seguimiento fluido. Cada nodo se coloca donde estaba el anterior, generando la ilusión de que todos siguen al mouse con un pequeño retraso.

✅ Muy bien explicado: si todos tomaran (x, y) directamente, estarían solapados en el mismo punto.

⚠️ No es solo por current->next. Ese es solo el puntero de avance en el bucle. Lo que realmente asegura que un nodo siga al anterior es la cadena de asignaciones usando prevX y prevY.

📌 Preguntas 13–15 (extras)

⚠️ No sería en setup(), porque ahí solo corres al inicio del programa. Para que crezca con una tecla, deberías hacerlo en keyPressed() y allí llamar a snake.addNode().

✅ Bien razonado: si haces current = head siempre, el while nunca avanza y te quedas atrapado en un bucle infinito o solo cambiarías siempre el primer nodo.

⚠️ Aquí tu idea de random funciona, pero si lo haces dentro del while, cada frame todos los nodos cambian de color aleatoriamente (parpadeo loco). Mejor: usar un índice (i) que vaya contando y cambiar el color en base a ese índice (ej. degradado del primero al último nodo).

### 3. ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en cuanto a la forma en que los elementos están almacenados en la memoria?

Una lista enlazada es una estructura de datos que esta formada por nodos y estos contienen primero que todo los datos y de segundo el puntero que es elq ue lo enlaza con otro nodo, se diferencia de un arreglo en que cada nodo puede estar en un espacio diferente de memoria ya que los conecta es un puntero, pero el arreglo son datos consecutivos en la memoria, otra cosa super importante es que en una lista enlazada puedo crecer o reducir esta a partir de metodos en cambio en un arreglo el tamaño solo es cuando lo declaro, ademas los arreglos no tienen punteros.

### 4. Al observar el código de una lista enlazada en C++, ¿Cómo crees que se vinculan los nodos entre sí? ¿Qué estructura se utiliza para lograr esta conexión?

Se vinculan mediante el puntero Node* ya que este es el que apunta al siguiente nodo (osea en el esta la direccion en memoria del siguiente nodo).

### 5. ¿Cómo se gestiona la memoria en una lista enlazada? Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++.

Un nodo se crea usando esta parte del codigo `Node * newNode = new Node(x, y);` que lo que hace es crear un nodo en la lista enlazada que se reserva en la memoria dinamica, tenemos que tener en cuenta que lo que me devuelve es un puntero que me apunta a este nodo creado.

Y se destruye con `delete current;` y tenemos que tener en cuenta lo de sobreescribir la posicion en la que estuvo con otro nodo por que si no hacemos esto la memoria queda ocupada aunque ya no estemos usando el nodo.

### 6. Considerando la estructura de una lista enlazada, ¿qué ventajas ofrece en comparación con un arreglo cuando se trata de insertar o eliminar elementos en posiciones intermedias?

Supongo que en la lista enlazada solo se cambia el puntero al objeto nuevo creado y de el objeto creado al que le sigue, en cambio en un arreglo toca mover todos los datos si eliminamos o insertamos uno nuevo.

### 7. En el código presentado, ¿Cómo se asegura que no haya fugas de memoria? ¿Qué papel juega el destructor en la clase LinkedList?

Lo primero es que se crean los nodos desde de la funcion `AddNode()` con `new` y esto asegura que estos datos sean guardados en el heap o memoria dinamica para una eliminacion previa que se hace o realiza por medio de un while qiue recorre cada uno de los datos de la lista y los borra con `delete` y ademas el destructor de LinkedList se ejecuta cuando se cierra el programa o se presiona c por lo tanto nunca quedan datos en memoria.

### 8. ¿Qué sucede en la memoria cuando se invoca el método clear() en una lista enlazada? Explica paso a paso cómo se liberan los recursos.

Vamos a resolver esta pregunta comentando el siguiente codigo:

```cpp
void LinkedList::clear() {
    Node* current = head;// Aqui vamos a crear una variable que va a apuntar a la head del nodo
    while (current != nullptr) { //Preguntamos si mi variable current no esta vacia (eso se cumple desde que esxista una lista enlazada)
        Node* nextNode = current->next;// Creamos una variable que va a apuntar hacia la direccion del nodo que le sigue a head osea el siguiente
        delete current;// Aqui vamos a borrar la cabeza por que es el dato que esta en current que despues de la primera iteracion cambiara
        current = nextNode;// se asigna en current al direccion guardada
		// Y se vuelve a repetir el bucle
    }
    head = nullptr;// Hacemos que lso punteros no apunten a espacios vacios y ponemos la lista en estado vacio
    tail = nullptr;//lo mismo que en el head
    size = 0;// indicamos que no hay mas elementos en esta lista
}
```

### 9. Explica cómo cambia la estructura en memoria de una lista enlazada al agregar un nuevo nodo al final de la lista. ¿Cómo afecta esto al rendimiento de la lista enlazada?

Para poder agregar un nodo al final de la lista enlazada toca recorrer toda esta lista y cambiar el puntero del ultimo nodo para que apunte al nodo que voy a agregar y que este nodo apunte a nulo y este quede siendo la cola, lo que hace que el rendimiento del programa se vea afectado ya que como tiene que recorrer un numero n de nodos consume tiempo, en cambio en un array o arreglo se hace desde una sola instruccion sin tener que recorrer todos los datos, aunque si tenemos un puntero que siempre apunte a la cola seria igual de facil introducir un nodo que un dato en un arreglo.

### 10. Analiza una situación en la que utilizar una lista enlazada sería más ventajoso que utilizar un arreglo. Justifica tu respuesta considerando la gestión de memoria y las operaciones de inserción y eliminación.
Creo que una situacion muy clara seria realizar el juego de la culebra que cuando come aumenta de tamaño y cuando choca con su cuerpo se elimina. ya que siento que es mucho mejor usar listas enlazadas por:

- capacidad de aumentar o disminuir su tamaño sin crear otra lista, cosa que en un arreglo no seria posible ya que cada vez que come tocaria crear un nuevo arreglo y pasar los datos que ya teniamos, en cambio en una lista enlazada se agrega un nuevo nodo cada vez que come y ya.

- El movimiento del cueerpo solo se hace desde la cabeza y cada noso guarda una posicion y apunta al siguiente, lo unico que se tiene que hacer es que cuandos e mueve cada nodo copia la posicion del anterior y ya, en cambio en una arreglo tocaria recorrer todo el arreglo en orden.

- Cuando se eliminan los datos en un arreglo tocaria borrar los datos manualmente o resetear la estructura, en cambio en una lista enlazada basta con recorrer y liberar los nodos.

### 11. Después de estudiar el manejo de memoria en listas enlazadas, ¿Cómo aplicarías este conocimiento para diseñar una estructura de datos personalizada para una aplicación creativa? ¿Qué aspectos considerarías para asegurar la eficiencia y evitar fugas de memoria?

Seria una aplicación sobre el manejo de task como lista de tareas que puedan ir cumpliendose en un orden diferente y cuando las cumplas sean sacadas de la lista, cuando creo una tarea puedo organizarla en la lista en el orden que yo quiera sin consumir muchos recursos, ya que solo se cambiarian los punteros de estas, ademas le da un plus a utilizar este tipo de software de lista enlazada a diferencia del arreglo que toca mover todos los datos al añadir uno en el medio.

### 12. Reflexiona sobre las diferencias en la gestión de memoria entre C++ y un lenguaje con recolección de basura automática como C#. ¿Qué ventajas y desafíos encuentras en la gestión explícita de memoria en C++ al trabajar con estructuras de datos?

Una posible ventaja del c++ seria si necesito guardar datos al cerrar la aplicacion, por ejemplo datos que siempre se mantengan en una aplicacion y no se necesite borrar al cerrar la app, cosa que el recolector de basura no omite ya que borra todo al cerrar la aplicacion, un desafio seria que si necesito que se reinicie o se renueven los datos de la aplicacion al cerrarla en C++ me tocaria realizar un metodo para poder eliminar estos datos cosa que en otros lenguajes de programacion que usen la recollecion de basura se hace de manera automatica.

### 13. Imagina que estás optimizando una pieza de arte generativo que usa listas enlazadas para representar elementos en movimiento. ¿Qué consideraciones tomarías en cuenta para garantizar que la gestión de la memoria sea eficiente y que no ocurran fugas de memoria?

En un programa donde se eliminen y se crean nodos constantemente es escencial que no hayan fugas de memoria por esto se crea en la clase una funcion clear para que no queden datos vacios en memoria, ademas cuando se crean nuevos nodos dentro del ciclo tenemos que gestionar de una buena manera pasandole la posicion del nodo anterior y que todos esten conectados y no queden señalando a espacios vacios.

### 14. Pruebas: pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.


