package
{
	import org.flixel.*;

	public class Win extends FlxState
	{
		public function Win()
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"YOU WON THE LEVEL!");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-70,FlxG.height-20,140,"Select a Level (press a #)");
			t.alignment = "center";
			add(t);
            FlxG.flash.start(0xff0000dd);
		}

		override public function update():void
		{
			super.update();
			//if(FlxG.keys.justPressed("1"))
		        FlxG.state = new Level02();

			/*if(FlxG.keys.justPressed("2"))
				FlxG.switchState(Level2);
			if(FlxG.keys.justPressed("3"))
				FlxG.switchState(Level3);
			if(FlxG.keys.justPressed("4"))
				FlxG.switchState(Level4);
			if(FlxG.keys.justPressed("5"))
				FlxG.switchState(Level5);
			if(FlxG.keys.justPressed("6"))
				FlxG.switchState(Level6);
			if(FlxG.keys.justPressed("7"))
				FlxG.switchState(Level7);
			if(FlxG.keys.justPressed("8"))
				FlxG.switchState(Level8);
			if(FlxG.keys.justPressed("9"))
				FlxG.switchState(Level9);*/
		}
	}
}
