import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class WorldCollidable extends PositionComponent with CollisionCallbacks {
  WorldCollidable({super.position}) {
    add(RectangleHitbox());
  }

// @override
// Future<void> onLoad() async {
//   super.onLoad();
//   add(RectangleComponent(
//     size: size,
//     paintLayers: [Paint()..color = Colors.black],
//   ));
// }
}
