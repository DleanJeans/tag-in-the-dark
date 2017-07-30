package map;

import flixel.FlxObject;
import ecs.SpriteComponent;
import flixel.addons.editors.tiled.*;

using flixel.util.FlxSpriteUtil;

class FloorCreator {
    public function new() {}

    public function createFloor() {
        var sprite = new SpriteComponent();
        sprite.makeGraphic(G.houseMap.fullWidth, G.houseMap.fullHeight, 0x0);
        sprite.allowCollisions = FlxObject.NONE;
        
        var floorLayer:TiledObjectLayer = cast TiledHelper.getLayer(G.FLOOR_LAYER_NAME);
        for (roomFloor in floorLayer.objects) {
            var color = TiledHelper.getColor(roomFloor);
            for (point in roomFloor.points) {
                point.add(roomFloor.x, roomFloor.y);
            }
            sprite.drawPolygon(roomFloor.points, color);
        }

        var floor = G.engine.createEntity().addComponent(sprite);
    }
}