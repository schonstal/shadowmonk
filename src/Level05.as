package
{
	import org.flixel.*;

	public class Level05 extends PlayState
	{
        [Embed(source = '../data/Level05/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../data/Level05/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

        public function Level05()
	{
            GroundMap = Ground;
            WallMap = Wall;
            super();

	    postInit();
	}
    }
}

