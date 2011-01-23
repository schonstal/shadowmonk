package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
        [Embed(source='../data/Player.png')] private var ImgPlayer:Class;
        [Embed(source = "../data/Blood.png")] private var ImgBlood:Class;

        private var _move_speed:int = 50;
        private var _max_health:int = 1;
        private var _direction:int = 0; //LEFT, RIGHT, UP, DOWN
        private var _heading:Array = new Array(270,90,0,180);

        private var _recharge:Number = 1;
        private var _lastLight:Number = _recharge;

        private var _state:PlayState;
                
        private var _blood:FlxEmitter;

        public var light:Light;
        public var mobile:Boolean = true;

		public function Player(X:Number,Y:Number,Heading:int):void
		{
    		super(X*16+4,Y*16+4);
            loadGraphic(ImgPlayer, true, true, 16, 16); 

            _state = FlxG.state as PlayState;

            addAnimation("normal", [1, 0, 3, 0], 8);
            addAnimation("stopped", [0]);
			
			width = 10;
			height = 10;
			offset.x = 3;
			offset.y = 3;

            _direction = Heading;
			
		}

        override public function update():void
        {			
			//Check input for player movement
            if (mobile) {
                if (FlxG.keys.LEFT) {
                    _direction = LEFT;
                    velocity.x = -_move_speed;
                } else if (FlxG.keys.RIGHT) {
                    _direction = RIGHT;
                    velocity.x = _move_speed;                
                } else {
                    velocity.x = 0;
                } 
                
                if (FlxG.keys.UP) {
                    _direction = UP;
                    velocity.y = -_move_speed;
                } else if (FlxG.keys.DOWN) {
                    _direction = DOWN;
                    velocity.y = _move_speed;
                } else {
                    velocity.y = 0;
                }
            } else {
                velocity.x = 0;
                velocity.y = 0;
            }
			
			//Check if the light is disabled
			if (!_state.barActive)
				_lastLight = 0.001;
				
			//Recharge the light
            if(light && light.exists) {
                _lastLight = 0;
            } else {
                if(_lastLight < _recharge && _state.barActive)
                    _lastLight += FlxG.elapsed;
            }
            
            if(_lastLight > _recharge)
                _lastLight = _recharge;
            
            _state.barScale = _lastLight / _recharge;

            if (FlxG.keys.justPressed("X") && light && !dead) {
                if(!light.exists && _lastLight >= _recharge) {
                    light.exists = true;
                    SoundBank.play("on");
                } else {
                    if(light.exists)
                        SoundBank.play("off");
                    else
                        SoundBank.play("nope");
                    light.exists = false;
                }
            }

            angle = _heading[_direction];

            if (velocity.x == 0 && velocity.y == 0)
                play("stopped");
            else
                play("normal");

            if(_blood != null)
                _blood.update();

            if(dead)
                _state.barScale = 0.001;
            super.update();
        }

        public function die():void {
			SoundBank.play("trap");
            SoundBank.play("explode");
            var state:PlayState = FlxG.state as PlayState;
            _blood = new FlxEmitter(x, y);
            state.addEmitter(_blood);
            _blood.createSprites(ImgBlood, 60, 0, true, 0);
            _blood.setXSpeed(-50,50);
            _blood.setYSpeed(-50,50);
            _blood.gravity = 0;
            _blood.delay = 20;
            _blood.particleDrag = new FlxPoint(47,47);
            _blood.start();
            dead = true;
            light.exists = false;
            visible = false;
            FlxG.quake.start(0.01, 0.4);
        }
	}
}
