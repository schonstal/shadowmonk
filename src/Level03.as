package
{
	import org.flixel.*;

	public class Level03 extends PlayState
	{
        [Embed(source = '../data/Level03/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../data/Level03/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Way Cool";

        public function Level03() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            FlxG.level = 3;
            _player = new Player(2,8,1);
            addGuard(new Array(new FlxPoint(16,4), new FlxPoint(10,4), new FlxPoint (10,9), new FlxPoint(16,9)), 0);
            addGuard(new Array(new FlxPoint(4,9), new FlxPoint(16,9)), 0);
            addGuard(new Array(new FlxPoint(16, 13), new FlxPoint(7, 13)), 0);
			addTrap(7,12);
			addTrap(7,13);
			addTrap(10,9);

            addStairs(11,13);
        }
    }
}

