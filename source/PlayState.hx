package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.*;
import ecs.*;
import components.*;
import systems.*;
import map.*;

class PlayState extends FlxState {
	var engine:Engine;
	var player1:Entity;
	var player2:Entity;
	var wall:Entity;

	override public function create() {
		bgColor = G.GRASS;

		engine = G.engine;

		engine.addSystem(new PlayerPhysics());
		engine.addSystem(new BoxPhysics());
		engine.addSystem(new SpriteBound());
		add(engine);

		HouseCreator.createHouse();

		player1 = createPlayer();
		player1
		.addComponent(new WASDInput())
		.addComponent(new YoureIt());

		player2 = createPlayer();
		player2.addComponent(new ArrowsInput());
		player2.sprite.screenCenter();

		FlxG.camera.follow(player2.sprite, FlxCameraFollowStyle.TOPDOWN);
	}

	function createPlayer():Entity {
		return engine.createEntity()
		.addComponent(new PlayerSprite())
		.addComponent(new Movement());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
