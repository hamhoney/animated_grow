import 'package:flutter/material.dart';

import 'animated_grow_data.dart';
import 'animated_grow_direction.dart';
import 'animated_grow_horizontal.dart';
import 'animated_grow_vertical.dart';

class AnimatedGrowBase extends StatelessWidget {
  const AnimatedGrowBase({
    super.key,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 700),
    this.direction = GrowDirection.leftToRight,
    required this.child,
  });

  final Curve curve;

  final Duration duration;

  /// Default, [GrowDirection.leftToRight]
  ///
  final GrowDirection direction;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final AnimatedGrowData data = AnimatedGrowData(
      curve: curve,
      duration: duration,
      direction: direction,
      child: child,
    );

    return data.isHorizontal
        ? AnimatedGrowHorizontal(data: data,)
        : AnimatedGrowVertical();
  }
}
