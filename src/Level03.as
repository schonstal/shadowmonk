package
{
	import org.flixel.*;

	public class Level03 extends PlayState
	{
        [Embed(source = '../data/Level03/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../data/Level03/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

        public function Level03() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(2,8,1);
            addGuard(new Array(new FlxPoint(16,4), new FlxPoint(16,4)), 0);
            addGuard(new Array(new FlxPoint(16,9), new FlxPoint(16,9)), 0);
            addGuard(new Array(new FlxPoint(16,13), new FlxPoint(16,13)), 0);

            addStairs(13,14);
        }
    }
}

