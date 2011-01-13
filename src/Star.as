package
{
	import org.flixel.*;

	public class Star extends FlxSprite
	{
        [Embed(source='../data/Star.png')] private var ImgStar:Class;
        
		public function Star(X:Number, Y:Number):void
		{
    		super(X, Y);
            loadGraphic(ImgStar, true, true, 16, 16); 
            scrollFactor.x = scrollFactor.y = 0;
            
            addAnimation("on", [1]);
            addAnimation("off", [0]);
		}

        override public function update():void
        {
            if (!dead)
                play("on");
            else
                play("off");
            super.update();
        }
	}
}
