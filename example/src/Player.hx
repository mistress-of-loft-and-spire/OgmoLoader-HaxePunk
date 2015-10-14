package;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.Mask;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import openfl.display.BitmapData;
import openfl.geom.Point;

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
		
		setHitbox(32, 32);
		
		addGraphic(sprite);
		
		super.added();
		
	}
	
	override public function update():Void
	{
		
		var speed_x:Int = 0;
		var speed_y:Int = 0;
		
		if (Input.check(Key.RIGHT))
		{
			speed_x = 2;
		}
		if (Input.check(Key.DOWN))
		{
			speed_y = 2;
		}
		if (Input.check(Key.LEFT))
		{
			speed_x = -2;
		}
		if (Input.check(Key.UP))
		{
			speed_y = -2;
		}
		
		moveBy(speed_x, speed_y, "solid");
		
		super.update();
		
	}
	
}