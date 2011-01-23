package levels
{
	import org.flixel.*;

	public class Look extends PlayState
	{
        [Embed(source = '../../data/Levels/Look/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Look/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Look";

        public function Look() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 9, Direction.RIGHT);
			
			barActive = false;
			
			addForceField(9, 9);
			
            addStairs(10, 9);
		}
	}
}

