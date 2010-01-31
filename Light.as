package
{
	import org.flixel.*;

	public class Light extends FlxSprite
	{
        [Embed(source='../data/Light.png')] private var ImgLight:Class;

        private var _guy:FlxSprite;
        private var _mask:LightMask;
        
        private var _dingleberries:Number = 0.1;
        private static var _speed:Number = 0.1;


		public function Light(Guy:FlxSprite):void
		{
            _guy = Guy;
    		super(_guy.x - 32, _guy.y - 32);
            loadGraphic(ImgLight, true, false, 64, 64); 
            blend = "screen";
		}

        override public function update():void
        {
            x = _guy.getScreenXY().x - 24;
            y = _guy.getScreenXY().y - 24;
            _dingleberries -= FlxG.elapsed;
            if (_dingleberries <= 0) {
                randomFrame();
                _dingleberries = _speed;
            }
            super.update();
        }
	}
}
