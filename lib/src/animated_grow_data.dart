import 'package:flutter/material.dart';

import 'animated_grow_direction.dart';

class AnimatedGrowData {
  AnimatedGrowData({
    required this.controller,
    required this.isGrowIn,
    required this.curve,
    required this.duration,
    required this.reverseDuration,
    required this.direction,
    required this.isCollapsed,
    required this.child,
  }) {
    isHorizontal =
        direction == GrowDirection.leftToRight ||
        direction == GrowDirection.rightToLeft;
  }

  late bool isHorizontal;
  bool isGrowIn;

  final Function(AnimationController gc)? controller;
  Curve curve;
  Duration duration;
  Duration reverseDuration;
  GrowDirection direction;
  bool isCollapsed;
  final Widget child;
}
