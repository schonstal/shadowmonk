package
{
	import org.flixel.*;
    import flash.geom.Point;

	public class Level1 extends PlayState
	{
        [Embed(source = '../data/exports/lvl01/layer_0.txt', mimeType = "application/octet-stream")] private var GroundMap:Class;
        [Embed(source = '../data/exports/lvl01/layer_1.txt', mimeType = "application/octet-stream")] private var WallMap:Class;

        public function Level1()
		{
            super();
            
            _player = new Player(3,11,2);
            lyrSprites.add(_player);
            _player.light = new Light(_player);
            _lights.push(_player.light);
            _player.light.exists = false;

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

