# Actividad 03

### ¿Cuál es la definición de un puntero?

Es una variable que guarda la direccion de un objeto o variable.

### ¿Dónde está el puntero?

En nuestro codigo esta aqui
```c++
	vector<Sphere *> spheres;
	Sphere * selectedSphere;
```
Donde `vector<Sphere *> spheres;` es un vector que guarda punteros que apuntan a objetos sphere, y `Sphere * selectedSphere;` me guarda una sola direccion de una sola esphera.

### ¿Cómo se inicializa el puntero?
Desde el metodo `SetUp` en la parte del codigo 

```C++

spheres.push_back(new Sphere(x, y, radius));

```
Aqui se crea un objeto `Sphere` y se instancia con `new` y se mete dentro del vector que me guarda punteros.

### ¿Para qué se está usando el puntero?

Para guardar direcciones de objetos esferas en un vector, y para guardar la direccion de la esfera seleccionada.

### ¿Qué es exactamente lo que está almacenado en el puntero?
Guarda la direccion de el objeto en RAM. 


