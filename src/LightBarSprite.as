package
{
	import org.flixel.*;

	public class LightBarSprite extends FlxSprite
	{
        [Embed(source='../data/Amulet.png')] private var ImgBar:Class;
        
        private var _state:PlayState;
        private var _fill:Number = 0;

		public function LightBarSprite():void
		{
    		super(224, 4);
            loadGraphic(ImgBar, true, true, 80, 48); 
            scrollFactor.x = scrollFactor.y = 0;
            
            _state = FlxG.state as PlayState;

            addAnimation("charging", [0]);
            addAnimation("full", [1,2,3,4,5,6,7,8], 15);
            addAnimation("glow", [9]);
		}

        override public function update():void
        {
            if (_state.barScale == 0)
                play("glow");
            else if (_state.barScale < 1)
                play("charging");
            else
                play("full");
            super.update();
        }
	}
}
