package levels
{
	import org.flixel.*;

	public class Level02 extends PlayState
	{
        [Embed(source = '../../data/Level02/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Level02/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Tubular";

        public function Level02() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
		}

		public override function initialize():void {
            FlxG.level = 2;
            _player = new Player(4,13,1);
            addGuard(new Array(new FlxPoint(7,13), new FlxPoint(14,13), new FlxPoint(14, 18), new FlxPoint(14, 13)), 1);
            addStairs(13, 19);
			addStairs(14,19);
    	}
	}
}

