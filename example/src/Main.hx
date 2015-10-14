import com.haxepunk.debug.Console.TraceCapture;
import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable(TraceCapture.Yes);
#end
		HXP.scene = new MainScene();
	}

	public static function main() { new Main(); }

}