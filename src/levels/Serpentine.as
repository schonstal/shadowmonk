package levels
{
	import org.flixel.*;

	public class Serpentine extends PlayState
	{
        [Embed(source = '../../data/Levels/Serpentine/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Serpentine/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Serpentine";

        public function Serpentine() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 5, Direction.RIGHT);
			
			barActive = false;
			
			addArrow(10, 2, 10, 20, 1.75, 1.75);
			
			addKey(13, 15, new FlxPoint(7, 13));
			addKey(7, 12, new FlxPoint(13, 10));
			addKey(13, 9, new FlxPoint(7, 7));
			addKey(7, 6, new FlxPoint(10, 4));
			addKey(11, 20, new FlxPoint(13, 16));
			
			addForceField(9, 3);
			addForceField(7, 5);
			addForceField(13, 8);
			addForceField(7, 11);
			addForceField(13, 14);
			addForceField(10, 6);
			addForceField(10, 7);
			addForceField(10, 9);
			addForceField(10, 10);
			addForceField(10, 12);
			addForceField(10, 13);
			addForceField(10, 15);
			addForceField(10, 16);
			addForceField(11, 19);
			
            addStairs(9, 2);
		}
	}
}

