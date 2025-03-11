import 'package:flutter/material.dart';

import 'animated_grow_direction.dart';

class AnimatedGrowData {
  AnimatedGrowData({
    required this.controller,
    required this.isGrowIn,
    required this.isAutoStart,
    required this.delay,
    required this.curve,
    required this.duration,
    required this.reverseDuration,
    required this.direction,
    required this.isCollapsed,
    required this.from,
    required this.child,
  }) {
    isHorizontal =
        direction == GrowDirection.leftToRight ||
        direction == GrowDirection.rightToLeft;
  }

  late bool isHorizontal;
  bool isGrowIn;
  bool isAutoStart;
  Duration delay;

  double from;

  final Function(AnimationController gc)? controller;
  Curve curve;
  Duration duration;
  Duration reverseDuration;
  GrowDirection direction;
  bool isCollapsed;
  final Widget child;
}
