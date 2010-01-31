package
{
	import org.flixel.*;

	public class Guard extends FlxSprite
	{
        [Embed(source='../data/Guard_B.png')] private var ImgGuard:Class;

        private var _move_speed:int = 25;
        private var _direction:int = 0; //LEFT, RIGHT, UP, DOWN
        private var _heading:Array = new Array(270,90,0,180);
        private var _player:Player;

		public function Guard(X:Number,Y:Number,ThePlayer:Player,Heading:int):void
		{
    		super(X*16+4,Y*16+4);
            loadGraphic(ImgGuard, true, true, 16, 16); 

            health = 1;
            _player = ThePlayer;
            
            width = 8;
            height = 14;
            offset.x = 4;
            offset.y = 2;

            addAnimation("normal", [1, 0, 3, 0], 8);
            addAnimation("stopped", [0]);

            _direction = Heading;
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
