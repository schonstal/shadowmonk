package
{
	import org.flixel.*;

	public class LevelSelect extends FlxState
	{
        [Embed(source='../data/Level_select.png')] private var ImgGlow:Class;

        private var levels:Array;
        private var _t:FlxText;
        private var _stars:StarRating;
        
        private var _dark:Number = 0xff000000;
        private var _light:Number = 0xff682777;

        private var _upArrow:ScrollArrow;
        private var _downArrow:ScrollArrow;

		public function LevelSelect()
		{
            SoundBank.music("level_select");
            levels = new Array();

            var m:SelectScroll;
            m = new SelectScroll();
            add(m);

            var level:int;
            for(level=1; level <= Starter.levels; level++) {
                var levelText:FlxText;
                levelText = new FlxText(27,54 + (level * 12),200,
                    level + ". " + (SaveData.completed+1<level?"--------":Starter.levelName(level)));
                levelText.alignment = "left";
                levelText.setFormat("SNES");
                levelText.color = (FlxG.level==level?_light:_dark);
                levels[level-1] = levelText;

                if(level < 11)
                    add(levelText);
            }
            
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

			var t:FlxText = new FlxText(27, 42, 158, "Level Select");
			t.alignment = "center";
            t.setFormat("SNES");
            t.color = _dark;
			add(t);
            
            _stars = new StarRating(110, 22, SaveData.stars);
            add(_stars);
		}

		override public function update():void
		{
            var maxLevel:Number = (SaveData.completed>=Starter.levels?Starter.levels:SaveData.completed+1);

			super.update();

            if(FlxG.keys.justPressed("UP")) {
                SoundBank.play("up");
                if(FlxG.level > 1) {
                    moveCursor(FlxG.level - 1);
                } else {
                    moveCursor(maxLevel);
                }
            } else if(FlxG.keys.justPressed("DOWN")) {
                SoundBank.play("down");
                if(FlxG.level < maxLevel) {
                    moveCursor(FlxG.level + 1);
                } else {
                    moveCursor(1);
                }
            } else if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("ENTER")) {
                SoundBank.music("game");
                SoundBank.play("select");
				FlxG.fade.start(_dark, 0.5, function():void { Starter.startLevel() });
            }
            
		}
        
        private function moveCursor(newLevel:int):void {
            var selected:FlxText = levels[FlxG.level-1] as FlxText;
            selected.color = _dark;
            
            FlxG.level = newLevel;
            var bestTimer:GameTimer = new GameTimer(SaveData.best);
            _stars.rating = SaveData.stars;

            selected = levels[FlxG.level-1] as FlxText;
            selected.color = _light;
            _t.text = "Best: " + (bestTimer.elapsed>5999?"--:--.--":bestTimer.render());
        }
	}
}
