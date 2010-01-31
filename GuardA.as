package
{
	import org.flixel.*;

	public class GuardA extends FlxSprite
	{
        [Embed(source='../data/Guard_A.png')] private var ImgGuard:Class;

        private var _move_speed:int = 50;
        private var _direction:int = 0; //LEFT, RIGHT, UP, DOWN
        private var _heading:Array = new Array(270,90,0,180);
        private var _player:Player;

		public function GuardA(X:Number,Y:Number,ThePlayer:Player):void
		{
    		super(X,Y);
            loadGraphic(ImgGuard, true, true, 16, 16); 

            health = 1;
            _player = ThePlayer;
            
            width = 8;
            height = 14;
            offset.x = 4;
            offset.y = 2;

            addAnimation("normal", [1, 0, 3, 0], 8);
            addAnimation("stopped", [0]);

            _direction = LEFT;
		}

        override public function update():void
        {
            if (dead)
            {
                if(finished) 
                    exists = false;
                else
                    super.update();
                return;
            }
            
            if (_player.y > y) {
                velocity.y = _move_speed;
                _direction = DOWN;
            } else if (_player.y < y) {
                velocity.y = -_move_speed;
                _direction = UP;
            } else {
                velocity.y = 0;
            }

            if (_player.x > x) {
                velocity.x = _move_speed;
                _direction = RIGHT;
            } else if (_player.x < x) {
                velocity.x = -_move_speed;
                _direction = LEFT;
            } else {
                velocity.x = 0;
            }
            
            angle = _heading[_direction];

            if (velocity.x == 0 && velocity.y == 0)
                play("stopped");
            else
                play("normal");

            super.update();
        }

        override public function hurt(Damage:Number):void
        {
            return super.hurt(Damage);
        }       
	}
}
