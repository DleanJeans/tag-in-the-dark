package map;

import components.HouseObjectSprite;
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
            var entity = G.engine.createEntity().addComponent(new HouseObjectSprite(object));
        }
    }
}