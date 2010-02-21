package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
        private var f:Boolean = true;

		public function MenuState()
		{
            var m:Title;
            m = new Title();
            add(m);
			var t:FlxText;
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"Press X to Play");
			t.alignment = "center";
			add(t);
		}

		override public function update():void
		{
			super.update();
            if(f) {
                FlxG.flash.start(0xffffffff);
                f = false;
            }
			if(FlxG.keys.justPressed("X"))
				FlxG.state = new Level1();
		}
	}
}
