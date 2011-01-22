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
            _player = new Player(1, 7, Direction.RIGHT);
			
			//Top arrow traps
			addArrow(3, 1, 3, 9, 2, 0.5);
			addArrow(7, 1, 7, 11, 2, 0.8);
			addArrow(11, 1, 11, 11, 2, 1.1);
			addArrow(15, 1, 15, 9, 2, 1.4);
			//Bottom arrow traps
			addArrow(5, 13, 5, 4, 2, 0.65);
			addArrow(9, 13, 9, 3, 2, 0.95);
			addArrow(13, 13, 13, 4, 2, 1.25);
			
			//Top force fields
			addForceField(4, 6);
			addForceField(6, 5);
			addForceField(8, 4);
			addForceField(10, 4);
			addForceField(12, 5);
			//Bottom force fields
			addForceField(6, 9);
			addForceField(8, 10);
			addForceField(10, 10);
			addForceField(14, 8);
			//Middle force fields
			addForceField(8, 6);
			addForceField(10, 8);
			addForceField(12, 7);
			//Top arrow chutes
			addForceField(3, 5);
			addForceField(7, 3);
			addForceField(11, 3);
			addForceField(15, 5);
			//Bottom arrow chutes
			addForceField(5, 10);
			addForceField(9, 11);
			addForceField(13, 10);
            
			addStairs(17, 7);
		}
	}
}

