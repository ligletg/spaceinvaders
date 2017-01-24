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
	private var _hitbox:Hitbox;
	
	override public function create():Void
	{
		_background = new Background();
		add(_background);
		_player = new Player(450, 600);
		add(_player);
		_hitbox = new Hitbox();
		add(_hitbox);
		FlxG.watch.add(_player, "x");
		FlxG.watch.add(_player, "y");
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _hitbox);
	}
	
}
