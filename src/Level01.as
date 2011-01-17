package
{
	import org.flixel.*;

	public class Level01 extends PlayState
	{
        [Embed(source = '../data/Level01/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../data/Level01/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Gnarly";

        public function Level01() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            FlxG.level = 1;
            _player = new Player(3,13,2);
            addGuard(new Array(new FlxPoint(3, 9), new FlxPoint (23, 9)), 1);
			addTrap(9,12);
            addStairs(26,9);
		}
	}
}

