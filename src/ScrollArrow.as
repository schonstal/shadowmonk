package
{
	import org.flixel.*;

	public class ScrollArrow extends FlxSprite
	{
        [Embed(source='../data/Level_select_arrow.png')] private var ImgScrollArrow:Class;

        private var direction:String;

        public function ScrollArrow(X:Number, Y:Number, Direction:String = "up"):void
		{
    		super(X, Y);
            loadGraphic(ImgScrollArrow, true, true, 16, 16); 
            scrollFactor.x = scrollFactor.y = 0;
            direction = Direction;
            
            addAnimation("up", [0]);
            addAnimation("down", [1]);
		}

        override public function update():void
        {
            play(direction);

            super.update();
        }
	}
}
