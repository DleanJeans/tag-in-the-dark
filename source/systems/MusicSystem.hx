package systems;

import flixel.math.FlxMath;
import components.YoureIt;
import components.PlayerSprite;
import ecs.Entity;
import flixel.FlxG;
import ecs.System;
import flixel.system.FlxSound;
import flixel.FlxSprite;

class MusicSystem extends System {
    var seeking:FlxSound;
    var chasing:FlxSound;

    var it:FlxSprite;

    public function new() {
        super();
        var seekingPath = #if flash AssetPaths.ThinkingMusic__mp3 #else AssetPaths.ThinkingMusic__ogg #end;
        var chasingPath = #if flash AssetPaths.RunAmok__mp3 #else AssetPaths.RunAmok__ogg #end;

        seeking = FlxG.sound.load(seekingPath, 1, true);
        chasing = FlxG.sound.load(chasingPath, 1, true);
        chasing.play();
    }

    override function entityIsQualified(entity:Entity) {
        var hasPlayerSprite = entity.hasComponent(PlayerSprite);
        var isIt = entity.hasComponent(YoureIt);
        var notIt = !isIt;

        if (isIt)
            it = entity.sprite;

        return hasPlayerSprite && notIt;
    }

    override public function update(elapsed:Float) {
    	super.update(elapsed);
        changeMusic();
    }

    function changeMusic() {
        if (itChasing()) {
            chasing.play();
            seeking.stop();
        }
        else {
            seeking.play();
            chasing.stop();
        }
    }

    function itChasing() {
        for (s in sprites) {
            var distance = FlxMath.distanceBetween(it, s);
            if (distance <= G.IN_SIGHT_FOR_MUSIC)
                return true;
        }
        return false;
    }
}