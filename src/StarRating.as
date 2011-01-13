package
{
    import org.flixel.*;

    public class StarRating extends FlxGroup
    {
        protected var _state:PlayState;
        protected var _stars:Array;
        public var rating:int;

        public function StarRating(X:Number, Y:Number, Rating:int = 3) {
            x = X;
            y = Y;
            rating = Rating;
            _stars = new Array();

            _state = FlxG.state as PlayState;

            var i:int;
            for(i = 0; i < 3; i++) {
                _stars[i] = new Star(x+(i*18),y);
                add(_stars[i]);
            }
        }

        override public function update():void {
            super.update();
            var i:int;
            
            for (i = 2; i > (rating-1); i--) {
                _stars[i].dead = true;
            }
        }
        
    }
}

