import 'package:animated_grow/src/animated_grow_direction.dart';
import 'package:flutter/material.dart';

class AnimatedGrowData {
  AnimatedGrowData({
    required this.duration,
    required this.direction,
  }) {
    isHorizontal = direction == GrowDirection.leftToRight || direction == GrowDirection.rightToLeft;
  }

  Duration duration;
  GrowDirection direction;
  late bool isHorizontal;
}