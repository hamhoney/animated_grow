import 'package:animated_grow/src/animated_grow_data.dart';
import 'package:flutter/material.dart';

import 'animated_grow_direction.dart';
import 'animated_grow_horizontal.dart';
import 'animated_grow_vertical.dart';

class AnimatedGrowBase extends StatelessWidget {
  const AnimatedGrowBase({
    super.key,
    this.duration,
    this.direction = GrowDirection.leftToRight,
    required this.child,
  });

  final Duration? duration;

  /// Default, [GrowDirection.leftToRight]
  ///
  final GrowDirection direction;

  final Widget child;

  @override
  Widget build(BuildContext context) {

    final AnimatedGrowData data = AnimatedGrowData(
      duration: duration ?? Duration(milliseconds: 700),
      direction: direction,
    );

    return data.isHorizontal
        ? AnimatedGrowHorizontal(data: data,)
        : AnimatedGrowVertical();
  }
}
