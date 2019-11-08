// Nature of Code : Chapter5 参照

import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.*;


VerletPhysics3D physics;
Liquid liquid;

void setup()
{
  size(640, 360, P3D);
  physics = new VerletPhysics3D();
  physics.addBehavior(new GravityBehavior3D(new Vec3D(0, 0, 0)));
  liquid = new Liquid();
}

void draw()
{
  lights();
  ambientLight(200,200,200);
  background(255);
  translate(0,200);
  rotateX(PI/3);
  physics.update();
  liquid.update(mouseX, mouseY);
  liquid.display();
}

void mousePressed()
{
  liquid.pressed(mouseX, mouseY);
}

void mouseReleased()
{
  liquid.released();
}
