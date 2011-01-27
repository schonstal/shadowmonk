package
{
	import org.flixel.*;

	public class Diode extends FlxSprite
	{
        [Embed(source='../data/Diode.png')] private var ImgGlow:Class;

        private var _player:Player;
		private var _animation:String;
		private var _heading:uint;
		
		public var touched:Boolean = false;
        
		public function Diode(X:Number, Y:Number, Facing:int, ThePlayer:Player):void
		{
            super(X*16,Y*16);
			
            blend = "add";
			
			heading = Facing;

            loadGraphic(ImgGlow, true, true, 16, 16); 
			
            addAnimation("left", [0,1,2,3,4,5,6,7], 15);
			addAnimation("up", [8,9,10,11,12,13,14,15], 15);
			addAnimation("down", [16,17,18,19,20,21,22,23], 15);
			addAnimation("right", [24,25,26,27,28,29,30,31], 15);
			
            addAnimation("pulse-left", [0, 1, 0, 1], 4, false);
			addAnimation("pulse-up", [0, 2, 0, 2], 4, false);
			addAnimation("pulse-down", [0, 3, 0, 3], 4, false);
			addAnimation("pulse-right", [0, 4, 0, 4], 4, false);

            _player = ThePlayer;
            
            width = 16;
            height = 16;

            fixed = true;
		}
		
		public function set heading(value:uint):void {
			_heading = value;
			
			collideBottom = collideLeft = collideTop = collideRight = false;
			
			switch(_heading) {
				case UP:
					collideTop = true;
					_animation = "up";
					break;
				case DOWN:
					collideBottom = true;
					_animation = "down";
					break;
				case LEFT:
					collideLeft = true;
					_animation = "left";
					break;
				case RIGHT:
					collideRight = true;
					_animation = "right";
					break;
			}
		}

        override public function update():void
        {
			if(!touched) {
				play(_animation);
			}
			if (touched) {
				play("pulse-"+_animation);
			}
			
			if (finished) {
				touched = false;
			}
			
			if (collide(_player)) {
				touched = true;
			}
            
            super.update();
        }
	}
}
