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
            
            lyrStage = new FlxGroup;
            lyrSprites = new FlxGroup;
            lyrLight = new FlxGroup;
            lyrWalls = new FlxGroup;
            //lyrHUD = new FlxGroup;

            _guards = new Array;
            _lights = new Array;
            
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
            
            _mask = new LightMask(_lights);
            lyrLight.add(_mask);

            FlxG.follow(_player,2.5);
            FlxG.followAdjust(0.5, 0.5);
            FlxG.followBounds(1,1,640-1,480-1);

            _floor = new FlxTilemap;
            _floor.loadMap(new GroundMap, ImgTiles, 16)
            _floor.drawIndex = 1;
            _floor.collideIndex = 6;
            lyrStage.add(_floor);
            
            _map = new FlxTilemap;
            _map.loadMap(new WallMap, ImgTiles, 16)
            _map.drawIndex = 1;
            _map.collideIndex = 6;
            lyrWalls.add(_map);

            this.add(lyrStage);
            this.add(lyrSprites);
            this.add(lyrLight);
            this.add(lyrWalls);
		}
	}
}

