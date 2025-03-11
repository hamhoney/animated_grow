import 'package:flutter/material.dart';

import 'animated_grow_data.dart';
import 'animated_grow_direction.dart';
import 'animated_grow_implement.dart';

abstract class AnimatedGrowBase extends StatelessWidget {
  const AnimatedGrowBase({
    super.key,
    this.controller,
    required this.isGrowIn,
    this.autoStart = true,
    this.delay = Duration.zero,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 850),
    this.reverseDuration,
    required this.direction,
    this.collapsed = true,
    this.from = 0.0,
    required this.child,
  });

  /// gc: 'G'rowAnimation'C'ontroller
  ///
  final Function(AnimationController gc)? controller;

  final bool isGrowIn;

  /// Default, [GrowDirection.leftToRight]
  ///
  final GrowDirection direction;

  /// Animate autoStart control
  ///
  /// default value is true
  final bool autoStart;

  /// delayed for [autoStart]
  ///
  /// [delay] begins only once at the widget building.
  ///
  /// default value is [Duration.zero]
  final Duration delay;

  final Curve curve;

  final Duration duration;

  final Duration? reverseDuration;

  /// The widget is collapsed but still taking up space in the layout.
  ///
  /// if true and not visible but still taking space.
  ///
  /// if false and not visible never still taking space.
  ///
  ///
  /// default value is true
  final bool collapsed;

  /// measure detail begin position.
  ///
  final double from;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final AnimatedGrowData data = AnimatedGrowData(
      controller: controller,
      isGrowIn: isGrowIn,
      isAutoStart: autoStart,
      delay: delay,
      curve: curve,
      duration: duration,
      reverseDuration: reverseDuration ?? duration,
      direction: direction,
      isCollapsed: collapsed,
      from: from,
      child: child,
    );

    return AnimatedGrowImpl(data: data);
  }
}
