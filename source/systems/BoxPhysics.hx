package systems;

import flixel.FlxObject;
import components.CircleSprite;
import flixel.FlxSprite;
import flixel.FlxG;
import ecs.System;

class BoxPhysics extends System {
    override public function update(elapsed:Float) {
    	super.update(elapsed);
        
        FlxG.overlap(sprites, sprites, FlxObject.separate, filterTwoCircleSprites);
    }

    function filterTwoCircleSprites(sprite1:FlxSprite, sprite2:FlxSprite) {
        return isNotCircleSprite(sprite1) || isNotCircleSprite(sprite2);
    }

    function isNotCircleSprite(sprite:FlxSprite) {
        return !Std.is(sprite, CircleSprite);
    }
}