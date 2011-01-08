package
{
	import org.flixel.*;

	public class Shine extends FlxSprite
	{
        [Embed(source='../data/Amulet_shine.png')] private var ImgShine:Class;
        
        public function Shine():void
		{
            super(232,4);

            loadGraphic(ImgShine, true, true, 80, 40); 
            scrollFactor.x = scrollFactor.y = 0;
		}

        override public function update():void {
           super.update();
        }
    }
}
