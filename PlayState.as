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
        private var _guard:Guard;
        private var _mask:LightMask;
        private var _map:FlxTilemap;
        private var _floor:FlxTilemap;

        private var _sightLimit:Number = 0.5;
        private var _sightTimer:Number = 0.5;

        private var _shot:Boolean = false;

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

            addGuard(new Array(new Point(2,2), new Point(2,8), new Point(8, 8), new Point(8,2)),1);
            
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

        override public function update():void
        {
            super.update();
            _map.collide(_player);
            _map.collideArray(_guards);
            
            var p:Point;

            for(var i:int = 0; i < _guards.length; i++) {
                if (spotted(i) && !_map.ray(_guards[i].x, _guards[i].y, _player.x, _player.y, p, 0.2) && _player.light.exists) {
                    _sightTimer -= FlxG.elapsed;
                    if(_sightTimer <= 0) {
                        _player.mobile = false;
                        if(!_shot) {
                            var arrow:Arrow = new Arrow(_guards[i].x, _guards[i].y, _player, lyrWalls);
                            lyrSprites.add(arrow);
                            _lights.push(new Light(arrow));
                            _shot = true;
                        }
                    }
                } else {
                    _sightTimer = _sightLimit;
                }
            }
        }

        private function distance(X:Number,Y:Number,X0:Number,Y0:Number):Number {
            var dX:Number = X-X0;
            var dY:Number = Y-Y0;
            return Math.sqrt(dX*dX+dY*dY);
        }

        private function spotted(i:int):Boolean {
            switch (_guards[i].direction) {
                case 0:
                    return _player.x < _guards[i].x;
                case 1:
                    return _player.x > _guards[i].x;
                case 2:
                    return _player.y < _guards[i].y;
                case 3:
                    return _player.y > _guards[i].y;
            }
            return false;
        }
	}
}
