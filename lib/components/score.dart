import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flappy_bird/game.dart';
import 'package:flutter/material.dart'; // Import this package for Colors
import 'dart:async';

class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame> {
  ScoreText() : super(
    text: '0',
    textRenderer: TextPaint(
      style: TextStyle(
        color: Colors.grey.shade900,
        fontSize: 40,
      ),
    ),
  );

  @override
  FutureOr<void> onLoad() {
    position = Vector2(
      (gameRef.size.x - size.x) / 2,
      gameRef.size.y - size.y - 50,
    );
  }

  @override
  void update(double dt) {
    final newText = gameRef.score.toString();
    if (text != newText) {
      text = newText;
    }
  }
}