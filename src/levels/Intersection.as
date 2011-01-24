package levels
{
	import org.flixel.*;

	public class Intersection extends PlayState
	{
        [Embed(source = '../../data/Levels/Intersection/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Intersection/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Two Birds";

        public function Intersection() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 4, Direction.RIGHT);
			
			barActive = false;
			
			addArrow(10, 3, 10, 10, .8, .8);
			
			addKey(8, 8, new FlxPoint(11, 7), new FlxPoint(11, 9));
			addKey(12, 5, new FlxPoint(12, 8));
			
			addForceField(11, 4, false, false);
			addForceField(9, 9, false, false);
			
            addStairs(12, 9);
		}
	}
}

