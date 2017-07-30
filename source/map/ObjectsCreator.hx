package map;

import flixel.util.FlxColor;
import ecs.SpriteComponent;
import flixel.addons.editors.tiled.*;

class ObjectsCreator {
    var objectsLayer:TiledObjectLayer;

    public function new() {}

    public function createObjects() {
        getObjectsLayer();
        createObjectsFromLayer();
    }

    function getObjectsLayer() {
        objectsLayer = cast TiledHelper.getLayer(G.OBJECT_LAYER_NAME);
    }

    function createObjectsFromLayer() {
        for (object in objectsLayer.objects) {
            var sprite = new SpriteComponent(object.x, object.y);
            sprite.makeGraphic(object.width, object.height);
            sprite.immovable = true;
            if (object.properties.contains(G.COLOR_PROPERTY))
                sprite.color = getColor(object);

            var object = G.engine.createEntity().addComponent(sprite);
        }
    }

    function getColor(object:TiledObject) {
        var colorString = object.properties.get(G.COLOR_PROPERTY);
        var colorInt = FlxColor.fromString(colorString);
        return colorInt;
    }
}