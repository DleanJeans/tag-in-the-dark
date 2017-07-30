package;

class G {
    public static var CIRCLE_RADIUS = 20;
    public static var CIRCLE_DIAMETER = CIRCLE_RADIUS * 2;
    public static var OUTLINE_THICKNESS = 2;

    public static var WALL_THICKNESS = 8;
    public static var HALF_WALL_THICKNESS = WALL_THICKNESS / 2;

    public static var SPEED = 400;
    public static var GRAVITY = 500;
    public static var JUMP_SPEED = 400;

    public static var FROZEN_TIME = 3;

    public static inline var GREEN = 0xff00e676;
    public static inline var RED = 0xffff5252;
    public static inline var WOOD = 0xffa0522d;
    public static inline var ICE = 0xffb2ebf2;
    public static inline var GRASS = 0xff00c853;
    public static inline var WALL = 0xffcfd8dc;

    public static var engine = new ecs.Engine();
    public static var houseMap:flixel.addons.editors.tiled.TiledMap;

    public static inline var OBJECT_LAYER_NAME = "Objects";
    public static inline var WALLS_LAYER_NAME = "Walls";
    public static inline var FLOOR_LAYER_NAME = "Floor";

    public static inline var COLOR_PROPERTY = "color";
}