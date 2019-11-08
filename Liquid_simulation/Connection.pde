class Connection extends VerletSpring3D
{
  Connection(Particle p1, Particle p2, float len, float strength)
  {
    super(p1, p2, len, strength);
  }

  void display()
  {
    stroke(0,0,100);
    line(a.x, a.y, a.z, b.x, b.y, b.z);
  }
}
