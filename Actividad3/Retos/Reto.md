# Reto 01

## Errores que encontre en el camino
En este reto enfrenté varios errores, siendo el más común la forma en que declaraba los vectores, ya que lo hacía de manera no óptima respecto a cómo habíamos trabajado anteriormente. Además, tenía código de bucles anidados para recorrer posiciones duplicado, uno en la función `malla()` y otro en `setup()`, lo que provocaba que al iniciar el programa funcionara correctamente, pero al presionar, por ejemplo, la tecla `D`, se generaran dos planos distintos. Esto también ocurría porque no estaba limpiando el vector vertices, que es el que utilizaba para recorrer estas posiciones.

El trabajo me resultó muy bacano, ya que permite poner en práctica conceptos sobre vectores y cómo recorrer posiciones para posteriormente dibujarlas. También pude experimentar con la manipulación de variables mediante punteros, lo que evita modificar directamente los valores y permite mayor flexibilidad en la programación.

Aunque tuve cierta dificultad al pasar de ensamblador a C++, considero que es un buen comienzo. Lo que más me agradó de este programa fue la posibilidad de modificar las variables para que el plano tomara diferentes formas y atributos, mas enganche a la práctica por mi parte.


### ¿Como se maneja la memoria?:
Los datos más importantes son los vectores `vertices` y `spherePositions`. Estos guardan las posiciones de los puntos del plano y de las esferas que se dibujan en pantalla. Como estos vectores son parte de la clase ofApp, se guardan en la memoria dinámica, que C++ maneja automáticamente.

Cada vez que se llama a la función `malla()`, primero se borran los vectores con `clear()` antes de agregar nuevas posiciones. Esto evita que queden datos antiguos y asegura que solo tengamos en memoria los puntos y esferas que realmente se van a dibujar.

Otras variables como `xStep`, `yStep`, `distDiv`, `amplitud`, `selectedSpherePosition` y `sphereSelected` son variables simples de la clase. Dependiendo de cómo se creen, se guardan en la memoria del objeto o en la pila (stack), y siempre ocupan un tamaño fijo. Las variables que usamos solo dentro de funciones, como las matrices y los cálculos para convertir las coordenadas del mouse (rayStart, rayEnd, etc.), se guardan temporalmente en la pila y desaparecen cuando termina la función, esto es super importante ya que si necesitamos llamarla de algun lado no existen por que apenas se acabe el ciclo se eliminan.

### Anexo el codigo .h
```C++
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
	void setup();
	void update();
	void draw();
	void malla();
	void exit();
	void keyPressed(int key);
	void mousePressed(int x, int y, int button);
	void convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd);
	bool rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir,
		const glm::vec3 & sphereCenter, float sphereRadius,
		glm::vec3 & intersectionPoint);

	// Variables de la clase (antes estaban mal dentro de la función)
	int xStep;
	int yStep;
	float amplitud;
	float distDiv;
	std::vector<ofVec3f> vertices;
	ofEasyCam cam;
	bool sphereSelected;
	std::vector<glm::vec3> spherePositions;
	
	glm::vec3 selectedSpherePosition;

};
```
### Anexo el codigo .cpp
```c++
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
	ofSetFrameRate(60);

	xStep = 20; // separación en X
	yStep = 20; // separación en Y
	distDiv = 60; // divisor para la onda
	amplitud = 200;

	

	

	cam.setDistance(600); // cámara para ver la malla
}

//--------------------------------------------------------------
void ofApp::update() {
	 
}

void ofApp::malla() {
	
	
	vertices.clear();
	spherePositions.clear();
	for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 2; x += xStep) {
		for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 2; y += yStep) {
			float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
			vertices.push_back(ofVec3f(x, y, z)); // plano con altura según coseno
			spherePositions.push_back(glm::vec3(x, y, z)); // guardar posición de la esfera
		}
	}
}

//--------------------------------------------------------------
void ofApp::draw() {
	cam.begin();
	ofPushMatrix();
	ofRotateXDeg(60); // inclina el plano para verlo como cuadrícula 3D

	ofSetColor(255);
	for (auto & v : vertices) {
		ofDrawSphere(v, 2);
	}
	if (sphereSelected) {
		ofSetColor(255, 0, 0); // rojo
		ofDrawSphere(selectedSpherePosition, 4);
	}
	
	if (sphereSelected) {
		ofSetColor(255, 255, 0);
		std::string posStr = "Esfera seleccionada: (" + ofToString(selectedSpherePosition.x, 1) + ", " + ofToString(selectedSpherePosition.y, 1) + ", " + ofToString(selectedSpherePosition.z, 1) + ")";
		ofDrawBitmapString(posStr, 20, 20); // coordenadas de pantalla (20px desde arriba-izquierda)
	}
	

	ofPopMatrix();
	cam.end();
}

//--------------------------------------------------------------
void ofApp::exit() {
	vertices.clear();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'd') {
		distDiv += 2.0f;
		if (distDiv > 200) distDiv = 60; 
		malla(); // alterna ON/OFF al presionar "d"
	}
	if (key == 'a') {
		xStep += 5;
		yStep += 5;
		malla(); // alterna ON/OFF al presionar "d"
	}

	if (key == 'v') {
		xStep -= 5;
		yStep -= 5;
		malla(); // alterna ON/OFF al presionar "d"
	}

	if (key == 'i') {
		amplitud += 10.0f;
		malla(); // alterna ON/OFF al presionar "d"
	}
	if (key == 's') {
		distDiv -= 2.0f;
		if (distDiv < 20) distDiv = 60;
		malla(); // alterna ON/OFF al presionar "d"
	}


	
}

void ofApp::mousePressed(int x, int y, int button) {
	glm::vec3 rayStart, rayEnd;
	convertMouseToRay(x, y, rayStart, rayEnd);
	sphereSelected = false;// Comenzar asumiendo que no hay esfera seleccionada
	for (auto & pos : spherePositions) {// Recorrer todas las esferas
		glm::vec3 intersectionPoint;
		glm::vec3 rayDir = glm::normalize(rayEnd - rayStart);
		if (rayIntersectsSphere(rayStart, rayDir, pos, 8.0f, intersectionPoint)) {
			selectedSpherePosition = pos;
			sphereSelected = true;
			break;
		}
	}
}
void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd) {
	glm::mat4 modelview = cam.getModelViewMatrix();
	glm::mat4 projection = cam.getProjectionMatrix();
	ofRectangle viewport = ofGetCurrentViewport();
	float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
	float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;
	glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f);
	glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);
	glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
	glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;
	rayStartWorld /= rayStartWorld.w;
	rayEndWorld /= rayEndWorld.w;
	rayStart = glm::vec3(rayStartWorld);
	rayEnd = glm::vec3(rayEndWorld);
}
bool ofApp::rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir, const glm::vec3 & sphereCenter, float sphereRadius, glm::vec3 & intersectionPoint) {
	glm::vec3 oc = rayStart - sphereCenter;
	float a = glm::dot(rayDir, rayDir);
	float b = 2.0f * glm::dot(oc, rayDir);
	float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;
	float discriminant = b * b - 4 * a * c;
	if (discriminant < 0) {
		return false;
	}
	else {
		float t = (-b - sqrt(discriminant)) / (2.0f * a);
		intersectionPoint = rayStart + t * rayDir;
		return true;
	}
}
```


### Link al video de funcionalidad del programa

[Reto3 video](https://youtu.be/F-ZhQo7MUdo)

