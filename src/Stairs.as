package
{
	import org.flixel.*;

	public class Stairs extends FlxSprite
	{
		[Embed(source = '../data/Exit.png')] private var ImgExit:Class;
		[Embed(source = '../data/Exit_hole.png')] private var ImgHole:Class;
		
        private var _player:Player;
        private var _state:PlayState;
        private var debug:Boolean = true;
        
		public function Stairs(X:Number, Y:Number, ThePlayer:Player):void
		{
            super(X * 16, Y * 16);
			
			loadGraphic(ImgExit, true, true, 16, 16);
			addAnimation("spin", [0, 1, 2, 3, 4, 5, 6, 7], 15);
			
			blend = "add";

            _player = ThePlayer;
            _state = FlxG.state as PlayState;
            
            width = 14;
            height = 14;
			
			fixed = true;
			
			offset.x = 1;
			offset.y = 1;
			
			x += offset.x;
			y += offset.y;
		}

        override public function update():void
        {
			play("spin");
	
            if (collide(_player) || (debug && FlxG.keys.Q)) {
				_player.mobile = false;
                FlxG.fade.start(0xff000000,0.5,function():void {
					FlxG.level++;
					Starter.startLevel();
				});
            }

            super.update();
        }
	}
}
