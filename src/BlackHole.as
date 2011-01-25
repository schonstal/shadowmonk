package
{
	import org.flixel.*;

	public class BlackHole extends FlxSprite
	{
        [Embed(source='../data/Exit_hole.png')] private var ImgHole:Class;
        
        public function BlackHole(X:Number, Y:Number):void
		{
            super(X*16, Y*16);
			loadGraphic(ImgHole, false, false, 16, 16, true);
			blend = "multiply";
		}
    }
}
