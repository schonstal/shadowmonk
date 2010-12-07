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
			if(FlxG.keys.justPressed("ONE"))
				FlxG.state = new Level01();
			if(FlxG.keys.justPressed("TWO"))
				FlxG.state = new Level02();
			if(FlxG.keys.justPressed("THREE"))
				FlxG.state = new Level03();
			if(FlxG.keys.justPressed("FOUR"))
				FlxG.state = new Level04();
			if(FlxG.keys.justPressed("FIVE"))
				FlxG.state = new Level05();
			if(FlxG.keys.justPressed("SIX"))
				FlxG.state = new Level06();
			if(FlxG.keys.justPressed("SEVEN"))
				FlxG.state = new Level07();
			if(FlxG.keys.justPressed("EIGHT"))
				FlxG.state = new Level08();
			if (FlxG.keys.justPressed("NINE"))
				FlxG.state = new Level09();
			/*if (FlxG.keys.justPressed("ZERO"))
				FlxG.state = new Level10();*/
		}
	}
}
