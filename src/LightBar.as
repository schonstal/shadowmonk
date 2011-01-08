package
{
    import org.flixel.*;

    public class LightBar extends FlxGroup
    {
        protected var _bar:FlxSprite;
        protected var _frame:FlxSprite;
        protected var _size:Number = 44;
        protected var _shine:Shine;
        protected var _shineAlpha:Number = 0.3;
        protected var _state:PlayState;

        public var scale:Number;

        public function LightBar() {
            _state = FlxG.state as PlayState;            

            _bar = new FlxSprite(233, 20);
            _bar.createGraphic(1,16,0xffffffff);
            _bar.scrollFactor.x = _bar.scrollFactor.y = 0;
            _bar.origin.x = _bar.origin.y = 0;
            _bar.scale.x = _size;
            _bar.color = 0xff3e274f;
            add(_bar);

            var lightBarSprite:LightBarSprite = new LightBarSprite();
            add(lightBarSprite);
            
            _shine = new Shine();
            _shine.alpha = _shineAlpha;
            add(_shine);
        }

        override public function update():void {
            super.update();
            _bar.scale.x = _size * scale;
            if(_state.barScale < 1)
                _shine.alpha = _shineAlpha - 0.1;
            else
                _shine.alpha = _shineAlpha;
        }
        
    }
}

