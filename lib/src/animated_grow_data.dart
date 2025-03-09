import 'package:flutter/material.dart';

import 'animated_grow_direction.dart';

class AnimatedGrowData {
  AnimatedGrowData({
    required this.curve,
    required this.duration,
    required this.direction,
    required this.child,
  }) {
    isHorizontal = direction == GrowDirection.leftToRight || direction == GrowDirection.rightToLeft;
  }

  Curve curve;
  Duration duration;
  GrowDirection direction;
  late bool isHorizontal;
  final Widget child;
}