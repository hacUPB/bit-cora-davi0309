# Actividad 06

```c++

#include "ofApp.h"

Sphere::Sphere(float x, float y, float radius) : x(x), y(y), radius(radius) {
    color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

void Sphere::draw() const {
    ofSetColor(color);
    ofDrawCircle(x, y, radius);
}

void ofApp::setup() {
    ofBackground(0);
}

void ofApp::update() {
}

void ofApp::draw() {
    ofSetColor(255);
    for (Sphere* sphere : globalVector) {
        if (sphere != nullptr) {
            ofDrawBitmapString("Objects pointed: " + ofToString(globalVector.size()), 20, 20);
            ofDrawBitmapString("Attempting to draw stored object...", 20, 40);
            ofDrawBitmapString("Stored Object Position: " + ofToString(sphere->x) + ", " + ofToString(sphere->y), 20, 60);
            sphere->draw();
        }
    }
}

void ofApp::keyPressed(int key) {
    if (key == 'c') {
        if (globalVector.empty()) {
            createObjectInStack();
        }
    }
    else if (key == 'd') {
        if (!globalVector.empty()) {
            ofLog() << "Accessing object in global vector: Position (" << globalVector[0]->x << ", " << globalVector[0]->y << ")";
        }
        else {
            ofLog() << "No objects in the global vector.";
        }
    }
}

void ofApp::createObjectInStack() {
    Sphere localSphere(ofRandomWidth(), ofRandomHeight(), 30);
    globalVector.push_back(&localSphere);
    ofLog() << "Object created in stack: Position (" << localSphere.x << ", " << localSphere.y << ")";
    localSphere.draw();
}
```
### ¿Qué sucede cuando presionas la tecla “c”?

Si presionas `c` intenta crear un objeto y guardarlo en el vector, PERO no se dibuja ninguna sphere y cuando presiono `D` para mostrar la posicion de la sphere guardada no coincide con la posicion que tenia mi primera sphere.

Esto se debe a que en la funcion `void ofApp::createObjectInStack()` cuando esta termina `localSphere` deja de existir ya que solo esta definida en el contexto de la funcion y no en todo el codigo.

### Ya con el codigo corregido ¿Qué sucede cuando presionas la tecla “c”?, ¿Por qué ocurre esto?

```C++
void ofApp::createObjectInStack() {
    // Sphere localSphere(ofRandomWidth(), ofRandomHeight(), 30);
    // globalVector.push_back(&localSphere);
    // ofLog() << "Object created in stack: Position (" << localSphere.x << ", " << localSphere.y << ")";
    // localSphere.draw();
    Sphere* heapSphere = new Sphere(ofRandomWidth(), ofRandomHeight(), 30);
    globalVector.push_back(heapSphere);
    ofLog() << "Object created in heap: Position (" << heapSphere->x << ", " << heapSphere->y << ")";
    heapSphere->draw();
}
```

Lo que sucede es que esta vez si se dubija la esfera al presionar `C` ya que la variable ahora no es `localSphere`quedaba en la pila de stack y el puntero que guardaste en globalVector queda apuntando a un espacio de memoria que ya no existe. En cambio con el `new`creamos un nuevo objeto en el `heap`osea en un area especifica de la memoria que se usa para almacenar objetos creados dinamicamente y solo se elimina de ese lugar manual mente, y por ende siguen "vivos" por fuera de la funcion y el ejercicio corre sin ningun problema.
