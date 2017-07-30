package ecs;

import flixel.FlxSprite;
import flixel.group.FlxGroup;

class GroupComponent extends FlxGroup implements Component {
    public var entity(default, null):Entity = Entity.NULL;
    public var sprite(get, never):FlxSprite;

    public function receive(event:EventData) {}

    public function added() {}

    public function removed() {}

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