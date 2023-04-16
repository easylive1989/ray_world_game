import 'dart:ui';

import 'package:flame/game.dart';
import 'package:ray_world_game/direction.dart';
import 'package:ray_world_game/map_loader.dart';
import 'package:ray_world_game/player.dart';
import 'package:ray_world_game/world.dart';
import 'package:ray_world_game/world_collidable.dart';

class RayWorldGame extends FlameGame with HasCollisionDetection {
  late Player _player;
  late World _world;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world = World());
    await add(_player = Player());
    _player.position = _world.size / 2;
    camera.followComponent(
      _player,
      worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y),
    );
    addWorldCollision();
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }

  void addWorldCollision() async {
    (await MapLoader.readRayWorldCollisionMap()).forEach((rect) {
      add(WorldCollidable(position: Vector2(rect.left, rect.top))
        ..width = rect.width
        ..height = rect.height);
    });
  }
}
