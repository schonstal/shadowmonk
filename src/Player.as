package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
        [Embed(source='../data/Player.png')] private var ImgPlayer:Class;

        private var _move_speed:int = 50;
        private var _max_health:int = 1;
        private var _direction:int = 0; //LEFT, RIGHT, UP, DOWN
        private var _heading:Array = new Array(270,90,0,180);

        private var _recharge:Number = 1;
        private var _lastLight:Number = _recharge;

        private var _state:PlayState;

        public var light:Light;
        public var mobile:Boolean = true;

		public function Player(X:Number,Y:Number,Heading:int):void
		{
    		super(X*16+4,Y*16+4);
            loadGraphic(ImgPlayer, true, true, 16, 16); 

            //bounding box tweaks
            width = 8;
            height = 8;
            offset.x = 4;
            offset.y = 4;
            
            _state = FlxG.state as PlayState;

            addAnimation("normal", [1, 0, 2, 0], 8);
            addAnimation("stopped", [0]);

            _direction = Heading;
		}

        override public function update():void
        {
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

            if(light && light.exists) {
                _lastLight = 0;
            } else {
                if(_lastLight < _recharge)
                    _lastLight += FlxG.elapsed;
            }
            
            if(_lastLight > _recharge)
                _lastLight = _recharge;
            
            _state.barScale = _lastLight / _recharge;

            if (FlxG.keys.justPressed("X") && light) {
                if(!light.exists && _lastLight >= _recharge)
                    light.exists = true;
                else
                    light.exists = false;
            }

            angle = _heading[_direction];

            if (velocity.x == 0 && velocity.y == 0)
                play("stopped");
            else
                play("normal");

            super.update();
        }
	}
}
