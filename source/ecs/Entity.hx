package ecs;

import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

@:access(ecs.Component)
class Entity extends GroupComponent {
    public static var NULL(default, null) = new Entity();
    public static var NULL_SPRITE(default, null) = new FlxSprite();
    static var spriteMap:SpriteMap = new SpriteMap();

    public static function getEntityOfSprite(sprite:FlxSprite) {
        return spriteMap.get(sprite);
    }

    var engine:Engine = Engine.NULL;
    var components:FlxGroup;

    public function new() {
        super();
        components = new FlxGroup();
        add(components);
    }

    public function addComponent<T:(FlxBasic, Component)>(component:T):Entity {
        components.add(component);
        setComponentToEntity(component);
        mapIfFirstSprite(component);
        return this;
    }

    function setComponentToEntity(component:Component) {
        component.entity = this;
        component.added();
    }

    function mapIfFirstSprite(component:Component) {
        if (isFirstSprite(component))
            spriteMap.set(cast component, this);
    }

    function isFirstSprite(component:Component) {
        return Std.is(component, FlxSprite) && 
        ((sprite == cast component) || (components.length == 0));
    }

    public function removeComponent<T:(FlxBasic, Component)>(component:T):Entity {
        components.remove(component);
        unsetComponentEntity(component);
        removeIfFirstSprite(component);
        return this;
    }

    function unsetComponentEntity(component:Component) {
        component.removed();
        component.entity = Entity.NULL;
    }

    function removeIfFirstSprite(component:Component) {
        if (isFirstSprite(component))
            spriteMap.remove(cast component);
    }

    public function hasComponent(type:Class<Component>) {
        for (c in components) {
            if (Std.is(c, type))
                return true;
        }
        return false;
    }

    public function notify(event:EventData) {
        components.forEach((c) -> {
            (cast c).receive(event);
        });
    }

    override function get_sprite():FlxSprite {
        var first = components.getFirstExisting();
        if (Std.is(first, FlxSprite))
            return cast first;
        else return NULL_SPRITE;
    }

    override public function add(basic:FlxBasic):FlxBasic {
        if (componentsGroupAdded())
            throw "You mean addComponent?";
        return super.add(basic);
    }

    function componentsGroupAdded() {
        return length > 0;
    }

    override public function remove(basic:FlxBasic, splice:Bool = false):FlxBasic {
        throw "You mean removeComponent?";
    }
}