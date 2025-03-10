import 'package:flutter/material.dart';

import 'animated_grow_data.dart';
import 'animated_grow_direction.dart';
import 'animated_grow_horizontal.dart';
import 'animated_grow_vertical.dart';

class AnimatedGrowBase extends StatelessWidget {
  const AnimatedGrowBase({
    super.key,
    this.controller,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 700),
    this.reverseDuration,
    this.direction = GrowDirection.leftToRight,
    required this.child,
  });

  /// gc: 'G'rowAnimation'C'ontroller
  ///
  final Function(AnimationController gc)? controller;

  final Curve curve;

  final Duration duration;

  final Duration? reverseDuration;

  /// Default, [GrowDirection.leftToRight]
  ///
  final GrowDirection direction;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final AnimatedGrowData data = AnimatedGrowData(
      controller: controller,
      curve: curve,
      duration: duration,
      reverseDuration: reverseDuration ?? duration,
      direction: direction,
      child: child,
    );

    return data.isHorizontal
        ? AnimatedGrowHorizontal(data: data,)
        : AnimatedGrowVertical();
  }
}
