# Actividad 02

### ¿Qué fue lo que incluimos en el archivo .h?

```c++
private:

        vector<ofVec2f> particles;
        ofColor particleColor;
```
Se crean dos variables privadas una es un vector de dos posiciones y le ponemos de nombre particles y vamos a crear otra variable de nombre particleColor.

### ¿Cómo funciona la aplicación?

La aplicacion funciona de esta manera:

**Primero**
```c++
void ofApp::setup() {
	ofBackground(0);
	particleColor = ofColor::white;
```
aqui en la variable setup vamos a colocar un fondo de color negro y agregarle a la variable `partivleColor` un color por defecto blanco ue veremos que mas adelante va a cambiar.

**Segundo**
```C++
void ofApp::draw() {
	for (auto & pos : particles) {
		ofSetColor(particleColor);
		ofDrawCircle(pos.x, pos.y, 50);
	}
}
```

En la funcion draw vamos a recorrer en un bucle de for a el vector particles, y el `ofSetColor` me define de que color se van a dibujar los circulos en la pantalla (recordemos que la el metodo draw se va a cargar cada frame entonces cada frame se van a cargar los circulos), y en `ofDrawCircle` me va a dibujar un circulo de radio 50, en cada coordenada guardada.

**Tercero**
```C++
void ofApp::mouseMoved(int x, int y) {
	particles.push_back(ofVec2f(x, y));
	if (particles.size() > 100) {
		particles.erase(particles.begin());
	}
}
```
Lo que hace este metodo es que en `particles.push_back(ofVec2f(x, y));` me guarda o mete en el vector un nuevo elemento en este caso cada vez que el mouse cambia o se mueve de posicion, esta coordenada se guarda en el vector particles, y el condicional lo que me dice es que si el tamaño es mas grande a 100 o ps tiene mas de 100 elementos me elimina el mas antiguo.

**Cuarto**
```C++
void ofApp::mousePressed(int x, int y, int button) {
	particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}
```
Este metodo va a realizar la accion de cambiarme de color todos los circulos creados al presionar el click del mouse