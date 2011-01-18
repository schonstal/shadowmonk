package
{
	import org.flixel.*;

	public class Glow extends FlxSprite
	{
        [Embed(source='../data/Trap_pitfall_glow.png')] private var ImgGlow:Class;
        
        public function Glow(X:Number, Y:Number):void
		{
            super(X, Y);
			blend = "add";

            loadGraphic(ImgGlow, true, true, 32, 32); 
            exists = false;

            addAnimation("normal", [0]);
            addAnimation("glow", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 15);
		}

        override public function update():void {
           play("glow"); 
           super.update();
        }
    }
}
