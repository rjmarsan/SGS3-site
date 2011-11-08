  final static PVector ZERO = new PVector(0,0,0);
  static float siz = 30;
  static float idealdist = 20;
  static float particleRandomMovement = 0.1f;
  static float particleDampening = 0.95f;
  static PImage[] particleImages;


class Sucra {
  PVector loc;
  PVector vel;
  PVector acc;
  PImage partimage;
  float weight = 1;
  
  
  
  Sucra(PVector location) {
    acc = new PVector(0,0,0);
    vel = new PVector(0,0,0);
    loc = location.get();
    partimage = particleImages[(int)random(0,particleImages.length)];
    weight = weight + random(-1,1)*0.5f;
  }
  
  
  
  
  void update(ArrayList neighborhood) {
    vel.add(acc);
    loc.add(vel);
    
    /*
    float avgdist = 0;
    PVector average = new PVector(0,0,0);
    for (int i=neighborhood.size()-1; i>=0; i--) {
      PVector diff = PVector.sub(((Sucra)neighborhood.get(i)).loc, loc);
      average.add(diff);
      avgdist -= (idealdist - diff.dist(ZERO));
    }
    avgdist /= neighborhood.size();
    println("Avgdist: "+avgdist);
    average.normalize();
    average.mult(avgdist);
    vel = average;//.add(average);
    */
    vel.x += random(-1,1)*particleRandomMovement / weight;
    vel.y += random(-1,1)*particleRandomMovement / weight;//.add(new PVector(random(-1,1)*particleRandomMovement, random(-1,1)*particleRandomMovement, 0));
    vel.mult(particleDampening);
    bounds(0,width,0,height);
  }
  
  void bounds(float lowx, float highx, float lowy, float highy) {
    if (loc.x < lowx) {
      loc.x = lowx;
      vel.x = -vel.x*2;
    }
    if (loc.x > highx) {
      loc.x = highx;
      vel.x = -vel.x*2;
    }
    if (loc.y < lowy) {
      loc.y = lowy;
      vel.y = -vel.y*2;
    } 
    if (loc.y > highy) {
      loc.y = highy;
      vel.y = -vel.y*2;
    }
  }
  
  void render() {
    float sizz = siz * weight;
    rect(loc.x,loc.y,sizz,sizz);
    //ellipse(loc.x,loc.y,siz,siz);
    //image(partimage,loc.x,loc.y);
    //pushMatrix();
    //translate(loc.x,loc.y);
    //rotate(10);
    //image(particleImage,0,0);
    //popMatrix();
  }
  
  void applyForce(float vx, float vy) {
    vel.x += vx;
    vel.y += vy;
  }
  
  void repel(PVector forceloc, float force) {
    //float randOff = 0.1f;
    float distance = PVector.dist(loc,forceloc);
    distance = 1/distance;//sqrt(distance);
    force = distance * force / weight;
    PVector forcevec = PVector.sub(loc,forceloc);
    forcevec.normalize();
    forcevec.mult(force);
    vel.add(forcevec);
  }
  
}
