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
        
        //HUD
        protected var _timer:FlxText;
        protected var _gameTimer:GameTimer;

        protected var _gameOver:Boolean = false;

        public var barScale:Number = 1;
        public var debug:FlxText;
		
        public static var lyrStage:FlxGroup;
        public static var lyrSprites:FlxGroup;
        public static var lyrLight:FlxGroup;
        public static var lyrWalls:FlxGroup;
        public static var lyrHUD:FlxGroup;
        public static var lyrMessage:FlxGroup;
        
        protected var _lightBar:LightBar;
        protected var _deadSprite:DeadSprite;
        
        public function PlayState() {
            super();
		}

		public override function create():void {
            //Create Layers
            lyrStage = new FlxGroup;
            lyrSprites = new FlxGroup;
            lyrLight = new FlxGroup;
            lyrWalls = new FlxGroup;
            lyrHUD = new FlxGroup;
            lyrMessage = new FlxGroup;
            _deadSprite = new DeadSprite();

            //Initialize vars
            _guards = new Array;
            _lights = new Array;
            _gameTimer = new GameTimer;
			
            //Create wall map
            _map = new FlxTilemap;
			_map.loadMap(new WallMap, ImgTiles, 16)
			_map.drawIndex = 1;
			_map.collideIndex = 1;
			lyrWalls.add(_map);

            //Level-specific setup
			initialize();

            //Sprites
			lyrSprites.add(_player);
			_player.light = new Light(_player);
			_lights.push(_player.light);
			_player.light.exists = false;

            //Light		   
			_mask = new LightMask(_lights);
			lyrLight.add(_mask);
            
            //Camera
			FlxG.follow(_player, 2.5);
			FlxG.followAdjust(0.5, 0.5);
			FlxG.followBounds(1,1,640-1,480-1);

            //Stage
			_floor = new FlxTilemap;
			_floor.loadMap(new GroundMap, ImgTiles, 16)
			_floor.drawIndex = 1;
			_floor.collideIndex = 6;
			lyrStage.add(_floor);

            //HUD			
			_timer = new FlxText(10,10,100,"00:00.000");
			_timer.alignment = "left";
            _timer.size = 16;
            _timer.scrollFactor.x = _timer.scrollFactor.y = 0;
            lyrHUD.add(_timer);

            _lightBar = new LightBar();
            lyrHUD.add(_lightBar);
            	
            debug = new FlxText(10,40,200,"");
            debug.alignment = "left";
            debug.size = 8;
            debug.scrollFactor.x = debug.scrollFactor.y = 0;
            lyrHUD.add(debug);

            //Add layers
			this.add(lyrStage);
			this.add(lyrSprites);
			this.add(lyrLight);
			this.add(lyrWalls);
			this.add(lyrHUD);
            this.add(_deadSprite);
            this.add(lyrMessage);
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
            debug.text = "";
            super.update();
            _deadSprite.fade();
            if(!_gameOver) {
                _map.collide(_player);
                _gameTimer.update();
                _timer.text = _gameTimer.render();
                _lightBar.scale = barScale;
            } else {
                if(FlxG.keys.justPressed("X")) {
                    Starter.startLevel();
                } 
                if (FlxG.keys.justPressed("C")) {
                    FlxG.state = new LevelSelect();
                }
            }
            //FlxU.collide(_guards, _map);
        }

        public function createArrow(X:Number, Y:Number, X2:Number, Y2:Number):void {
            var arrow:Arrow = new Arrow(X, Y, X2, Y2, _player);
            arrow.light = new Light(arrow);
            lyrSprites.add(arrow);
            _lights.push(arrow.light);
        }
        
        public function dead(Reason:String = "You Fucked Up"):void {
            if(!_gameOver) {
                var t:FlxText;

                t = new FlxText(FlxG.width/2-70,FlxG.height-30,140,"Press X to Play Again");
                t.alignment = "center";
                t.scrollFactor.x = t.scrollFactor.y = 0;
                lyrMessage.add(t);
                
                t = new FlxText(FlxG.width/2-70,FlxG.height-20,140,"Press C to Select a Level");
                t.alignment = "center";
                t.scrollFactor.x = t.scrollFactor.y = 0;
                lyrMessage.add(t);

                FlxG.flash.start(0xaadd0000, 0.5, _deadSprite.die);
                
                _player.die();

                _gameOver = true;
            }
        }
        
        public function addEmitter(sprite:FlxEmitter):void {
            lyrWalls.add(sprite);
        }
    }
}
