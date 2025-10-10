# Sesion 02
`   ofApp.h`
```cpp
#pragma once

#include "ofMain.h"
#include <vector>
#include <string>

class Observer {
public:
    virtual void onNotify(const std::string& event) = 0;
};

class Subject {
public:
    void addObserver(Observer* observer);
    void removeObserver(Observer* observer);
protected:
    void notify(const std::string& event);
private:
    std::vector<Observer*> observers;
};

class Particle;

class State {
public:
    virtual void update(Particle* particle) = 0;
    virtual void onEnter(Particle* particle) {}
    virtual void onExit(Particle* particle) {}
    virtual ~State() = default;
};

class Particle : public Observer {
public:
    Particle();
    ~Particle();

    void update();
    void draw();
    void onNotify(const std::string& event) override;
    void setState(State* newState);

    ofVec2f position;
    ofVec2f velocity;
    float size;
    ofColor color;

private:
    State* state;
};


class NormalState : public State {
public:
    void update(Particle* particle) override;
    virtual void onEnter(Particle* particle) override;
};


class AttractState : public State {
public:
    void update(Particle* particle) override;
};

class RepelState : public State {
public:
    void update(Particle* particle) override;
};

class StopState : public State {
public:
    void update(Particle* particle) override;
};

class ParticleFactory {
public:
    static Particle* createParticle(const std::string& type);
};

class ofApp : public ofBaseApp, public Subject {
    public:
        void setup();
        void update();
        void draw();
        void keyPressed(int key);
private:
    std::vector<Particle*> particles;
};
```

`ofApp.cpp`
```cpp
#include "ofApp.h"

void Subject::addObserver(Observer* observer) {
    observers.push_back(observer);
}

void Subject::removeObserver(Observer* observer) {
    observers.erase(std::remove(observers.begin(), observers.end(), observer), observers.end());
}

void Subject::notify(const std::string& event) {
    for (Observer* observer : observers) {
        observer->onNotify(event);
    }
}

Particle::Particle() {
    // Inicializar propiedades
    position = ofVec2f(ofRandomWidth(), ofRandomHeight());
    velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
    size = ofRandom(2, 5);
    color = ofColor(255);

    state = new NormalState();
}

Particle::~Particle() {
    delete state;
}

void Particle::setState(State* newState) {
    if (state != nullptr) {
        state->onExit(this);
        delete state;
    }
    state = newState;
    if (state != nullptr) {
        state->onEnter(this);
    }
}

void Particle::update() {
    if (state != nullptr) {
        state->update(this);
    }
    // Mantener las partículas dentro de la ventana
    if (position.x < 0 || position.x > ofGetWidth()) velocity.x *= -1;
    if (position.y < 0 || position.y > ofGetHeight()) velocity.y *= -1;
}

void Particle::draw() {
    ofSetColor(color);
    ofDrawCircle(position, size);
}

void Particle::onNotify(const std::string& event) {
    if (event == "attract") {
        setState(new AttractState());
    }
    else if (event == "repel") {
        setState(new RepelState());
    }
    else if (event == "stop") {
        setState(new StopState());
    }
    else if (event == "normal") {
        setState(new NormalState());
    }
}

void NormalState::update(Particle* particle) {
    particle->position += particle->velocity;
}

void NormalState::onEnter(Particle* particle) {
    particle->velocity = ofVec2f(ofRandom(-0.5f, 0.5f), ofRandom(-0.5f, 0.5f));
}

void AttractState::update(Particle* particle) {
    ofVec2f mousePosition(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
    ofVec2f direction = mousePosition - particle->position;
    direction.normalize();
    particle->velocity += direction * 0.05;
    ofClamp(particle->velocity.x, -3, 3);
    particle->position += particle->velocity * 0.2;
}

void RepelState::update(Particle* particle) {
    ofVec2f mousePosition(((ofApp*)ofGetAppPtr())->mouseX, ((ofApp*)ofGetAppPtr())->mouseY);
    ofVec2f direction = particle->position - mousePosition;
    direction.normalize();
    particle->velocity += direction * 0.05;
    ofClamp(particle->velocity.x, -3, 3);
    particle->position += particle->velocity * 0.2;
}

void StopState::update(Particle* particle) {
    particle->velocity.x = 0;
    particle->velocity.y = 0;
}

Particle* ParticleFactory::createParticle(const std::string& type) {
    Particle* particle = new Particle();

    if (type == "star") {
        particle->size = ofRandom(2, 4);
        particle->color = ofColor(255, 0, 0);
    }
    else if (type == "shooting_star") {
        particle->size = ofRandom(3, 6);
        particle->color = ofColor(0, 255, 0);
        particle->velocity *= 3;
    }
    else if (type == "planet") {
        particle->size = ofRandom(5, 8);
        particle->color = ofColor(0, 0, 255);
    }
    return particle;
}


void ofApp::setup() {
    ofBackground(0);
    // Crear partículas usando la fábrica
    for (int i = 0; i < 100; ++i) {
        Particle* p = ParticleFactory::createParticle("star");
        particles.push_back(p);
        addObserver(p);
    }

    for (int i = 0; i < 5; ++i) {
        Particle* p = ParticleFactory::createParticle("shooting_star");
        particles.push_back(p);
        addObserver(p);
    }

    for (int i = 0; i < 10; ++i) {
        Particle* p = ParticleFactory::createParticle("planet");
        particles.push_back(p);
        addObserver(p);
    }

}


void ofApp::update() {
    for (Particle* p : particles) {
        p->update();
    }
}


void ofApp::draw() {
    for (Particle* p : particles) {
        p->draw();
    }
}

void ofApp::keyPressed(int key) {
    if (key == 's') {
        notify("stop");
    }
    else if (key == 'a') {
        notify("attract");
    }
    else if (key == 'r') {
        notify("repel");
    }
    else if (key == 'n') {
        notify("normal");
    }
}
```

