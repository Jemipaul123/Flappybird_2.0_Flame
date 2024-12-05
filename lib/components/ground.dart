import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/constants.dart';
import 'dart:async';

import 'package:flappy_bird/game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame>,CollisionCallbacks{

  Ground():super();
  @override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad
    size= Vector2(2 * gameRef.size.x,groundHeight);
    position=Vector2(0, gameRef.size.y - groundHeight);
    sprite = await Sprite.load('ground.png');
    add(RectangleHitbox());
  }
  //add a collision box

  // move ground to the left
@override
  void update(double dt) {
    // TODO: implement update
   position.x -=groundscrollspeed *dt;

   //resetting ground for infinite scroll
  if(position.x +size.x/2 <=0)
    {
      position.x=0;
    }
  }

}