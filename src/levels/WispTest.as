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
			
			addWisp(4, 4, false);
			addWisp(5, 4, false);
			addWisp(4, 5, false);
			addWisp(5, 5, false);
			
			addWisp(4, 15);
			addWisp(5, 15);
			addWisp(4, 16);
			addWisp(5, 16);
			
			addWisp(15, 4);
			addWisp(16, 4);
			addWisp(15, 5);
			addWisp(16, 5);
			
			addWisp(15, 15, false);
			addWisp(16, 15, false);
			addWisp(15, 16, false);
			addWisp(16, 16,false);
			
            addStairs(15, 9);
		}
	}
}

