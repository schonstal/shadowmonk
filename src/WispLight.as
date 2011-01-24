package
{
    import org.flixel.*;
    
    public class WispLight extends Wisp
    {
		[Embed(source = "../data/WispLight.png")] private var ImgWisp:Class;

        public function WispLight(X:Number, Y:Number, ThePlayer:Player):void
        {			
            super(X, Y, ThePlayer);
			loadGraphic(ImgWisp, true, false, 16, 16);
        }
        
        override protected function playerVisible():Boolean {
			return !_player.light.exists;
		}
    }
    
}
