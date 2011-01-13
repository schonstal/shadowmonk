package
{
	import org.flixel.*;

	public class Stairs extends FlxObject
	{
        private var _player:Player;
        
		public function Stairs(X:Number, Y:Number, ThePlayer:Player):void
		{
            super(X*16,Y*16);

            _player = ThePlayer;
            
            width = 16;
            height = 16;
		}

        override public function update():void
        {
            if(collide(_player)) {
                FlxG.state = new Win();
            }

            super.update();
        }
	}
}
