package levels
{
	import org.flixel.*;

	public class Pachinko extends PlayState
	{
        [Embed(source = '../../data/Levels/Pachinko/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Pachinko/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Pachinko";

        public function Pachinko() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(2, 8, Direction.RIGHT);
			
			//Top arrow traps
			addArrow(4, 2, 4, 10, 2, 0.5);
			addArrow(8, 2, 8, 12, 2, 0.8);
			addArrow(12, 2, 12, 12, 2, 1.1);
			addArrow(16, 2, 16, 10, 2, 1.4);
			//Bottom arrow traps
			addArrow(6, 14, 6, 5, 2, 0.65);
			addArrow(10, 14, 10, 4, 2, 0.95);
			addArrow(14, 14, 14, 5, 2, 1.25);
			
			//Top force fields
			addForceField(5, 7);
			addForceField(7, 6);
			addForceField(8, 5);
			addForceField(11, 5);
			addForceField(13, 6);
			//Bottom force fields
			addForceField(7, 10);
			addForceField(9, 11);
			addForceField(11, 11);
			addForceField(15, 9);
			//Middle force fields
			addForceField(9, 7);
			addForceField(11, 9);
			addForceField(13, 8);
			//Top arrow chutes
			addForceField(4, 6);
			addForceField(8, 4);
			addForceField(12, 4);
			addForceField(16, 6);
			//Bottom arrow chutes
			addForceField(6, 11);
			addForceField(10, 12);
			addForceField(14, 11);
            
			addStairs(18, 8);
		}
	}
}

