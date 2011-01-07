package
{
	import org.flixel.*;

	public class SelectScroll extends FlxSprite
	{
        [Embed(source='../data/Level_select.png')] private var ImgScroll:Class;
        
        public function SelectScroll():void
		{
            super(0,0);

            loadGraphic(ImgScroll, true, true, 320, 240); 
		}

        override public function update():void {
           super.update();
        }
    }
}
