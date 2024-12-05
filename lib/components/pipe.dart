import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/constants.dart';
import 'package:flappy_bird/game.dart';
import 'dart:async';

class Pipe extends SpriteComponent with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
//check which pipe

  final bool istoppipe;
  bool scored =false;

  Pipe(Vector2 position, Vector2 size, {required this.istoppipe})
      :super(position: position, size: size);

  @override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad
    sprite =await Sprite.load(istoppipe ? 'bottom.jpg' : 'bottom.jpg');
    add(RectangleHitbox());
  }
  //update
//move to left ech sec

@override
  void update(double dt) {
    // TODO: implement update
    position.x -=groundscrollspeed * dt;
    if(position.x + size.x <=0 ){
      removeFromParent();
    }
    //checking if pipe is passed
  if(!scored && position.x + size.x < gameRef.bird.position.x)
    {
      scored =true;
    }
  if(istoppipe)
    {
      gameRef.incrementScore();
    }
  }



}