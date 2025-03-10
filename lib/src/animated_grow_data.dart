import 'package:flutter/material.dart';

import 'animated_grow_direction.dart';

class AnimatedGrowData {
  AnimatedGrowData({
    required this.controller,
    required this.curve,
    required this.duration,
    required this.reverseDuration,
    required this.direction,
    required this.child,
  }) {
    isHorizontal = direction == GrowDirection.leftToRight || direction == GrowDirection.rightToLeft;
  }

  final Function(AnimationController gc)? controller;
  Curve curve;
  Duration duration;
  Duration reverseDuration;
  GrowDirection direction;
  late bool isHorizontal;
  final Widget child;
}