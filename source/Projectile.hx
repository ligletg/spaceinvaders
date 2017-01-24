package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Projectile extends FlxSprite 
{

	public var _speed:Float = -200;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.bullet__png, false, 32, 32);
		velocity.y = _speed;
	}
	
}