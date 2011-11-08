class SucraSys {
  
  ArrayList sucras;
  PVector origin;
  
  SucraSys(int num, PVector v) {
    sucras = new ArrayList();
    origin = v.get();
    for (int i=0; i<num; i++) {
      //sucras.add(new Sucra(new PVector(v.x+random(-0.2,0.2), v.y+random(-0.2,0.2), v.z)));
      sucras.add(new Sucra(new PVector(random(0,width), random(0, height), 0)));
    }
  }
  
  void update() {
    for (int i=sucras.size()-1; i >=0; i--) {
      ((Sucra)(sucras.get(i))).update(sucras);
    }
  }
  
  void render() {
    noStroke();
    imageMode(CENTER);
    fill(250,170);
    for (int i=sucras.size()-1; i >=0; i--) {
      ((Sucra)(sucras.get(i))).render();
    }
  }

  
  
  void addParticle(float x, float y) {
    sucras.add(new Sucra(new PVector(x,y)));
  }
  
  void repel(float x, float y, float force) {
    PVector loc = new PVector(x,y,0);
    for (int i=sucras.size()-1; i>=0; i--) {
      Sucra s = (Sucra) sucras.get(i);
      s.repel(loc,force);
    }
  }
  
}
