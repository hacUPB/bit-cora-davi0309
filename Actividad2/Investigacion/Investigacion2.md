# Actividad 01

## ¿Qué es la entrada-salida mapeada a memoria?
Es una tecnica donde dispositivos de entrada y salida (como teclados y pantalla, etc.) se pueden controlar con direcciones especificas de la memoria. Y eso hace posible que el CPU lea o escriba directamente en esas direcciones como si fueran variables normales en memoria.
## ¿Cómo se implementa en la plataforma Hack?
En hack se implementa en diferentes posiciones por ejemplo en la posicion o direccion `@24576` se guarda lo que es el codigo que tiene cada tecla del teclano y se puede usar guardando este numero en `D` y comoarandolo en un condicional para saber si fue presionada o no, y en la dirección `@16384` es el inicio de la pantalla, y cada bit representa un pixel blanco o negro.

## Inventa un programa que haga uso de la entrada-salida mapeada a memoria.
Lo que hice fue realizar un programa que pone un pixel en negro cada 30 espacios colocando en la memoria desde `@16384` un numero 1 y eso hace que se dibuje un pixel el numero de pixeles que se crea son `278`, y se genera un espacio blanco lleno de puntos negros garcias a un LOOP.

## Investiga el funcionamiento del programa con el simulador.

Esta en la actividad1 la solucion a este problema.