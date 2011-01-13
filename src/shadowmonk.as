package
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	//[Frame(factoryClass="Preloader")]

	public class shadowmonk extends FlxGame
	{
        [Embed(source = '../data/celtic-bit.ttf', fontFamily="SNES", embedAsCFF="false")] public var CelticFont:String;
		public function shadowmonk()
		{
			super(320,240,MenuState,2);
			//showLogo = false;
		}
	}
}
