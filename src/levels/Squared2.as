package levels
{
	import org.flixel.*;

	public class Squared2 extends PlayState
	{
        [Embed(source = '../../data/Levels/Squared2/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Squared2/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Crossed Paths";

        public function Squared2() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 9, Direction.RIGHT);
			
			barActive = false;
			
			addArrow(10, 4, 10, 10, 1.2, 0.8);
			addArrow(7, 7, 13, 7, 1.2, 0.2, true);
			
			addForceField(9, 9);
			addForceField(10, 8);
			addForceField(9, 7);
			addForceField(11, 5);
			
            addStairs(12, 9);
		}
	}
}

