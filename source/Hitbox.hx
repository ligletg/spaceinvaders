package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
using flixel.util.FlxSpriteUtil;
class Hitbox extends FlxSprite 
{

	public function new() 
	{
		super();
		makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		var lineStyle:LineStyle = { color: FlxColor.RED, thickness: 1 };
		var drawStyle:DrawStyle = { smoothing: true };
		var vertices = new Array<FlxPoint>();
		vertices[0] = new FlxPoint(50, 50);
		vertices[1] = new FlxPoint(50, FlxG.height - 50);
		vertices[2] = new FlxPoint(FlxG.width - 50, FlxG.height - 50);
		vertices[3] = new FlxPoint(FlxG.width - 50, 50);
		vertices[4] = new FlxPoint(50, 50);
		drawPolygon(vertices, FlxColor.TRANSPARENT, lineStyle, drawStyle);
	}
	
}