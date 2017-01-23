package;

import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Background extends FlxGroup 
{
	private var _bg:FlxBackdrop;
	private var _stars:FlxBackdrop;
	private var _stars_slow:FlxBackdrop;
	public function new() 
	{
		super();
		_bg = new FlxBackdrop(AssetPaths.space__png, 0, 0, false, true);
		_stars = new FlxBackdrop(AssetPaths.stars_layer__png, 0, 0, false, true);
		_stars_slow = new FlxBackdrop(AssetPaths.stars_layer__png, 0, 0, false, true);
		_bg.velocity.set(0, 50);
		_stars.velocity.set(0, 100);
		_stars_slow.velocity.set(0, 30);
		add(_bg);
		add(_stars);
		add(_stars_slow);
	}
	
}