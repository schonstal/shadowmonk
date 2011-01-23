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
			
			//Top arrow traps
			addArrow(7, 3, 7, 9, 1.4, 0.9);
			addArrow(11, 3, 11, 9, 1.4, 1.6);
			//Bottom arrow traps
			addArrow(9, 11, 9, 5, 1.4, 1.25);
			addArrow(13, 11, 13, 5, 1.4, 1.95);
			
			addForceField(8, 6);
			addForceField(10, 8);
			addForceField(12, 6);
			//Top arrow chutes
			addForceField(7, 5);
			addForceField(11, 5);
			//Bottom arrow chutes
			addForceField(9, 9);
			addForceField(13, 9);
			
            addStairs(15, 8);
		}
	}
}

