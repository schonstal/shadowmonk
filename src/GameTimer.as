package
{
    import org.flixel.*;

    public class GameTimer
    {
        private var _elapsed:Number = 0;
        private var _stopped:Boolean = false;

        public function GameTimer(fixed:Number = 0) {
            if(fixed > 0) {
                _stopped = true;
                _elapsed = fixed;
            }
        } 

        public function update():void {
            if(!_stopped)
                _elapsed += FlxG.elapsed;
        }
        
        public function render():String {
            var minutes:Number = Math.floor(_elapsed / 60);
            var seconds:Number = Math.floor(_elapsed % 60);
            var milliseconds:Number = (_elapsed - Math.floor(_elapsed)) * 1000;
            return zeroPad(minutes, 2) + ":" + zeroPad(seconds, 2) + "." + zeroPad(milliseconds, 2);
        }
        
        public function zeroPad(value:int, width:int):String {
            var num:String = "" + value;
            var ret:String = "";
            var i:int;

            for (i = 0; i < num.length; i++)
            {
                if(ret.length < width)
                    ret += num.charAt(i);
                else
                    break;
            }

           
            while( ret.length < width )
                ret="0" + ret;
            return ret;
        }

        public function get elapsed():Number {
            return _elapsed;
        }

        public function stop():void {
            _stopped = true;
        }

        public function start():void {
            _stopped = false;
        }
    }
}
