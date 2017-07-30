package ecs;

import flixel.FlxSprite;

interface Component {
    public var entity(default, null):Entity;
    public var sprite(get, never):FlxSprite;

    public function added():Void;
    public function removed():Void;
    public function receive(event:EventData):Void;
}