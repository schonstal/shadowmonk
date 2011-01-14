package
{
	import org.flixel.*;

	public class Win extends FlxState
	{
		public function Win(timer:GameTimer, rating:int)
		{
			var t:FlxText;
			t = new FlxText(0,10,FlxG.width,"LEVEL COMPLETE");
			t.alignment = "center";
            t.setFormat("SNES");
			t.size = 16;
            add(t);
            
            t = new FlxText(0, 54, FlxG.width, "TIME");
            t.alignment = "center";
            t.setFormat("SNES");
            add(t);
            
            t = new FlxText(0, 64, FlxG.width, timer.render());
            t.alignment = "center";
            t.setFormat("SNES");
            add(t);
            
            t = new FlxText(0, 90, FlxG.width, "RANK");
            t.alignment = "center";
            t.setFormat("SNES");
            add(t);
            
            var stars:StarRating = new StarRating(66.5, 52, rating);
            add(stars);
            
            t = new FlxText(0, 130, FlxG.width, "BEST");
            t.alignment = "center";
            t.setFormat("SNES");
            add(t);
            
            t = new FlxText(0, 140, FlxG.width, timer.render());
            t.alignment = "center";
            t.setFormat("SNES");
            add(t);
			
            t = new FlxText(FlxG.width/2-100,FlxG.height-34,200,"Press X to Advance");
			t.alignment = "center";
            t.setFormat("SNES");
			add(t);
			
            t = new FlxText(FlxG.width/2-100,FlxG.height-20,200,"Press C to Select a Level");
			t.alignment = "center";
            t.setFormat("SNES");
			add(t);

            if(FlxG.level > SaveData.completed) {
                SaveData.completed = FlxG.level;
            }
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
