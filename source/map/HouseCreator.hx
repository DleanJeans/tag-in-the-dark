package map;

import flixel.FlxG;
import flixel.addons.editors.tiled.*;

class HouseCreator {
    public static function createHouse() {
        G.houseMap = new TiledMap(AssetPaths.house__tmx);
        new FloorCreator().createFloor();
        new ObjectsCreator().createObjects();
        new WallsCreator().createWalls();
        new PlayersCreator().createPlayers();
        setWorldBounds();
    }

    static function setWorldBounds() {
		var wb = FlxG.worldBounds;
        wb.setSize(G.houseMap.fullWidth, G.houseMap.fullHeight);
		FlxG.camera.setScrollBoundsRect(wb.x, wb.y, wb.width, wb.height);
    }
}