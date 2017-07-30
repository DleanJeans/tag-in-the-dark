package map;

import components.WallSprite;
import flixel.math.FlxPoint;
import flixel.addons.editors.tiled.*;
import ecs.Entity;

class WallsCreator {
	var wallsLayer:TiledObjectLayer;

	var object:TiledObject;
	var wall:Entity;
	var points:Array<FlxPoint>;
	var point:FlxPoint;
	var nextPoint:FlxPoint;

	public function new() {}

    public function createWalls() {
        getWallsLayer();
		createWallsFromObjects();
    }

	function getWallsLayer() {
		wallsLayer = cast TiledHelper.getLayer(G.WALLS_LAYER_NAME);
	}

	function createWallsFromObjects() {
		for (o in wallsLayer.objects) {
			object = o;
			createWallsFromPoints();
		}
	}

	function createWallsFromPoints() {
		points = object.points;
		for (i in 0...points.length - 1) {
			getNextTwoPoints(i);
			createWallFrom2Points();
			offsetWall();
		}
	}

	function getNextTwoPoints(index:Int) {
		point = points[index];
		nextPoint = points[index + 1];
	}

	function createWallFrom2Points() {
		wall = G.engine.createEntity().addComponent(new WallSprite(point, nextPoint));
	}

	function offsetWall() {
		wall.sprite.x += object.x;
		wall.sprite.y += object.y;
	}
}