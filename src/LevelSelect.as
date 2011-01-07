package
{
	import org.flixel.*;

	public class LevelSelect extends FlxState
	{
        [Embed(source='../data/Level_select.png')] private var ImgGlow:Class;

        private var levels:Array;

		public function LevelSelect()
		{
            var m:SelectScroll;
            m = new SelectScroll();
            add(m);

			var t:FlxText;
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"Press X to Play");
			t.alignment = "center";
			add(t);
		}

		override public function update():void
		{
			super.update();
			if(FlxG.keys.justPressed("X"))
				FlxG.state = new Level01();
		}
	}
}
