package levels
{
	import org.flixel.*;

	public class Welcome extends PlayState
	{
        [Embed(source = '../../data/Levels/Welcome/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Welcome/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Welcome";

        public function Welcome() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 8, Direction.RIGHT);
			addArrow(10,5,10,9,0.8,0.8);
			addForceField(11,8);
			addForceField(10,7);
            addStairs(12,8);
		}
	}
}

