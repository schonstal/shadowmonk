package levels
{
	import org.flixel.*;

	public class Serpentine extends PlayState
	{
        [Embed(source = '../../data/Levels/Serpentine/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Serpentine/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "We Meet Again";

        public function Serpentine() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 5, Direction.RIGHT);
			
			barActive = false;
			
			addArrow(10, 2, 10, 20, 1.75, 1.75);
			
			addKey(6, 8, new FlxPoint(10, 4));
			addKey(14, 11, new FlxPoint(7, 8));
			addKey(6, 14, new FlxPoint(13, 11));
			addKey(12, 17, new FlxPoint(7, 14));
			addKey(10, 21, new FlxPoint(11, 17));
			
			addForceField(10, 6);
			addForceField(10, 7);
			addForceField(10, 9);
			addForceField(10, 10);
			addForceField(10, 12);
			addForceField(10, 13);
			addForceField(10, 15);
			addForceField(10, 16);
			
            addStairs(10, 1);
		}
	}
}

