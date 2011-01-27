package
{
	import org.flixel.*;

	public class Lock extends FlxSprite
	{
        [Embed(source='../data/Lock.png')] private var ImgGlow:Class;
        
		private var _pulse:Boolean = true;
		private var _player:Player;
		
		public function Lock(X:Number, Y:Number, ThePlayer:Player):void
		{
            super(X * 16, Y * 16);
			
			_player = ThePlayer;
			
            blend = "add";

            loadGraphic(ImgGlow, true, true, 16, 16); 

			addAnimation("pulse", [0,1,2,3,4,5,6,7], 15, false);
            addAnimation("glow", [8,9,10,11,12,13,14,15], 15);
            addAnimation("fade", [0,19,0,19,0,19,0,16,17,18,19,20,21], 15, false);
            
            width = 16;
            height = 16;

            fixed = true;
		}

        override public function update():void
        {
			if (dead) {
				play("fade");
				if (finished) {
					visible = false;
					exists = false;
				}
			} else {
				if(collide(_player)) {
					if (_pulse) {
						play("pulse");
						if (finished)
							_pulse = false;
					} else {
						play("glow");
					}
				} else {
					play("glow");
					_pulse = true;
				}
			}
          
            super.update();
        }
	}
}
