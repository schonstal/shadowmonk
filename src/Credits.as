package
{
	import org.flixel.*;

	public class Credits extends FlxState
	{
        private var _location:FlxPoint;

		public function Credits()
		{
            _location = new FlxPoint;
            _location.x = _location.y = 36;

			var t:FlxText;
			t = new FlxText(0,10,FlxG.width,"CONGRATULATIONS");
			t.alignment = "center";
            t.setFormat("SNES");
			t.size = 16;
            add(t);
			
			t = new FlxText(0,36,FlxG.width,"You Beat the Whole Game!");
			t.alignment = "center";
            t.setFormat("SNES");
            add(t);
            
            addText("PROGRAMMING", true);
            addText("Josh Schonstal");

            addText("ART", true);
            addText("Ian Brock");
            
            addText("LEVEL DESIGN", true);
            addText("Patrick Wren");

            addText("MUSIC", true, false);
            addText("None Yet :(", false, false);

            addText("SPECIAL THANKS", true, false);
            addText("Brooks Harrel", false, false);
            addText("Corvus Elrod", false, false);
			
            t = new FlxText(FlxG.width/2-100,FlxG.height-20,200,"Press C to Select a Level");
			t.alignment = "center";
            t.setFormat("SNES");
			add(t);
		}

		override public function update():void
		{
			super.update();
            if (FlxG.keys.justPressed("C") || FlxG.keys.justPressed("X")) {
                FlxG.state = new LevelSelect();
            }
		}

        private function addText(text:String, gap:Boolean = false, left:Boolean = true):void {
            var addAmount:Number = (gap?36:10);
            if(left)
                _location.x += addAmount;
            else
                _location.y += addAmount;

			var t:FlxText;
			t = new FlxText((left?0:FlxG.width/2),(left?_location.x:_location.y),FlxG.width/2,text);
			t.alignment = "center";
            t.setFormat("SNES");
            add(t);
        }
	}
}