### Despues de analizar el codigo vamos a responder las siguientes preguntas
Ahora te pediré que te tomes un tiempo para analizar el código y entender su funcionamiento.

- ¿Qué hace el patrón observer en este caso?

Es el que esta atento para notificar a las peloticas osea a los suscriptores lso eventos de las teclas, y asi podremos al presionar una tecla llamar eventos y luego se notifica ese evento para que cambie cosas dentro de la app, como cambiar el estado de las pelotas.

- ¿Qué hace el patrón factory en este caso?

El patron factory se encarga de crear tres tipos diferentes de pelotas que son: `star`,`shooting_star` y `planet` cada una de estas tiene "parametros diferetes segun el tipo, como el `size`, `color` y en otros casos `velocity. Como si fueran moldes en donde se crean los objetos.

- ¿Qué hace el patrón state en este caso?

Es el que define como se van a comportar las particulas en cada momento, osea en cada estado en el que este, por el momento tenemos estos estados: `NormalState` que es con el que inicia cada objeto, `AttractState`, `RepelState`, `StopState`.

Experimenta con el código y realiza algunas modificaciones para entender mejor su funcionamiento. Por ejemplo:

**Adiciona un nuevo tipo de partícula.**

Bueno lo que hice fue añadirle la particula `meteor` que lo que es es una bolita como el resto pero tiene una estela roja este efecto lo logre con el termino de colas antes utilizado asi que cree un vector que guardara las posicion del meteoro y se los paso a los pequeños circulos y le pedi ayuda a la IA para que pudiera generar un efecto de transparencia entre mas cerca de la cola estubiera.

Modifique el codigo en Draw:
```cpp
if (type == "meteor") {
	for (int i = 0; i < trail.size(); i++) {
		float alpha = ofMap(i, 0, trail.size() - 1, 20, 200); // más transparente al inicio
		float radius = ofMap(i, 0, trail.size() - 1, 2, size * 0.5);
		ofSetColor(255, 50, 50, alpha); // rojo suave con transparencia
		ofDrawCircle(trail[i], radius);
	}
}
```
y en la particula:
```cpp
if (type == "meteor") {
	trail.push_back(position);
	if (trail.size() > 10) trail.erase(trail.begin());
}
```

y obviamente agregue estos vectores al .h, y asi se veria:

![alt text](image.png)


**Adiciona un nuevo estado.**

Bueno quiero agregar un estado que modifique la velocidad de las particulas poniendolas mucho mas rapidas.

Agregue estas dos cositas al cpp y lo defini en el .h:

```cpp
void DashState::onEnter(Particle * particle) {
	particle->velocity *= 10.0f;
	
}
void DashState::update(Particle * particle) {
	
	particle->position += particle->velocity;

	particle->velocity.limit(20);

}
```

Tuve un problema al comienzo, ya que solo cree el update y coloque la multiplicacion en este lo que hacia que se me desaparecieran mis particulas, CLARO por que cada frame la velicidad se multilicaba por 10, algo demasiado grande, por lo que lo dividi en dos cuando se presione la tecla `d` y otro update que va a actualizar la posicion y tambien tiene un limitador de velocidaad para que no pase lo de antes si presionamos muchas veces d.





