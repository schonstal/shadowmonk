package
{
    import org.flixel.*;
    
    public class WispDark extends Wisp
    {
		[Embed(source = "../data/WispDark.png")] private var ImgWisp:Class;

        public function WispDark(X:Number, Y:Number, ThePlayer:Player):void
        {			
            super(X, Y, ThePlayer);
			loadGraphic(ImgWisp, true, false, 16, 16);
        }
        
        override protected function playerVisible():Boolean {
			return _player.light.exists;
		}
    }
    
}
