package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
        [Embed(source = '../data/Tileset_dungeon.png')] private var ImgTiles:Class;
	
		//Children load these
		protected var GroundMap:Class;
		protected var WallMap:Class;
        protected var _player:Player;
        
        //Without storing the guards in here before adding them to the array,
        //The game will mysteriously freeze, and not show any darkness
        protected var _guard:Guard;
        protected var _trap:Trap;

        protected var _mask:LightMask;
        protected var _map:FlxTilemap;
        protected var _floor:FlxTilemap;

        protected var _guards:Array;
        protected var _lights:Array;

		public static var lyrStage:FlxGroup;
        public static var lyrSprites:FlxGroup;
        public static var lyrLight:FlxGroup;
        public static var lyrWalls:FlxGroup;
		
        public static var lyrHUD:FlxGroup;
        
        public function PlayState() {
            super();
		}

		public override function create():void {
            lyrStage = new FlxGroup;
            lyrSprites = new FlxGroup;
            lyrLight = new FlxGroup;
            lyrWalls = new FlxGroup;
            lyrHUD = new FlxGroup;

            _guards = new Array;
            _lights = new Array;
			
            _map = new FlxTilemap;
			_map.loadMap(new WallMap, ImgTiles, 16)
			_map.drawIndex = 1;
			_map.collideIndex = 1;
			lyrWalls.add(_map);

			initialize();

			lyrSprites.add(_player);
			_player.light = new Light(_player);
			_lights.push(_player.light);
			_player.light.exists = false;
		   
			_mask = new LightMask(_lights);
			lyrLight.add(_mask);

			FlxG.follow(_player, 2.5);
			FlxG.followAdjust(0.5, 0.5);
			FlxG.followBounds(1,1,640-1,480-1);

			_floor = new FlxTilemap;
			_floor.loadMap(new GroundMap, ImgTiles, 16)
			_floor.drawIndex = 1;
			_floor.collideIndex = 6;
			lyrStage.add(_floor);
			
            var t:FlxText;
			t = new FlxText(FlxG.width/2-50,10,100,"00:00.000");
			t.alignment = "center";
            t.size = 16;
            t.scrollFactor.x = t.scrollFactor.y = 0;
            lyrHUD.add(t);

			this.add(lyrStage);
			this.add(lyrSprites);
			this.add(lyrLight);
			this.add(lyrWalls);
			this.add(lyrHUD);
		}

		public function initialize():void {
			//return "D-F-G#" //Diminishing Returns
		}

        protected function addGuard(Patrol:Array, Heading:int):void {
            _guard = new Guard(Patrol, _player, Heading, _map);
            lyrSprites.add(_guard);
            _lights.push(new Light(_guard));
            _guards.push(_guard);
        }
        
        protected function addTrap(X:Number, Y:Number):void {
            var glow:Glow = new Glow(X*16 - 8, Y*16 - 8);
            _trap = new Trap(X, Y, _map, _player, glow);
            lyrStage.add(_trap);
            lyrWalls.add(glow);
        }

        protected function addStairs(X:Number, Y:Number):void {
            var stairs:Stairs = new Stairs(X, Y, _player);
            lyrSprites.add(stairs);
        }

        override public function update():void {
            super.update();
            _map.collide(_player);
            //FlxU.collide(_guards, _map);
           
        }

        public function createArrow(X:Number, Y:Number, X2:Number, Y2:Number, collideWalls:Boolean = false):void {
            var arrow:Arrow = new Arrow(X, Y, X2, Y2, lyrWalls, collideWalls);
            lyrSprites.add(arrow);
            _lights.push(new Light(arrow));
        }
    }
}
