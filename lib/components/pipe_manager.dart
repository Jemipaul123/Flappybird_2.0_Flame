
import 'package:flame/components.dart';
import 'package:flappy_bird/components/constants.dart';
import 'package:flappy_bird/game.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'dart:math';


class PipeManager extends Component with HasGameRef<FlappyBirdGame>{

  //updation , ie create new pipes each sec
  double pipeSpawnTimer=0;
  @override
  void update(double dt) {
    // TODO: implement update
    pipeSpawnTimer +=dt;
    const double pipeInterval =2;
    if(pipeSpawnTimer> pipeInterval)
      {
        pipeSpawnTimer=0;
        spawnPipe();
      }
  }


  void spawnPipe(){
    final double screenheight =gameRef.size.y;
    const double pipegap =300;
    const double minpipeheight =50;
    const double pipewidth =60;
    final Random random = Random();


    //we must give random pipe heights

    final double maxPipeheight=
        screenheight-groundHeight-pipegap-minpipeheight;
    //height of bottom pipe => selecting between max and min
    final double bottomPipeHeight=
    minpipeheight + random.nextDouble() * (maxPipeheight -minpipeheight);



 //height of top pipe
    final double topPipeHeight =
        screenheight-groundHeight-bottomPipeHeight-pipegap;

    //creating bottom pipe
    final bottomPipe = Pipe(Vector2(gameRef.size.x, screenheight-groundHeight-bottomPipeHeight),
      Vector2(pipewidth,bottomPipeHeight),
      istoppipe: false,);
    final toppipe = Pipe(Vector2(gameRef.size.x, 0),
      Vector2(pipewidth,topPipeHeight),
      istoppipe: true,);
    gameRef.add(bottomPipe);
    gameRef.add(toppipe);
  }




}
