package levels
{
	import org.flixel.*;

	public class TwoStep extends PlayState
	{
        [Embed(source = '../../data/Levels/TwoStep/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/TwoStep/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Misdirection";

        public function TwoStep() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(6, 3, Direction.RIGHT);
			
			barActive = false;
			
			addArrow(10, 3, 10, 11, .8, .8);
			
			addKey(6, 8, new FlxPoint(11, 4));
			addKey(14, 6, new FlxPoint(9, 10));
			
			addForceField(9, 6, false, false);
			addForceField(11, 8, false, false);
			addForceField(12, 9);
			addForceField(8, 8);
			addForceField(12, 6);
			
            addStairs(14, 11);
		}
	}
}

