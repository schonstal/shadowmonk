package levels
{
	import org.flixel.*;

	public class Intersection extends PlayState
	{
        [Embed(source = '../../data/Levels/Intersection/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Intersection/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Intersection";

        public function Intersection() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 4, Direction.RIGHT);
			
			addArrow(10, 1, 10, 12, 0.5, 0.5);
			
			addForceField(10, 3);
			addForceField(11, 4);
			addForceField(9, 9);
			
            addStairs(10, 11);
		}
	}
}

