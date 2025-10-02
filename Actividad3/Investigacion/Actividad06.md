# Actividad 06

```c++
#include "ofApp.h"

Sphere::Sphere(float x, float y, float radius)
	: x(x)
	, y(y)
	, radius(radius) {
	color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

void Sphere::draw() {
	ofSetColor(color);
	ofDrawCircle(x, y, radius);
}

void Sphere::update(float x, float y) {
	this->x = x;
	this->y = y;
}

float Sphere::getRadius() {
	return radius;
}

float Sphere::getX() {
	return x;
}

float Sphere::getY() {
	return y;
}

//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);

	for (int i = 0; i < 5; i++) {
		float x = ofRandomWidth();
		float y = ofRandomHeight();
		float radius = ofRandom(20, 50);
		spheres.push_back(new Sphere(x, y, radius));
	}
	selectedSphere = nullptr;
}

//--------------------------------------------------------------
void ofApp::update() {
	if (selectedSphere != nullptr) {
		selectedSphere->update(ofGetMouseX(), ofGetMouseY());
	}
}

//--------------------------------------------------------------
void ofApp::draw() {
	for (auto sphere : spheres) {
		sphere->draw();
	}
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {

	if (button == OF_MOUSE_BUTTON_LEFT) {
		if (selectedSphere == nullptr) {
			for (auto sphere : spheres) {
				float distance = ofDist(x, y, sphere->getX(), sphere->getY());
				if (distance < sphere->getRadius()) {

					selectedSphere = sphere;
					break;
				}
			}
		}
		else {
			selectedSphere = nullptr;			
		}
	}
}

```
El error era que nunca se soltaba la espfera seleccionada.
Lo que se le agrego fue un if si el selector es diferente a nulo al presioanr el click se cambia la ubicacion del objeto a la del mouse y luego si ya esta con un objeto seleccionado y vuelvo a clickear se desselecciona el objeto.
