package
{
	import org.flixel.*;

	public class DeadSprite extends FlxSprite
	{
        [Embed(source='../data/Dead.png')] private var ImgDead:Class;
        protected var elapsed:Number = 0;
        protected var total:Number = 10
        
        public function DeadSprite():void
		{
            super(0,0);
            loadGraphic(ImgDead, true, true, 320, 240); 
            alpha = 0;
            scrollFactor.x = scrollFactor.y = 0;
		}

        public function fade():void {
            if(dead) {
                elapsed += FlxG.elapsed;
                alpha = elapsed / total;
            }
        }
        
        public function die():void {
            dead = true;
        }
    }
}
