package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite 
{
	public var speed:Float = 200;
	public var _weaponCoolDown:Float = 1000;
	public var _weaponOverHeat:Bool = false;
	 
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		scrollFactor.x = 0;
		scrollFactor.y = 0;
		//makeGraphic(64, 64, FlxColor.BLUE);
		loadGraphic(AssetPaths.ship_small_blue_sprite__png, true, 128, 128);
		animation.add("stdby", [0, 1, 2, 3], 15, true);
		animation.add("forward", [4, 5], 15, true);
		animation.add("backward", [6, 7], 15, true);
		animation.add("right", [1], 15, true);
		animation.add("left", [3], 15, true);
		animation.add("forward_right", [1], 15, true);
		animation.add("forward_left", [3], 15, true);
		animation.add("backward_right", [2], 15, true);
		animation.add("backward_left", [0], 15, true);
		animation.play("stdby");
		drag.x = drag.y = 1600;
	}
	
	private function movement():Void
	{
		var _up: Bool = false;
		var _down: Bool = false;
		var _left: Bool = false;
		var _right: Bool = false;
		
		_up = FlxG.keys.anyPressed([UP, W]);
		_down = FlxG.keys.anyPressed([DOWN, S]);
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
		
		if (_up && _down)
		{
			_up = _down = false;
		}
		if (_left && _right)
		{
			_left = _right = false;
		}
		if (_up || _down || _left || _right)
		{
			var mA:Float = 0;
			if (_up)
			{
				mA = -90;
				if (_left)
					mA -= 45;
				else if (_right)
					mA += 45;
			}
			else if (_down)
			{
				mA = 90;
				if (_left)
					mA += 45;
				else if (_right)
					mA -= 45;
			}
			else if (_left)
			{
				mA = 180;
			}
			else if (_right)
			{
				mA = 0;
			}
			
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
			animation.stop();
			if (mA == -90)
				animation.play("forward");
			else if (mA > -90 && mA < 0)
				animation.play("forward_right");
			else if (mA == 0)
				animation.play("right");
			else if (mA > 0 && mA < 90)
				animation.play("backward_right");
			else if (mA == 90)
				animation.play("backward");
			else if (mA > 90 && mA < 180)
				animation.play("backward_left")
			else if (mA == 180)
				animation.play("left");
			else if (mA > -180 && mA < -90)
				animation.play("forward_left");
		}
		else
		{
			if (animation.name != "stdby")
			{
				animation.stop();
				animation.play("stdby");
			}
		}
	}
	
	private function shoot():Void
	{
		if (_weaponOverHeat == false)
		{
			_weaponOverHeat = true;
			var bullet = new Projectile(x, y);
			FlxG.state.add(bullet);
			new FlxTimer().start(_weaponCoolDown / 1000, resetWeaponCoolDown);
		}
	}
	
	private function resetWeaponCoolDown(Timer:FlxTimer):Void
	{
		trace("resetWeaponCoolDown");
		_weaponOverHeat = false;
	}
	
	override public function update(elapsed:Float):Void
	{
		movement();
		if (FlxG.keys.anyPressed([SPACE]))
		{
			shoot();
		}
		super.update(elapsed);
	}
}