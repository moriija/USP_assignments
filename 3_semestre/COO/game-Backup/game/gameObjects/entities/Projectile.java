package Entities;
import java.awt.Color;

import game.GameLib;
import game.gameObjects.Entity;

public class Projectile  extends Entity{
    //disparo do player

    public Projectile(double x, double y, double radius, double vx, double vy) {
        super(x, y, radius);
        //variações de super:
            //Player: super(player.getX(), player.getY() - 2 * player.getRadius(), radius);
            //Inimigo1 e Inimigo2: super(enemy.getX(), enemy.getY(), radius);

        VX = vx;
        VY = vy;

        //variações de VX e VY
            // Player: VX = vx; VY = vy;
            // Inimigo1: VX = Math.cos(enemy.getAngle()) * 0.45; VY = Math.sin(enemy.getAngle()) * 0.45 * (-1.0);
            // Inimigo2:  double a = angle + Math.random() * Math.PI/6 - Math.PI/12; VX = Math.cos(a) * 0.30; VY = Math.sin(a) * 0.30;
        setState(ACTIVE);

    }

    public void update(long delta) {
        if(state == ACTIVE){

            /* verificando se projétil saiu da tela */
            if(Y < 0) {

                //projectile_states[i] = INACTIVE;
            }
            else {

                X += VX * delta;
                Y += VY * delta;
            }
        }
    } //tentantdo comitar/
    public void draw() {

    }
}


