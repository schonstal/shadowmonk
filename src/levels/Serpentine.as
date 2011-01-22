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
			
			addArrow(10, 2, 10, 18, 1, 1);
			
			addKey(13, 15, new FlxPoint(7, 13));
			addKey(7, 12, new FlxPoint(13, 10));
			addKey(13, 9, new FlxPoint(7, 7));
			addKey(7, 6, new FlxPoint(10, 4));
			
			addForceField(9, 3);
			addForceField(7, 5);
			addForceField(13, 8);
			addForceField(7, 11);
			addForceField(13, 14);
			
            addStairs(9, 2);
		}
	}
}

