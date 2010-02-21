package
{
	import org.flixel.*;
    import flash.geom.Point;

	public class PlayState extends FlxState
	{
        [Embed(source = '../data/Tileset_dungeon.png')] private var ImgTiles:Class;
        [Embed(source = '../data/lvld/layer_0.txt', mimeType = "application/octet-stream")] private var GroundMap:Class;
        [Embed(source = '../data/lvld/layer_1.txt', mimeType = "application/octet-stream")] private var WallMap:Class;

        private var _player:Player;
        
        //Without storing the guards in here before adding them to the array,
        //The game will mysteriously freeze, and not show any darkness
        private var _guard:Guard;
        private var _trap:Trap;

        private var _mask:LightMask;
        private var _map:FlxTilemap;
        private var _floor:FlxTilemap;

        private var _guards:Array;
        private var _lights:Array;

		public static var lyrStage:FlxLayer;
        public static var lyrSprites:FlxLayer;
        public static var lyrLight:FlxLayer;
        public static var lyrWalls:FlxLayer;
        
        public function PlayState()
		{
            super();
            
            lyrStage = new FlxLayer;
            lyrSprites = new FlxLayer;
            lyrLight = new FlxLayer;
            lyrWalls = new FlxLayer;
            //lyrHUD = new FlxLayer;

            _guards = new Array;
            _lights = new Array;
            
            _player = new Player(1, 1, 3);
            lyrSprites.add(_player);
            _player.light = new Light(_player);
            _lights.push(_player.light);
            _player.light.exists = false;

//            addGuard(new Array(new Point(2,2), new Point(2,8), new Point(8, 8), new Point(8,2)),1);
//            addGuard(new Array(new Point(6,6), new Point(6,14), new Point(6, 4), new Point(3,9)),1);
            addTrap(5,5);
            
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

        private function addGuard(Patrol:Array, Heading:int):void {
            _guard = new Guard(Patrol, _player, Heading);
            lyrSprites.add(_guard);
            _lights.push(new Light(_guard));
            _guards.push(_guard);
        }
        
        private function addTrap(X:Number, Y:Number):void {
            var glow:Glow = new Glow(X*16 - 8, Y*16 - 8);
            _trap = new Trap(X, Y, _map, _player, glow);
            lyrStage.add(_trap);
            lyrWalls.add(glow);
        }

        override public function update():void
        {
            super.update();
            _map.collide(_player);
            _map.collideArray(_guards);
            
            for(var i:int = 0; i < _guards.length; i++) {
                if(_guards[i].spot(_map)) {
                    var arrow:Arrow = new Arrow(_guards[i].x, _guards[i].y, _player, lyrWalls);
                    lyrSprites.add(arrow);
                    _lights.push(new Light(arrow));
                }
            }
        }

	}
}

