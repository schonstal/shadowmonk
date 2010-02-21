package
{
	import org.flixel.*;
    import flash.geom.Point;

	public class Stairs extends FlxSprite
	{
        [Embed(source='../data/Exit.png')] private var ImgExit:Class;

        private var _player:Player;
        
		public function Stairs(X:Number, Y:Number, ThePlayer:Player):void
		{
            super(X*16,Y*16);
            loadGraphic(ImgExit, true, true, 16, 32); 

            _player = ThePlayer;
            
            width = 16;
            height = 32;
            offset.x = 0;
            offset.y = 0;
		}

        override public function update():void
        {
            if(collide(_player)) {
                FlxG.switchState(Win);
            }

            super.update();
        }
	}
}
