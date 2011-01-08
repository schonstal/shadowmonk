package
{
    import org.flixel.*;

    public class LightBar extends FlxGroup
    {
        [Embed(source = "../data/Sparkle.png")] private var ImgSparkle:Class;

        protected var _bar:FlxSprite;
        protected var _frame:FlxSprite;
        protected var _size:Number = 44;
        protected var _shine:Shine;
        protected var _shineAlpha:Number = 0.3;
        protected var _state:PlayState;
        protected var _sparkles:FlxEmitter;

        public var scale:Number;

        public function LightBar() {
            _state = FlxG.state as PlayState;            

            _bar = new FlxSprite(241, 20);
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
            
            _sparkles = new FlxEmitter(296, 28);
            _sparkles.createSprites(ImgSparkle, 25, 0, true, 0);
            _sparkles.setXSpeed(-20,20);
            _sparkles.setYSpeed(-20,20);
            _sparkles.gravity = 0;
            _sparkles.delay = 0.05;
            _sparkles.particleDrag = new FlxPoint(5,5);
            _sparkles.scrollFactor.x = _sparkles.scrollFactor.y = 0;
            add(_sparkles);
        }

        override public function update():void {
            super.update();
            _bar.scale.x = _size * scale;
            if(_state.barScale < 1) { 
                _shine.alpha = _shineAlpha - 0.1;
            } else {
                _shine.alpha = _shineAlpha;
            }

            if(_state.barScale == 0) {
                if(!_sparkles.on)
                    _sparkles.start(false);
            } else {
                if(_sparkles.on)
                    _sparkles.kill();
            }
        }
        
    }
}

