package levels
{
	import org.flixel.*;

	public class ZigZag extends PlayState
	{
        [Embed(source = '../../data/Levels/ZigZag/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/ZigZag/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Zig-Zag";

        public function ZigZag() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(5, 6, Direction.RIGHT);
			
			barActive = false;
			
			addArrow(7, 3, 7, 9, 1.3, 0.9);
			addArrow(9, 10, 9, 4, 1.3, 1.2);
			addArrow(11, 5, 11, 11, 1.3, 1.5);
			
			addForceField(8, 6, false, false);
			addForceField(10, 8, false, false);
			
			addForceField(7, 5);
			addForceField(9, 5);
			addForceField(9, 9);
			addForceField(11, 9);
			
            addStairs(13, 8);
		}
	}
}

