package
{
	import org.flixel.*;

	public class Lock extends FlxSprite
	{
        [Embed(source='../data/Lock.png')] private var ImgGlow:Class;
        
		public function Lock(X:Number, Y:Number):void
		{
            super(X*16,Y*16);
			
            blend = "add";

            loadGraphic(ImgGlow, true, true, 16, 16); 

            addAnimation("glow", [1,2,3,4,5,6,7,8,9,10], 15);
            addAnimation("pulse", [1,1,1,1,1,1,1,1,1,1], 15);
            addAnimation("fade", [2,2,2,2,2,2,2,2,2,2], 15);
            
            width = 16;
            height = 16;

            fixed = true;
		}

        override public function update():void
        {
            play("glow");            
            super.update();
        }
	}
}
