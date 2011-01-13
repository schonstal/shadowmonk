package
{
	import org.flixel.*;

	public class Win extends FlxState
	{
		public function Win()
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"YOU WON THE LEVEL!");
			t.alignment = "center";
            t.setFormat("SNES");
			t.size = 16;
			add(t);
			t = new FlxText(FlxG.width/2-100,FlxG.height-30,200,"Press X to Advance");
			t.alignment = "center";
            t.setFormat("SNES");
			add(t);
			t = new FlxText(FlxG.width/2-100,FlxG.height-20,200,"Press C to Select a Level");
			t.alignment = "center";
            t.setFormat("SNES");
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
