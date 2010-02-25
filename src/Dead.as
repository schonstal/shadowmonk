package
{
	import org.flixel.*;

	public class Dead extends FlxState
    {
		public function Dead(Level:Class, Reason:String)
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"YOU ARE DEAD");
			t.size = 16;
			t.alignment = "center";
			add(t);
			
            t = new FlxText(0,FlxG.height/2+8,FlxG.width,Reason);
			t.size = 8;
			t.alignment = "center";
			add(t);

			t = new FlxText(FlxG.width/2-70,FlxG.height-20,140,"Press X to Play Again");
			t.alignment = "center";
			add(t);
            FlxG.flash.start(0xffdd0000);
		}

		override public function update():void
		{
			super.update();
			if(FlxG.keys.justPressed("X"))
				FlxG.state = new Level07();
		}
	}
}
