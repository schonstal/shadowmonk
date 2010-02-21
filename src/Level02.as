package
{
	import org.flixel.*;

	public class Level02 extends PlayState
	{
        [Embed(source = '../data/Level02/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../data/Level02/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

        public function Level02()
	{
            GroundMap = Ground;
            WallMap = Wall;
            super();

	    _player = new Player(2,6,2);
            addGuard(new Array(new FlxPoint(7,13), new FlxPoint(13,13), new FlxPoint(13, 18), new FlxPoint(13, 15)), 1);            
	    postInit();
	}
    }
}

