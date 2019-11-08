class Liquid
{
  ArrayList<Particle> particles;
  ArrayList<Connection> springs;
  ArrayList<Quadrilateral> quadrilaterals;

  Liquid()
  {
    particles = new ArrayList<Particle>();
    springs = new ArrayList<Connection>();
    quadrilaterals = new ArrayList<Quadrilateral>();

    int w = 100;
    int h = 50;
    float len = 3;
    float strength = 1;

    for(int y = 0; y < h; y++)
    {
      for(int x = 0; x < w; x++)
      {
        Particle p = new Particle(new Vec3D(width/2 + x * len - w * len/2, len*y, 10));
        physics.addParticle(p);
        particles.add(p);
        if(x > 0)
        {
          Particle previous = particles.get(particles.size() - 2);
          Connection c = new Connection(p, previous, len, strength);
          physics.addSpring(c);
          springs.add(c);
        }

        if(y > 0)
        {
          Particle above = particles.get(particles.size() - w - 1);
          Connection c = new Connection(p, above, len, strength);
          physics.addSpring(c);
          springs.add(c);
        }
        
        if(x > 0 && y > 0) {
          Particle previous = particles.get(particles.size() - 2);
          Particle above = particles.get(particles.size() - w - 1);
          Particle cross = particles.get(particles.size() - w - 2);
          Quadrilateral q = new Quadrilateral(cross,above,p,previous);
          quadrilaterals.add(q);
        }
      }
    }

    for(int i = 0; i < w; i += 1)
    {
      Particle target = particles.get(i);
      target.lock();
      Particle target2 = particles.get(w*(h-1) + i);
      target2.lock();
    }
    
    for(int i = 0; i < h; i += 1) {
      Particle target = particles.get(i*w);
      target.lock();
      Particle target2 = particles.get((i+1)*w-1);
      target2.lock();
    }
  }

  void pressed(int mouseX_, int mouseY_)
  {
    for(Particle p : particles)
    {
      p.pressed(mouseX_, mouseY_);
    }
  }

  void released()
  {
    for(Particle p : particles)
    {
      p.released();
    }
  }

  void update(int mouseX_, int mouseY_)
  {
    for(Particle p : particles)
    {
      p.update(mouseX_, mouseY_);
    }
  }

  void display()
  {
    for(Connection c : springs)
    {
      //c.display();
    }
    for(Particle p : particles)
    {
      //p.display();
    }
    for (Quadrilateral q : quadrilaterals) {
      q.display();
    }
  }
}
