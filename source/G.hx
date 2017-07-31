package;

class G {
    public static var CIRCLE_RADIUS = 20;
    public static var CIRCLE_DIAMETER = CIRCLE_RADIUS * 2;
    public static var OUTLINE_THICKNESS = 2;

    public static var WALL_THICKNESS = 8;
    public static var HALF_WALL_THICKNESS = WALL_THICKNESS / 2;

    public static var SPEED = 300;

    public static var FROZEN_TIME = 3;

    public static var BLACK = 0xff000000;
    public static var WHITE = 0xffffffff;
    public static var BLUE = 0xff0d47a1;
    public static var DARK_BLUE = 0xff06214c;

    public static var GREEN = 0xff00e676;
    public static var RED = 0xffff5252;
    public static var ICE = 0xffb2ebf2;
    public static var GRASS = 0xff00c853;
    public static var WALL = 0xffcfd8dc;

    public static var engine:ecs.Engine;
    public static var houseMap:flixel.addons.editors.tiled.TiledMap;

    public static inline var OBJECT_LAYER_NAME = "Objects";
    public static inline var WALLS_LAYER_NAME = "Walls";
    public static inline var FLOOR_LAYER_NAME = "Floor";
    public static inline var PLAYERS_LAYER_NAME = "Players";

    public static inline var COLOR_PROPERTY = "color";

    public static var NUM_PLAYERS = 2;
    
    public static var MIN_PLAYERS = 2;
    public static var MAX_PLAYERS = 5;

    public static var DARKNESS_ALPHA = 0.8;

    public static var IN_SIGHT_FOR_MUSIC = 600;
}