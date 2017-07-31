package map;

import components.YoureIt;
import flixel.FlxG;
import ecs.Entity;
import components.*;
import flixel.addons.editors.tiled.*;

class PlayersCreator {
    var playersLayer:TiledObjectLayer;

    var players:Array<Entity> = [];
    var player:Entity;

    var objects:Array<TiledObject>;
    var object:TiledObject;

    public function new() {}

    public function createPlayers() {
        getsPlayersLayer();
        createPlayersFromObjects();
        addInputComponentsToPlayers();
        selectItRandomly();
    }

    function getsPlayersLayer() {
        playersLayer = cast TiledHelper.getLayer(G.PLAYERS_LAYER_NAME);
        objects = playersLayer.objects;
    }

    function createPlayersFromObjects() {
        for (o in objects) {
            this.object = o;
            createNewPlayer();
            pushNewPlayer();
            if (createdEnoughPlayers())
                break;
        }
    }

    function createNewPlayer() {
        player = G.engine.createEntity()
        .addComponent(new PlayerSprite(object.x, object.y))
        .addComponent(new PlayerMovement());
    }

    function pushNewPlayer() {
        players.push(player);
    }

    function createdEnoughPlayers() {
        return players.length >= G.NUM_PLAYERS || players.length >= G.MAX_PLAYERS;
    }

    function selectItRandomly() {
        var randomPlayer = players[FlxG.random.int(0, players.length - 1)];
        randomPlayer.addComponent(new YoureIt());
    }

    function addInputComponentsToPlayers() {
        players[0].addComponent(new WASDInput());
        players[1].addComponent(new ArrowsInput());
    }
}