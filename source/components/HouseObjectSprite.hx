package components;

import map.TiledHelper;
import flixel.addons.editors.tiled.TiledObject;
import ecs.SpriteComponent;

class HouseObjectSprite extends SpriteComponent {
    public function new(object:TiledObject) {
        super(object.x, object.y);
        makeGraphic(object.width, object.height);
        color = TiledHelper.getColor(object);
        immovable = true;
    }
}