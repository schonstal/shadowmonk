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
			t = new FlxText(FlxG.width/2-70,FlxG.height-30,140,"Press X to Advance");
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-70,FlxG.height-20,140,"Press C to Select a Level");
			t.alignment = "center";
			add(t);
		}

		override public function update():void
		{
			super.update();
            if(FlxG.keys.justPressed("X")) {
                FlxG.level++;
                Starter.startLevel();
            } 
            if (FlxG.keys.justPressed("C")) {
                FlxG.state = new LevelSelect();
            }
		}
	}
}
