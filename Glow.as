package
{
	import org.flixel.*;
    import flash.geom.Point;

	public class Glow extends FlxSprite
	{
        [Embed(source='../data/Trap_pitfall_glow.png')] private var ImgGlow:Class;
        
        public function Glow(X:Number, Y:Number):void
		{
            super(X,Y);

            loadGraphic(ImgGlow, true, true, 32, 32); 
            exists = false;

            addAnimation("normal", [0]);
            addAnimation("glow", [1, 2], 4);
		}

        override public function update():void {
           play("glow"); 
           super.update();
        }
    }
}
