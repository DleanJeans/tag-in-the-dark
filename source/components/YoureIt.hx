package components;

import flixel.FlxG;
import flixel.FlxCamera.FlxCameraFollowStyle;
import events.EventCollision;
import ecs.EventData;
import ecs.PrimitiveComponent;

class YoureIt extends PrimitiveComponent {
    override public function added() {
        sprite.color = G.RED;
        FlxG.camera.follow(sprite, FlxCameraFollowStyle.TOPDOWN);
        entity.addComponent(new ShortFreezing());
    }

    override public function removed() {
        sprite.color = G.GREEN;
    }

    override public function receive(event:EventData) {
        executeForEventType(event, EventCollision, passThisComponent);
    }

    function passThisComponent(other:EventCollision) {
        if (other.entity.hasNoComponent(PlayerSprite) || entity.hasComponent(ShortFreezing)) return;

        entity.removeComponent(this);
        other.entity.addComponent(this);
        #if flash
        FlxG.sound.play(AssetPaths.Slap__mp3);
        #else
        FlxG.sound.play(AssetPaths.Slap__ogg);
        #end
    }
}