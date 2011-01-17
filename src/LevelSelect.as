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

        private var _arrowTime:Number = 0;
        private var _arrowAmount:Number = 2;
        private var _arrowInterval:Number = 0.1;

        private var _holdTimer:Number;
        private var _holdInterval:Number = 0.5;

        private var _scrollTimer:Number;
        private var _scrollInterval:Number = 0.05;

        private var _window:Number = 1;

		public function LevelSelect()
		{
            SoundBank.music("level_select");
            levels = new Array();

            var m:SelectScroll;
            m = new SelectScroll();
            add(m);

            if(FlxG.level > 10)
                _window = FlxG.level - 9;

            var level:int;
            for(level=1; level <= Starter.levels; level++) {
                var levelText:FlxText;
                levelText = new FlxText(27,54 + (level * 12),200,
                    level + ". " + (SaveData.completed+1<level?"--------":Starter.levelName(level)));
                levelText.alignment = "left";
                levelText.setFormat("SNES");
                levelText.color = (FlxG.level==level?_light:_dark);
                levels[level-1] = levelText;

                setVisibility(level-1);

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
            
            _upArrow = new ScrollArrow(100, 54, "up");
            _upArrow.visible = false;
            add(_upArrow);
            _downArrow = new ScrollArrow(100, 186, "down");
            add(_downArrow);
            
            setArrows();
            
            _stars = new StarRating(110, 22, SaveData.stars);
            add(_stars);
		}

		override public function update():void
		{
            _arrowTime -= FlxG.elapsed;
            if(_arrowTime <= 0) {
                _upArrow.y = 54;
                _downArrow.y = 186;
            }

            var maxLevel:Number = (SaveData.completed>=Starter.levels?Starter.levels:SaveData.completed+1);

			super.update();

            _scrollTimer += FlxG.elapsed;

            if(FlxG.keys.DOWN)
                _holdTimer -= FlxG.elapsed;
            if(FlxG.keys.UP)
                _holdTimer += FlxG.elapsed;
            if(!FlxG.keys.UP && !FlxG.keys.DOWN)
                _holdTimer = 0;

            if(FlxG.keys.justPressed("UP") || 
                    _holdTimer > _holdInterval && 
                    _scrollTimer >= _scrollInterval) {
                SoundBank.play("up");
                if(FlxG.level > 1) {
                    moveCursor(FlxG.level - 1);
                } else if(_holdTimer == 0) {
                    moveCursor(maxLevel);
                }
            } else if(FlxG.keys.justPressed("DOWN") || 
                    _holdTimer < -_holdInterval && 
                    _scrollTimer >= _scrollInterval) {
                SoundBank.play("down");
                if(FlxG.level < maxLevel) {
                    moveCursor(FlxG.level + 1);
                } else if(_holdTimer == 0) {
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

            _scrollTimer = 0;

            var i:int;
            
            if(newLevel < _window) {
                if(_arrowTime <= 0)
                    _upArrow.y -= _arrowAmount;
                _arrowTime = _arrowInterval;
                for(i = 0; i < levels.length; i++) {
                    _window = newLevel;
                    setVisibility(i);
                }
            }
            
            if(newLevel > _window + 9) {
                if(_arrowTime <= 0)
                    _downArrow.y += _arrowAmount;
                _arrowTime = _arrowInterval;
                for(i = 0; i < levels.length; i++) {
                    _window = newLevel - 9;
                    setVisibility(i);
                }
            }
            
            setArrows();

            FlxG.level = newLevel;
            var bestTimer:GameTimer = new GameTimer(SaveData.best);
            _stars.rating = SaveData.stars;

            selected = levels[FlxG.level-1] as FlxText;
            selected.color = _light;
            _t.text = "Best: " + (bestTimer.elapsed>5999?"--:--.--":bestTimer.render());
        }

        private function setVisibility(i:int):void {
            levels[i].y = 66 + (i*12) - ((_window-1) * 12);
            if(i < _window - 1)
                levels[i].visible = false;
            else if(i < _window + 9)
                levels[i].visible = true;
            if(i >= _window + 9)
                levels[i].visible = false;
        }

        private function setArrows():void {
            if(_window > 1)
                _upArrow.visible = true;
            else
                _upArrow.visible = false;

            if(_window + 9 < Starter.levels)
                _downArrow.visible = true;
            else
                _downArrow.visible = false;
            
        }
	}
}
