# Actividad 03

### ¿Qué hace cada función? ¿Qué hace cada línea de código?


```C++
void ofApp::setup() {// Se ejecuta una sola vez al iniciar el programa
	ofBackground(0);// Pone el fondo de la pantalla en negro 
	particleColor = ofColor::white; // Inicializa el color de las partículas en blanco, esto para despues cambiarlo con el click
}


void ofApp::update() { // Se ejecuta antes de cada frame; aquí se pondría algo que necesite actualizacion o parecido ps
}// (en este caso está vacío, no hace nada)


void ofApp::draw() {// Se ejecuta en cada frame para dibujar en la pantalla
	for (auto & pos : particles) { // Recorre todas las posiciones guardadas en el vector particles
		ofSetColor(particleColor);  // Cambia el color de dibujo a "particleColor"
		ofDrawCircle(pos.x, pos.y, 50); // Dibuja un círculo en cada posición con radio 50
	}
}


void ofApp::mouseMoved(int x, int y) {// Se ejecuta cada vez que mueves el mouse
	particles.push_back(ofVec2f(x, y));// Agrega la posición actual del mouse (x,y) al vector particles
	if (particles.size() > 100) {// Si hay más de 100 posiciones guardadas
		particles.erase(particles.begin());//borra la primera (la más antigua) para mantener máximo 100
	}
}

//
void ofApp::mousePressed(int x, int y, int button) { // Se ejecuta cuando das click en el mouse
	particleColor = ofColor(ofRandom(255),ofRandom(255),ofRandom(255)); // Cambia el color de las partículas a un color aleatorio
	                        	                        
}
```
### Modifica alguna parte importante de su código.
```C++
#include "ofApp.h"

float cantidad;
//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
	particleColor = ofColor::white;
}

//--------------------------------------------------------------
void ofApp::update() {
}

//--------------------------------------------------------------
void ofApp::draw() {
	for (auto & pos : particles) {
		ofSetColor(particleColor);
		float radius = ofRandom(10, 50);
		ofDrawCircle(pos.x, pos.y, radius);
	}
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {
	particles.push_back(ofVec2f(x, y));
	
	if (particles.size() > cantidad) {
		particles.erase(particles.begin());
	}
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
	particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));

	cantidad = ofRandom(10, 200);
}

```
Lo que modifique fue que el radio de los circulos fuera aleatorio y que el tamaño del vector o la cantidad de elementos que tiene `particles` sea aleatorio pero con los click asi cuando presionamos click se cambia tanto el color como el largo de el dibujo que se hace.
