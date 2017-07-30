package ecs;

import flixel.FlxSprite;
import ecs.Component;
import ecs.Entity;
import ecs.EventData;

class SpriteComponent extends FlxSprite implements Component {
    public var entity(default, null):Entity;
    public var sprite(get, never):FlxSprite;

    public function added() {}

    public function removed() {}

    public function receive(event:EventData) {}

    function notifyEntity(event:EventData) {
        entity.notify(event);
    }

    function executeForEventType(event:EventData, type:Class<EventData>, method:Dynamic->Void) {
        if (Std.is(event, type))
            method(event);
    }

    function get_sprite() {
        return entity.sprite;
    }
}