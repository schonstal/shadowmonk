package levels
{
	import org.flixel.*;

	public class DiodeOne extends PlayState
	{
        [Embed(source = '../../data/Levels/DiodeOne/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/DiodeOne/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Short Circuit";

        public function DiodeOne() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(5, 2, Direction.RIGHT);
			
			barActive = false;
			
			addDiode(8, 2, Direction.LEFT);
			addDiode(7, 3, Direction.DOWN);
			addDiode(10, 7, Direction.UP);
			addDiode(8, 8, Direction.RIGHT);
			addDiode(6, 8, Direction.RIGHT);
			addDiode(14, 7, Direction.DOWN);
			
			addKey(14, 2, new FlxPoint(5, 3));
			addKey(12, 8, new FlxPoint(14, 3));
			
            addStairs(5, 10);
		}
	}
}

