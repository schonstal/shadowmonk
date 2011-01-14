package
{
	import org.flixel.*;

	public class Stairs extends FlxObject
	{
        private var _player:Player;
        private var _state:PlayState;
        private var debug:Boolean = true;
        
		public function Stairs(X:Number, Y:Number, ThePlayer:Player):void
		{
            super(X*16,Y*16);

            _player = ThePlayer;
            _state = FlxG.state as PlayState;
            
            width = 16;
            height = 16;
		}

        override public function update():void
        {
            if(collide(_player) || (debug && FlxG.keys.Q)) {
                FlxG.flash.start(0xff0000cc,0.3);
                FlxG.state = new Win(_state.gameTimer.render(), _state.rating); 
            }

            super.update();
        }
	}
}
