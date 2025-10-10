# Actividad 08

```C++
#include "ofApp.h"

Sphere* globalSphere = nullptr;

Sphere::Sphere(float x, float y, float radius)
	: x(x)
	, y(y)
	, radius(radius) {
	color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

void Sphere::draw() const {
	ofSetColor(color);
	ofDrawCircle(x, y, radius);
}

void ofApp::setup() {
	ofBackground(0);
	globalSphere = new Sphere(100, 100, 40);
}

void ofApp::update() {
}

void ofApp::draw() {
	ofSetColor(255);

	globalSphere->draw();
	
	
	for (Sphere * sphere : globalVector) {
		if (sphere != nullptr) {
			ofDrawBitmapString("Objects pointed: " + ofToString(globalVector.size()), 20, 20);
			ofDrawBitmapString("Attempting to draw stored object...", 20, 40);
			ofDrawBitmapString("Stored Object Position: " + ofToString(sphere->x) + ", " + ofToString(sphere->y), 20, 60);
			sphere->draw();
			
		}
	}
}



void ofApp::keyPressed(int key) {
    if (key == 'c') {// Crear en HEAP
        if (globalVector.empty()) {
            createObjectInStack();
            }
        } else if (key == 'd') {
            if (!globalVector.empty()) {
                ofLog() << "Accessing object in global vector: Position (" << globalVector[0]->x << ", " << globalVector[0]->y << ")";
            } else {
                ofLog() << "No objects in the global vector.";
            }
        }
        if (key == 's') { // Crear en HEAP
            createStackSphere();
        } else if (key == 'j') {
            if (!globalVector.empty()) {
                ofLog() << "Accessing object in global vector: Position (" << globalVector[1]->x << ", " << globalVector[1]->y << ")";
            } else {
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

void ofApp::createStackSphere() {

	Sphere * heapSphere = new Sphere(ofRandomWidth(), ofRandomHeight(), 30);
	globalVector.push_back(heapSphere);
	ofLog() << "Object created in heap: Position (" << heapSphere->x << ", " << heapSphere->y << ")";
	heapSphere->draw();
}
```
En este codigo lo que hice fue que al presionar la tecla `S` se llama la funcion `createStackSphere()` que me crea una sphere pero en `heap` y cuando presiono `C` se crea una sphere pero en `stack`o la pila y por eso no aparecen en pantalla, tambien se crea una desde el inicio en `setup`para que sea global y cuando se cree el programa este se cree desde el inicio. Y para realizarlo tenemos que colocar un ountero desde afuera por que si creamos el objeto desde la parte de arriba aparece un error ya que no se puede crear si no se ha cargado nisiquiera el setup por lo tanto se crea una variable global puntero y en setup se le agrega la direccion de un objeto que creamos.
