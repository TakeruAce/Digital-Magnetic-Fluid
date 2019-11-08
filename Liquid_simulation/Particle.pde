class Particle extends VerletParticle3D
{
  float radius = 2;
  boolean dragged = false;
  boolean pressed = false;
  PVector offset = new PVector();
  int startTime;

  Particle(Vec3D loc)
  {
    super(loc);
  }

  void display()
  {
    fill(175);
    stroke(0);
    translate(x,y,z);
    sphere(1);
    translate(-x,-y,-z);
    //ellipse(x, y, z, radius, radius);
  }

  void pressed(int mouseX_, int mouseY_)
  {
    float d = dist(mouseX_, mouseY_, x, y);
    if(d >= radius){ return; }
    dragged = true;
    pressed = true;
    //addForce(new Vec3D(0,0,100));
    startTime = millis();
    Wave();
  }

  void released()
  {
    pressed = false;
    if(!dragged){ return; }
    unlock();
    dragged = false;
  }

  void update(int mouseX_, int mouseY_)
  {
    //if(!dragged){ return; }
    //set(mouseX_ + offset.x, mouseY_ + offset.y, 0);
    float d = dist(mouseX_, mouseY_, x, y);
    if(d > radius) {return;}
    //addForce(new Vec3D(0,0,100));
    Wave();
  }
  
  // for waving
  void Wave() {
    float T = 1000.0;//[ms]
    float Amp = 20;
    if (pressed) {
      set(x,y,Amp*sin(2 * PI*(millis() - startTime)/T));
    }
  }
}
