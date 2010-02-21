package
{
	import org.flixel.*;

	public class Level06 extends PlayState
	{
        [Embed(source = '../data/Level06/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../data/Level06/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

        public function Level06()
	{
            GroundMap = Ground;
            WallMap = Wall;
            super();

	    postInit();
	}
    }
}

