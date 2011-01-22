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
            _player = new Player(4, 5, Direction.RIGHT);
			
			//Top arrow traps
			addArrow(6, 2, 6, 8, 1.2, 0.35);
			addArrow(10, 2, 10, 8, 1.2, 0.95);
			//Bottom arrow traps
			addArrow(8, 10, 8, 4, 1.2, 0.65);
			addArrow(12, 10, 12, 4, 1.2, 1.25);
			
			addForceField(7, 5);
			addForceField(9, 7);
			addForceField(11, 5);
			//Top arrow chutes
			addForceField(6, 4);
			addForceField(10, 4);
			//Bottom arrow chutes
			addForceField(8, 8);
			addForceField(12, 8);
			
            addStairs(14, 7);
		}
	}
}

