package
{
	import org.flixel.*;
    import flash.geom.Point;

	public class Title extends FlxSprite
	{
        [Embed(source='../data/TitleScreen.png')] private var ImgGlow:Class;
        
        public function Title():void
		{
            super(0,0);

            loadGraphic(ImgGlow, true, true, 320, 240); 
		}

        override public function update():void {
           super.update();
        }
    }
}
