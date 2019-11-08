class Quadrilateral {
  Particle v1,v2,v3,v4;
  Quadrilateral(Particle a,Particle b,Particle c,Particle d) {
    v1 = a;
    v2 = b;
    v3 = c;
    v4 = d;
  }
  
  void display() {
    //stroke(0,0,0);
    noStroke();
    fill(0,30,150);
    shininess(5.0);
    beginShape(QUADS);
    vertex(v1.x,v1.y,v1.z);
    vertex(v2.x,v2.y,v2.z);
    vertex(v3.x,v3.y,v3.z);
    vertex(v4.x,v4.y,v4.z);
    endShape();
  }
}
