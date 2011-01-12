package
{
	import org.flixel.*;

	public class LevelSelect extends FlxState
	{
        [Embed(source='../data/Level_select.png')] private var ImgGlow:Class;

        private var levels:Array;
        private var _maxLevel:Number = 10;
        private var _t:FlxText;

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
            addLevel(5, "Celestial Scornflame");
            addLevel(6, "Dominion of the Gravehound");
            addLevel(7, "Summoning of the Carrion-Bird");
            addLevel(8, "Grim Moisturizing Cream");
            addLevel(9, "Desecration of the Destroyer");
			addLevel(10, "BLARG");

			_t = new FlxText(220, 30, 200, "Best: --:--.--");
			_t.alignment = "left";
            _t.color = 0xffffffff;
			add(_t);
			
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
                }
            } else if(FlxG.keys.justPressed("DOWN")) {
                if(FlxG.level < _maxLevel) {
                    moveCursor(FlxG.level + 1);
                }
            } else if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("ENTER")) {
				Starter.startLevel();
            }
            
		}
        
        private function addLevel(level:Number, title:String):void {
			var t:FlxText;
			t = new FlxText(25,30 + (level * 10),200,level + ". " + title);
			t.alignment = "left";
            t.color = (FlxG.level==level?0xffffffff:0xff000000);
            levels[level-1] = t;
			add(t);
        }
        
        private function moveCursor(newLevel:int):void {
            var selected:FlxText = levels[FlxG.level-1] as FlxText;
            selected.color = 0xff000000;

            FlxG.level = newLevel;

            selected = levels[FlxG.level-1] as FlxText;
            selected.color = 0xffffffff;
            _t.text = "Best: 12:34.56";
        }
	}
}
