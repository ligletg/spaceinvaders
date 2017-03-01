package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Projectile extends FlxSprite 
{

	public var _speed:Float = -300;
	
	public function new(?X:Float=0, ?Y:Float=0, Velocity:Float) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.bullet__png, false, 32, 32);
		FlxG.log.add(Velocity);
		velocity.y = Math.min(_speed + Velocity, _speed);
	}
	
}