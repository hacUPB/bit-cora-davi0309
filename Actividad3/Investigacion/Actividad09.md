# Actividad 09

## Codigo en ofApp.h

```C++
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{
public:
    void setup();
    void update();
    void draw();

    void keyPressed(int key);
    void mousePressed(int x, int y, int button);

private:
    vector<ofVec2f*> heapObjects;
};
```
## Codigo en ofApp.cpp
```C++
#include "ofApp.h"

void ofApp::setup(){
    ofBackground(0);
}

void ofApp::update(){
}

void ofApp::draw(){
    ofSetColor(0, 0, 255); // Color azul para los objetos del heap
    for(auto& pos : heapObjects) {
        ofDrawCircle(pos->x, pos->y, 20);
        ofDrawBitmapString("Heap Memory", pos->x - 40, pos->y - 40);
    }
}

void ofApp::keyPressed(int key){
    if(key == 'f') {
        if(!heapObjects.empty()) {
            delete heapObjects.back();
            heapObjects.pop_back();
        }
    }
}

void ofApp::mousePressed(int x, int y, int button){
    heapObjects.push_back(new ofVec2f(x, y));
}
```
## Preguntas

### ¿Qué sucede cuando presionas la tecla “f”?

Cuando presiono la tecla `f` se borra el ultimo objeto creado en el heap (que es memoria dinamica) y tambien borra ese puntero de la lista y asi se pueden seguir creando y eliminando mas circulos.

### Analiza detalladamente esta parte del código:

```C++
if(!heapObjects.empty()) { // Me verifica si tengo elementos en (heapObjects) que me guarda punteros
    delete heapObjects.back(); // Aqui me borra el ultimp objeto creadp en el heap
    heapObjects.pop_back(); // me elimina ese puntero del vector
}
```