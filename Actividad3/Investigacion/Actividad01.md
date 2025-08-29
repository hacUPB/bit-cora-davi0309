# Actividad 01

```c++
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(255);
    ofDrawCircle(ofGetMouseX(), ofGetMouseY(), 20);
}
```

**¿Cuál es el resultado que se obtiene al ejecutar este programa?**

La funcion `setup` del programa me genera un backgroun de color negro y la funcion `draw` lo que realiza es que primero roma un color blanco `ofSetColor(255);` y me dibuja un circulo que va a tener la posicion en `X` y `Y` del MOUSE y va a tener un radio de 20. 