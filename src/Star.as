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
            //addAnimation("urgent", [2,2,2,1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,1,1,2,2,1,1,2,1,2,1], 30);
            //addAnimation("urgent", [2,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,1,1,1,1,2,2,2,1,1,2], 28);
            addAnimation("urgent", [2,1], 5);
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
