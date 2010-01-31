package
{
	import org.flixel.*;

	public class Light extends FlxSprite
	{
        [Embed(source='../data/Light.png')] private var ImgLight:Class;

        private var _guy:FlxSprite;
        private var _mask:LightMask;

		public function Light(Guy:FlxSprite):void
		{
            _guy = Guy;
    		super(_guy.x - 32, _guy.y - 32);
            loadGraphic(ImgLight, false, false, 64, 64); 
            blend = "screen";
		}

        override public function update():void
        {
            x = _guy.getScreenXY().x - 24;
            y = _guy.getScreenXY().y - 24;
            super.update();
        }
	}
}
