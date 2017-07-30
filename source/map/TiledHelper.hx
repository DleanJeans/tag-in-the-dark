package map;

import flixel.util.FlxColor;
import flixel.addons.editors.tiled.*;

class TiledHelper {
    public static function getLayer(name:String) {
		var lastLayer = null;
		for (layer in G.houseMap.layers) {
			lastLayer = layer;
			if (layer.name == name)
				return  layer;
		}
		return lastLayer;
	}

	public static function getColor(object:TiledObject) {
		if (object.properties.contains(G.COLOR_PROPERTY)) {
			var string = object.properties.get(G.COLOR_PROPERTY);
			var colorInt = FlxColor.fromString(string);
			return colorInt;
		}
		return FlxColor.TRANSPARENT;
	}
}