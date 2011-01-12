package
{
    import org.flixel.*;

    public class ArrowTrap extends FlxObject
    {
        private var _state:PlayState;
        private var _refire:Number;
        private var _timer:Number = 0;
        private var _arrow:Arrow = null;
        private var _dest:FlxPoint;
        private var _start:FlxPoint;
        private var _offset:Number;
        private var _started:Boolean = false;

        public function ArrowTrap(X:Number, Y:Number, X2:Number, Y2:Number, refire:Number, offset:Number = 0):void
        {
            super(X*16, Y*16);
            _state = FlxG.state as PlayState;
            _refire = refire;
            _start = new FlxPoint(X * 16, Y * 16);
            _dest = new FlxPoint(X2 * 16, Y2 * 16);
            _offset = offset;
        }

        override public function update():void
        {
            _timer += FlxG.elapsed;
            if(!_started && _timer >= _offset) {
                _started = true;
                _arrow = _state.createArrow(_start.x, _start.y, _dest.x, _dest.y);
                _timer = 0;
            } else if(_started && _timer >= _refire) {
                _arrow.refire();
                _timer = 0;
            }
        }

    }
}
