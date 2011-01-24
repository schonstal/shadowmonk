package levels
{
	import org.flixel.*;

	public class WispTest extends PlayState
	{
        [Embed(source = '../../data/Levels/WispTest/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/WispTest/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Wisp Test Level";

        public function WispTest() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(10, 10, Direction.RIGHT);
			
			addWisp(4, 4,false);
			addWisp(4, 15);
			addWisp(15, 4);
			addWisp(15, 15,false);
			
            addStairs(15, 9);
		}
	}
}

