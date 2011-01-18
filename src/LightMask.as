package
{
	import org.flixel.*;

	public class LightMask extends FlxSprite
	{
        //lights
        private var _entities:Array;
        private var _mask:uint;

		public function LightMask(Entities:Array):void//Entities:Array):void
		{
    		super(0,0);
            createGraphic(320,240,_color);
            blend = "multiply";
            scrollFactor.x = 0;
            scrollFactor.y = 0;

            _entities = Entities;
            _mask = 0xaf0000aa;
		}

        override public function update():void
        {
            fill(_mask);
            for(var i:int = 0; i < _entities.length; i++) {
                _entities[i].update();
                if(_entities[i].exists)
                    draw(_entities[i], _entities[i].x, _entities[i].y);
            }
            
            super.update();
        }
	}
}
