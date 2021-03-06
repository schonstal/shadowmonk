package
{
    import org.flixel.*;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.utils.setInterval;

    public class IntroCutscene extends FlxState
    {
        [Embed(source = '../data/TitleScreen.swf')] private var SwfClass:Class;     
        private var movie:MovieClip;
        private var length:Number;

        private var fps:Number = 15;
 
        override public function create():void
        {
            var m:Title;
            m = new Title();
            add(m);

            movie = new SwfClass();
            var zoomFactor:int = 2;
            movie.scaleX = 0.5 * zoomFactor;
            movie.scaleY = 0.5 * zoomFactor;
            addChildAt(movie, 0);
            length = 180;
            movie.addEventListener(Event.EXIT_FRAME, next);
        }

        override public function update():void {
            if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("ENTER")) {
                startGame();
            } 
        }

        private function next(e:Event):void
        {
            length--;
            if (length <= 0)
            {
                startGame();
            }
        }

        private function startGame():void {
                movie.removeEventListener(Event.EXIT_FRAME, next);
                removeChild(movie);
                FlxG.state = new MenuState();
        }
    } 
}
