package
{
	import org.flixel.*;

	public class LevelSelect extends FlxState
	{
        [Embed(source='../data/Level_select.png')] private var ImgGlow:Class;

        private var levels:Array;
        private var _maxLevel:Number = 9;
        private var _t:FlxText;

		public function LevelSelect()
		{
            FlxG.level = 1;
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

			_t = new FlxText(220, 30, 200, ""+FlxG.level);
			_t.alignment = "left";
            _t.color = 0xffffffff;
			add(_t);

		}

		override public function update():void
		{
            _t.text = ""+FlxG.level;
			super.update();
            if(FlxG.keys.justPressed("UP")) {
                if(FlxG.level > 1)
                    FlxG.level--;
            }
            if(FlxG.keys.justPressed("DOWN")) {
                if(FlxG.level < _maxLevel)
                    FlxG.level++;
            }
			if(FlxG.keys.justPressed("X"))
				Starter.startLevel();
		}
        
        private function addLevel(level:Number, title:String):void {
			var t:FlxText;
			t = new FlxText(25,30 + (level * 10),200,level + ". " + title);
			t.alignment = "left";
            t.color = 0xff000000;
			add(t);
        }
	}
}
