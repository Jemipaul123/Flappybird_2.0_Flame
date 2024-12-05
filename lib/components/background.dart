import 'package:flame/components.dart';
import 'dart:async';

class Background extends SpriteComponent{
  Background(Vector2 size):
      super(
        size:size,
        position: Vector2(0,0),
      );
@override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad
    sprite = await Sprite.load('bg_flap_night.png');
  }
}