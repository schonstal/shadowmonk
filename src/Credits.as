package
{
	import org.flixel.*;

	public class Credits extends FlxState
	{
        private var _location:FlxPoint;

		public function Credits()
		{
            SoundBank.music("credits");
            _location = new FlxPoint;
            _location.x = _location.y = 20;

			var t:FlxText;
			t = new FlxText(0,10,FlxG.width,"CREDITS");
			t.alignment = "center";
            t.setFormat("SNES");
			t.size = 16;
            add(t);
			
            addText("JOSH SCHONSTAL", true);
            addText("Programming");
			addText("Game Design");

            addText("IAN BROCK", true);
            addText("Art");
			addText("Sound");
			addText("Game Desgin");
            
            addText("PATRICK WREN", true);
            addText("Game Design");

            addText("GUERIN MCMURRY", true, false);
            addText("Music", false, false);

            addText("SPECIAL THANKS", true, false);
            addText("Brooks Harrel", false, false);
            addText("Corvus Elrod", false, false);
			addText("Kevin Purdy", false, false);
			
            t = new FlxText(FlxG.width/2-150,FlxG.height-20,300,"Press X to Return to the Main Menu");
			t.alignment = "center";
            t.setFormat("SNES");
			add(t);
		}

		override public function update():void
		{
			super.update();
            if (FlxG.keys.justPressed("ENTER") || FlxG.keys.justPressed("X")) {
				FlxG.music.fadeOut(0.5);
                FlxG.fade.start(0xff000000, 0.5, function():void { FlxG.state = new MenuState(); } );
            }
		}

        private function addText(text:String, gap:Boolean = false, left:Boolean = true, color:Number = 0xffffffff):void {
            var addAmount:Number = (gap?30:12);
            if(left)
                _location.x += addAmount;
            else
                _location.y += addAmount;

			var t:FlxText;
			t = new FlxText((left?0:FlxG.width/2),(left?_location.x:_location.y),FlxG.width/2,text);
			t.alignment = "center";
            t.setFormat("SNES");
			t.color = color;
            add(t);
        }
	}
}
