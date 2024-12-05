import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'dart:async';

import 'package:flappy_bird/components/constants.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks{

  //starting with bird pos and size
  Bird() : super(position: Vector2(startx, starty), size: Vector2(birdheight,birdwidth));


  //other props

double velocity=0;

//loading.....

@override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad
    sprite = await Sprite.load('bird.png');

    //adding collision hit box
  add(RectangleHitbox());
  }
  //jumping.....
  void flap(){
  velocity= jumpstrength;
  }

//update velocity
@override
  void update(double dt) {
    // TODO: implement update
    velocity +=gravity*dt;
    position.y +=velocity*dt;
  }

  //colliding with any object
@override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    if(other is Ground){
      (parent as FlappyBirdGame).gameover();
    }
    if(other is Pipe){
      (parent as FlappyBirdGame).gameover();

    }
  }



}