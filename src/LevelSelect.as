package
{
	import org.flixel.*;

	public class LevelSelect extends FlxState
	{
        [Embed(source='../data/Level_select.png')] private var ImgGlow:Class;

        private var levels:Array;
        private var _t:FlxText;
        private var _oneStar:FlxText;
        private var _twoStar:FlxText;
        private var _threeStar:FlxText;
        private var _stars:StarRating;
        
        //Colors for text
        private var _dark:Number = 0xff000000;
        private var _light:Number = 0xff682777;

        private var _upArrow:ScrollArrow;
        private var _downArrow:ScrollArrow;

        //Moving arrow timers (when scrolling list)
        private var _arrowTime:Number = 0;
        private var _arrowAmount:Number = 2;
        private var _arrowInterval:Number = 0.1;

        //Hold-to-scroll hold amount
        private var _holdTimer:Number;
        private var _holdInterval:Number = 0.5;

        //Hold-to-scroll interval
        private var _scrollTimer:Number;
        private var _scrollInterval:Number = 0.05;

        //First displayed item on the list
        private var _window:Number = 1;

		public function LevelSelect()
		{
            SoundBank.music("level_select");
            levels = new Array();

            var m:SelectScroll;
            m = new SelectScroll();
            add(m);

            //Make sure the window is in the correct place
            if(FlxG.level > 10)
                _window = FlxG.level - 9;

            //Add all the text to the list
            var level:int;
            for(level=1; level <= Starter.levels; level++) {
                var levelText:LevelText;
                levelText = new LevelText(27, 54 + (level * 12), level);

                //Make sure the selected level is hilighted
                levelText.color = (FlxG.level==level?_light:_dark);
                levels[level-1] = levelText;

                //Hide text outside the window
                setVisibility(level-1);

                add(levelText);
            }
            
            var bestTimer:GameTimer = new GameTimer(SaveData.best);

            //Total stars
            _t = new FlxText(203, 9, 92, "" + SaveData.totalStars);
			_t.alignment = "right";
            _t.setFormat("SNES");
            _t.color = 0xffffffff;
			add(_t);

            //Best time
			_t = new FlxText(191, 49, 128, (SaveData.completed>0?bestTimer.render():"--:--.--"));
			_t.alignment = "center";
            _t.setFormat("SNES");
            _t.color = 0xffffffff;
			add(_t);
            
            //Star times
			_oneStar = new FlxText(191, 121, 128, "--:--.--");
			_oneStar.alignment = "center";
            _oneStar.setFormat("SNES");
            _oneStar.color = 0xffffffff;
			add(_oneStar);
			_twoStar = new FlxText(191, 155, 128, "--:--.--");
			_twoStar.alignment = "center";
            _twoStar.setFormat("SNES");
            _twoStar.color = 0xffffffff;
			add(_twoStar);
			_threeStar = new FlxText(191, 189, 128, "--:--.--");
			_threeStar.alignment = "center";
            _threeStar.setFormat("SNES");
            _threeStar.color = 0xffffffff;
			add(_threeStar);

            //"Level Select"
			var t:FlxText = new FlxText(27, 42, 158, "Level Select");
			t.alignment = "center";
            t.setFormat("SNES");
            t.color = _dark;
			add(t);
            
            //Arrows
            _upArrow = new ScrollArrow(100, 54, "up");
            _upArrow.visible = false;
            add(_upArrow);
            _downArrow = new ScrollArrow(100, 186, "down");
            add(_downArrow);
            
            //Only show the arrows if you can scroll
            setArrows();
            
            //Show the rating for the current level
            _stars = new StarRating(115, 32, SaveData.stars);
            add(_stars);
		}

		override public function update():void
		{
            //Reset the arrows if you haven't pressed up/down for a while
            _arrowTime -= FlxG.elapsed;
            if(_arrowTime <= 0) {
                _upArrow.y = 54;
                _downArrow.y = 186;
            }

			super.update();

            //Allow the player to scroll if they haven't recently
            _scrollTimer += FlxG.elapsed;

            //Check if the player is holding down or up
            if(FlxG.keys.DOWN)
                _holdTimer -= FlxG.elapsed;
            if(FlxG.keys.UP)
                _holdTimer += FlxG.elapsed;
            if(!FlxG.keys.UP && !FlxG.keys.DOWN)
                _holdTimer = 0;

            //If you just pressed UP or if you've been holding it, scroll up
            if(FlxG.keys.justPressed("UP") || 
                    _holdTimer > _holdInterval && 
                    _scrollTimer >= _scrollInterval) {
                if(FlxG.level > 1) {
                    moveCursor(FlxG.level - 1);
                //Don't loop the cursor when the key is held
                } else if(_holdTimer < _holdInterval) {
                    moveCursor(Starter.levels);
                }
            //See if the player wants to go down
            } else if(FlxG.keys.justPressed("DOWN") || 
                    _holdTimer < -_holdInterval && 
                    _scrollTimer >= _scrollInterval) {
                if(FlxG.level < Starter.levels) {
                    moveCursor(FlxG.level + 1);
                } else if(_holdTimer > -_holdInterval) {
                    moveCursor(1);
                }
            //Check if the player wants to start the game
            } else if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("ENTER")) {
                if(FlxG.level <= SaveData.completed+1) {
                    SoundBank.music("game");
                    SoundBank.play("select");
    				FlxG.fade.start(0xff000000, 0.5, function():void { Starter.startLevel() });
                } else {
                    SoundBank.play("nope");
                }
            }
            
		}
        
        private function moveCursor(newLevel:int):void {
            //loop var
            var i:int;

            if(newLevel > FlxG.level)
                SoundBank.play("down");
            else
                SoundBank.play("up");
            
            //Set the previously selected text back to default
            levels[FlxG.level-1].color = _dark;
            
            //Reset the timer so they can't scroll again for a little while (useful for holding)
            _scrollTimer = 0;

            //Scroll the list up
            if(newLevel < _window) {
                //Animate the up arrow
                if(_arrowTime <= 0)
                    _upArrow.y -= _arrowAmount;
                _arrowTime = _arrowInterval;

                //Move the level text down
                for(i = 0; i < levels.length; i++) {
                    _window = newLevel;
                    setVisibility(i);
                }
            }
            
            //Scroll the window down if necessary
            if(newLevel > _window + 9) {
                //Animate down arrow
                if(_arrowTime <= 0)
                    _downArrow.y += _arrowAmount;
                _arrowTime = _arrowInterval;

                //Move the level text up
                for(i = 0; i < levels.length; i++) {
                    _window = newLevel - 9;
                    setVisibility(i);
                }
            }
            
            //Only show the arrow if you can scroll
            setArrows();

            //Update to the new level
            FlxG.level = newLevel;
            var bestTimer:GameTimer = new GameTimer(SaveData.best);
            _stars.rating = SaveData.stars;
            _t.text = (bestTimer.elapsed>5999?"--:--.--":bestTimer.render());
            
            //Hilight the selected text
            levels[FlxG.level-1].color = _light;
        }

        //Sets visibility of a menu item depending on it's index relative to the window
        private function setVisibility(i:int):void {
            //Place the text in the correct position
            levels[i].y = 66 + (i*12) - ((_window-1) * 12);

            //Check if it's in the window, set visibility accordingly
            if(i < _window - 1)
                levels[i].visible = false;
            else if(i < _window + 9)
                levels[i].visible = true;
            if(i >= _window + 9)
                levels[i].visible = false;
        }

        //Hides the arrows if you can't scroll the list, shows them if you can
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
