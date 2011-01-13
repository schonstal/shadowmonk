package
{
	import org.flixel.*;

	public class Star extends FlxSprite
	{
        [Embed(source='../data/Star.png')] private var ImgStar:Class;

        public var urgent:Boolean;
        
		public function Star(X:Number, Y:Number):void
		{
    		super(X, Y);
            loadGraphic(ImgStar, true, true, 16, 16); 
            scrollFactor.x = scrollFactor.y = 0;
            
            addAnimation("on", [1]);
            addAnimation("off", [0]);
            addAnimation("urgent", [0,1], 10);
		}

        override public function update():void
        {
            if (dead)
                play("off");
            else if (!urgent)
                play("on");
            else
                play("urgent");
            super.update();
        }
	}
}
