import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_manager.dart';
import 'package:flappy_bird/components/score.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'components/bird.dart';
import 'components/constants.dart';
import 'dart:async';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{


  late Bird bird;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;
  late ScoreText scoreText;
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad


    background=Background(size);
    add(background);



    bird=Bird();
    add(bird);

    ground=Ground();
    add(ground);

    pipeManager =PipeManager();
    add(pipeManager);

    scoreText=ScoreText();
    add(scoreText);

  }
 @override
 void onTap(){
    bird.flap();
 }
//game over
int score = 0;
  void incrementScore(){
    score +=1;

  }
bool isgameover =false;
  void gameover(){
    if(isgameover) return;
    isgameover=true;
    pauseEngine();
    showDialog(
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        content: Text(" High Score: $score"),
        actions: [
          TextButton(onPressed: (){
           Navigator.pop(context);
           resetGame();
          }, child:const Text("Restart"),
          )
        ],

      ),
    );
  }
  //after pausing show dialog box
  void resetGame() {
    bird.position = Vector2(startx, starty);
    bird.velocity = 0;
    score=0;
    isgameover = false;
    children.whereType<Pipe>().forEach((Pipe pipe) => pipe.removeFromParent());
    resumeEngine();
  }


}