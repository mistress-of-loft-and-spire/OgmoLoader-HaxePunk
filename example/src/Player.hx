package;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.Mask;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import openfl.display.BitmapData;

/**
 * ...
 * @author voec
 */
class Player extends Entity
{
	
	public function new(x:Float=0, y:Float=0) 
	{
		super(x, y);
	}
	
	override public function added()
	{
		
		var sprite:Image = new Image(new BitmapData(32, 32, false, 0xFFFF0000));
		
		addGraphic(sprite);
		
		super.added();
		
	}
	
	override public function update():Void
	{
		
		if (Input.check(Key.RIGHT))
		{
			x += 2;
		}
		if (Input.check(Key.DOWN))
		{
			y += 2;
		}
		if (Input.check(Key.LEFT))
		{
			x -= 2;
		}
		if (Input.check(Key.UP))
		{
			y -= 2;
		}
		
		super.update();
		
	}
	
}