import peasy.*;
import traer.physics.*;

PeasyCam cam;
ParticleSystem physics = new ParticleSystem(1, 0.01 );
float bloat = 0;
float DEFAULT_BLOAT = 0.2;

class Block {
  float dim;
  float bloat;
  Particle particle;
  
  Block(float xpos, float ypos, float zpos) {
    this.bloat = 0;
    this.dim = 10;
    this.particle = physics.makeParticle(1, xpos, ypos, zpos);
  }
  
  boolean withinPlanet(Planet p) {
    boolean xwithin = (this.particle.position().x() < (p.particle.position().x() + p.radius) && 
                       this.particle.position().x() >= (p.particle.position().x() - p.radius));                  

    boolean ywithin = (this.particle.position().y() < (p.particle.position().y() + p.radius) &&
                       this.particle.position().y() >= (p.particle.position().y() - p.radius));
    
    boolean zwithin = (this.particle.position().z() < (p.particle.position().z() + p.radius) &&
                       this.particle.position().z() >= (p.particle.position().z() - p.radius));
    
    return xwithin && ywithin && zwithin;
  }
  
  void draw() {
    pushMatrix();
    
    if(this.withinPlanet(p)) {
      this.particle.makeFixed();
      this.bloat += DEFAULT_BLOAT;
    }
    
    translate(this.particle.position().x(), 
              this.particle.position().y(),
              this.particle.position().z());
              
    stroke(0);
    fill(0, 0, 0, 0);
    rectMode(CENTER);
    box(dim + sin(bloat));
    
    popMatrix();     
  }
}

ArrayList<Block> blocks = new ArrayList<Block>();

class PlayerView {
  float dim;
 
  PlayerView(float dim) {
    this.dim = dim;
  }
  
  void draw() {
    pushMatrix();
    translate((width/2), (height/2), 0);
    stroke(150);
    fill(0, 0, 0, 0);
    rectMode(CENTER);
    rect(0, 0, dim, dim);
    popMatrix(); 
  }
}

PlayerView pv;

class Planet {
  float xpos;
  float ypos;
  float zpos;
  float radius;
  Particle particle;
  
  Planet(float xpos, float ypos, float zpos, float radius) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.zpos = zpos;
    this.radius = radius;
    this.particle = physics.makeParticle(1, xpos, ypos, zpos); 
    this.particle.makeFixed();
  }
  
  void draw() {
    pushMatrix();
    translate(xpos, ypos, zpos);
    fill(150);
    stroke(0);
    sphere(radius + sin(bloat));
    popMatrix();
  }
}

Planet p;

void setup() {
  size(600, 600, P3D);
  physics.setIntegrator( ParticleSystem.MODIFIED_EULER );
  physics.setGravity(0);
  
  p = new Planet(width/2, height/2, 0, 25);
  pv = new PlayerView(200);
  
  cam = new PeasyCam(this, width/2, height/2, 0, 200);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  background(255);
  physics.tick();
  
  p.draw();
  
  cam.beginHUD();
  pv.draw();
  cam.endHUD();
  
  for(int i = 0; i < blocks.size()-1; i++){
    if(blocks.get(i) != null) {
      blocks.get(i).draw();
    }
  }
  bloat += DEFAULT_BLOAT;
}

void keyPressed() {
  if(key == ' ') {
    float[] pos = cam.getPosition();
    Block b = new Block(pos[0], pos[1], pos[2]);
    physics.makeAttraction(p.particle, b.particle, 250, 0);
    blocks.add(b);
  }
}
