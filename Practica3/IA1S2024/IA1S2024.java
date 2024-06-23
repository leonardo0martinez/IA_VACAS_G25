package IA1S2024;
import robocode.*;
import java.awt.Color;
import java.util.Random;
import static robocode.util.Utils.normalRelativeAngleDegrees;
import static robocode.util.Utils.normalRelativeAngle;

// API help : https://robocode.sourceforge.io/docs/robocode/robocode/Robot.html

/**
 * IA1S2024 - a robot by (your name here)
 */
public class IA1S2024 extends AdvancedRobot
{
	// Random value to move
	Random random_value = new Random();
	
	public void run() {
		// Tank's colors
		setColors(new Color(63, 0, 113), new Color(251, 37, 118), new Color(51, 47, 208)); // body,gun,radar
		// Robot main loop
		while(true) {
			// Random distance to travel
			int random_number = random_value.nextInt(100) + 300;
			// Make a few turns while traveling
			// Check the wall!
			for(int i = 0; i < 8; i++){
				setAhead(random_number / 8);
				turnRight(360 / 10);
				if (getX() <= 150 || getX() >= getBattleFieldWidth() - 150 || getY() <= 150 || getY() >= getBattleFieldHeight() - 150) {
					avoidTheWall();
				}
			}
		}
	}
	
	public void avoidTheWall(){
		double width = getBattleFieldWidth();
		double height = getBattleFieldHeight();
		// Gen angle to the center of the field
		double angle = Math.atan2(width / 2 - getX(), height / 2 - getY());
		// Make the turn
		turnRightRadians(normalRelativeAngle(angle - getHeadingRadians()));
	}
	// Mantein the aim to the target
	double normalizeBearing(double angle) {
        while (angle > 180) angle -= 360;
        while (angle < -180) angle += 360;
        return angle;
    }
	/**
	 * onScannedRobot: What to do when you see another robot
	 */
	public void onScannedRobot(ScannedRobotEvent e) {
		double distance = e.getDistance();
        
        if (distance <= 500) {
            double angleToEnemy = getHeading() + e.getBearing() - getGunHeading();
            setTurnGunRight(normalizeBearing(angleToEnemy)); // Turn gun towards the enemy
            if (getGunHeat() == 0) { // Fire when gun is ready
                setFire(1); // Adjust fire power as needed
            }
        } else if (distance <= 100 ){
			back(50);
		}
        execute();
	}
	/**
	 * onHitByBullet: What to do when you're hit by a bullet
	 */
	public void onHitByBullet(HitByBulletEvent e) {
		// Get away in diagonally from shoot
		double angle = e.getBearing() + 45;
		if(angle <= Math.PI){
			turnLeft(angle);
		}else{
			turnRight(angle);
		}
		ahead(50);
	}
	/**
	 * onHitWall: What to do when you hit a wall
	 */
	public void onHitWall(HitWallEvent e) {
		// Replace the next line with any behavior you would like
		avoidTheWall();
		ahead(150);
	}
}
