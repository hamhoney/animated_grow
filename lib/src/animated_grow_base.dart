import 'package:flutter/material.dart';

import 'animated_grow_data.dart';
import 'animated_grow_direction.dart';
import 'animated_grow_implement.dart';

abstract class AnimatedGrowBase extends StatelessWidget {
  const AnimatedGrowBase({
    super.key,
    this.controller,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 700),
    this.reverseDuration,
    this.direction = GrowDirection.leftToRight,
    this.collapsed = true,
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

  /// The widget is collapsed but still taking up space in the layout.
  ///
  /// if true and not visible but still taking space.
  ///
  /// if false and not visible never still taking space.
  ///
  ///
  /// default value is true
  final bool collapsed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final AnimatedGrowData data = AnimatedGrowData(
      controller: controller,
      curve: curve,
      duration: duration,
      reverseDuration: reverseDuration ?? duration,
      direction: direction,
      isCollapsed: collapsed,
      child: child,
    );

    return AnimatedGrowImpl(data: data,);
  }
}
