package
{
	import org.flixel.*;

	public class Win extends FlxState
	{
		public function Win(timer:GameTimer, rating:int)
		{
            SoundBank.play("win");
            //Save stuff
            if(timer.elapsed < SaveData.best)
                SaveData.best = timer.elapsed;
            
            var bestTimer:GameTimer = new GameTimer(SaveData.best);

            if(rating > SaveData.stars)
                SaveData.stars = rating;

            if(FlxG.level > SaveData.completed) {
                SaveData.completed = FlxG.level;
            }

            //Display stuff
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

            t = new FlxText(0, 140, FlxG.width, bestTimer.render());
            t.alignment = "center";
            t.setFormat("SNES");
            add(t);
            
            stars = new StarRating(66.5, 77, SaveData.stars);
            add(stars);
            
            t = new FlxText(FlxG.width/2-100,FlxG.height-48,200,"Press Z to Advance");
			t.alignment = "center";
            t.setFormat("SNES");
			add(t);
			
            t = new FlxText(FlxG.width/2-100,FlxG.height-34,200,"Press X to Play Again");
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
            if(FlxG.keys.justPressed("Z")) {
                if(FlxG.level >= Starter.levels) {
                    FlxG.state = new Credits();
                } else {
                    FlxG.level++;
                    Starter.startLevel();
                }
            } 
            if (FlxG.keys.justPressed("C")) {
                FlxG.state = new LevelSelect();
            }
            if(FlxG.keys.justPressed("X")) {
                Starter.startLevel();
            }
		}
	}
}
