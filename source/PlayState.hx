package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

import flixel.addons.display.FlxBackdrop;

class PlayState extends FlxState
{
	private var _background:Background;
	private var _player:Player;
	
	override public function create():Void
	{
		_background = new Background();
		add(_background);
		_player = new Player(20, 20);
		add(_player);
		FlxG.watch.add(_player, "x");
		FlxG.watch.add(_player, "y");
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.UP)
		{
			FlxG.camera.scroll.add(0, -5);
		}
		
		if (FlxG.keys.pressed.DOWN)
		{
			FlxG.camera.scroll.add(0, 5);
		}
	}
	
}
