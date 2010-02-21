package
{
	import org.flixel.*;
    import flash.geom.Point;

	public class Level1 extends PlayState
	{
        [Embed(source = '../data/exports/lvl01/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../data/exports/lvl01/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

        public function Level1()
		{
            GroundMap = Ground;
            WallMap = Wall;
            super();
            
            _player = new Player(3,11,2);

            addGuard(new Array(new Point(3,9), new Point (23,9)), 1);
            addTrap(9,4);
            addTrap(9,9);
            addTrap(9,5);
            addTrap(10,11);

            addStairs(26,9);

	        postInit();
		}
	}
}

