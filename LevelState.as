package
{
	import org.flixel.*;

	public class LevelState extends FlxState
	{
        [Embed(source = '../data/Tileset.png')] private var ImgTiles:Class;
        [Embed(source = '../data/lvl01/layer_0.txt', mimeType = "application/octet-stream")] private var GroundMap:Class;
        [Embed(source = '../data/lvl01/layer_1.txt', mimeType = "application/octet-stream")] private var WallMap:Class;
        [Embed(source = '../data/lvl01/spawns.txt', mimeType = "application/octet-stream")] private var HazardMap:Class;

        private var _player:Player;
        private var _guard:GuardA;
        private var _mask:LightMask;
        private var _map:FlxTilemap;
        private var _floor:FlxTilemap;
        private var _spawns:FlxTilemap;

		public static var lyrStage:FlxLayer;
        public static var lyrSprites:FlxLayer;
        public static var lyrLight:FlxLayer;
        public static var lyrWalls:FlxLayer;
        
        public function LevelState()
		{
            super();
            
            lyrStage = new FlxLayer;
            lyrSprites = new FlxLayer;
            lyrLight = new FlxLayer;
            lyrWalls = new FlxLayer;
            
            _player = new Player(16, 16);
            lyrSprites.add(_player);

            _guard = new GuardA(240,74,_player);
            lyrSprites.add(_guard);

            _mask = new LightMask(new Array(new Light(_player), new Light(_guard)));//new Array(new Light(_player)));
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

        override public function update():void
        {
            super.update();
            _map.collide(_player);
            _map.collide(_guard);
        }
	}
}
