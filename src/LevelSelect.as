package
{
	import org.flixel.*;

	public class LevelSelect extends FlxState
	{
        [Embed(source='../data/Level_select.png')] private var ImgGlow:Class;

        private var levels:Array;
        private var _t:FlxText;
        private var _stars:StarRating;

		public function LevelSelect()
		{
            levels = new Array();

            var m:SelectScroll;
            m = new SelectScroll();
            add(m);

            addLevel(1, "The Prison");
            addLevel(2, "Grim Thundergod");
            addLevel(3, "Eminent Casket");
            addLevel(4, "Vulgar Cannibal");
            addLevel(5, "Doom Scornflame");
            addLevel(6, "Super Happy");
            addLevel(7, "Really Awesome");
            addLevel(8, "That One Level");
            addLevel(9, "How Are You?");
			addLevel(10, "BLARG");
			addLevel(11, "Arrows");
            
            var bestTimer:GameTimer = new GameTimer(SaveData.best);

            var star:Star = new Star(220,12);
            add(star);
			
            _t = new FlxText(238, 14, 200, "" + SaveData.totalStars);
			_t.alignment = "left";
            _t.setFormat("SNES");
            _t.color = 0xffffffff;
			add(_t);

			_t = new FlxText(220, 30, 200, "Best: " + bestTimer.render());
			_t.alignment = "left";
            _t.setFormat("SNES");
            _t.color = 0xffffffff;
			add(_t);
            
            _stars = new StarRating(110, 22, SaveData.stars);
            add(_stars);
			
            var t:FlxText;
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"Press X to Select");
			t.alignment = "center";
			add(t);

		}

		override public function update():void
		{
			super.update();
            if(FlxG.keys.justPressed("UP")) {
                if(FlxG.level > 1) {
                    moveCursor(FlxG.level - 1);
                } else {
                    moveCursor(SaveData.completed + 1);
                }
            } else if(FlxG.keys.justPressed("DOWN")) {
                if(FlxG.level <= SaveData.completed) {
                    moveCursor(FlxG.level + 1);
                } else {
                    moveCursor(1);
                }
            } else if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("ENTER")) {
				Starter.startLevel();
            }
            
		}
        
        private function addLevel(level:Number, title:String):void {
			var t:FlxText;
			t = new FlxText(25,30 + (level * 12),200,level + ". " + (SaveData.completed+1<level?"--------":title));
			t.alignment = "left";
            t.setFormat("SNES");
            t.color = (FlxG.level==level?0xffffffff:0xff000000);
            levels[level-1] = t;
			add(t);
        }
        
        private function moveCursor(newLevel:int):void {
            var selected:FlxText = levels[FlxG.level-1] as FlxText;
            selected.color = 0xff000000;
            
            FlxG.level = newLevel;
            var bestTimer:GameTimer = new GameTimer(SaveData.best);
            _stars.rating = SaveData.stars;

            selected = levels[FlxG.level-1] as FlxText;
            selected.color = 0xffffffff;
            _t.text = "Best: " + (bestTimer.elapsed>5999?"--:--.--":bestTimer.render());
        }
	}
}
