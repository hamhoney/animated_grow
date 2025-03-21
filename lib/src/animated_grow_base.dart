import 'package:flutter/material.dart';

import 'animated_grow_data.dart';
import 'animated_grow_direction.dart';
import 'animated_grow_implement.dart';

abstract class AnimatedGrowBase extends StatelessWidget {
  const AnimatedGrowBase({
    super.key,
    this.onEnd,
    this.controller,
    required this.isGrowIn,
    this.autoStart = true,
    this.delay = Duration.zero,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 850),
    this.reverseDuration,
    required this.direction,
    this.collapsed = true,
    this.fixed = false,
    this.from = 0.0,
    required this.child,
  });

  /// This only called at [AnimationStatus.completed]
  ///
  /// and not called [AnimationStatus.dismissed]
  final void Function()? onEnd;

  /// gc: 'G'rowAnimation'C'ontroller
  ///
  final void Function(AnimationController growController)? controller;

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

  /// Curves animation
  ///
  /// https://api.flutter.dev/flutter/animation/Curves-class.html
  final Curve curve;

  /// forward duration
  final Duration duration;

  /// reverse duration
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

  /// child Widget fixed when animate grow state.
  ///
  /// if true value fixed child widget.
  /// if false value non-fixed child widget.(translate user direction)
  ///
  /// default value is false
  final bool fixed;

  /// measure detail begin position.
  ///
  final double from;

  /// User child widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final AnimatedGrowData data = AnimatedGrowData(
      onEnd: onEnd,
      controller: controller,
      isGrowIn: isGrowIn,
      isAutoStart: autoStart,
      delay: delay,
      curve: curve,
      duration: duration,
      reverseDuration: reverseDuration ?? duration,
      direction: direction,
      isCollapsed: collapsed,
      isFixed: fixed,
      from: from,
      child: child,
    );

    return AnimatedGrowImpl(data: data);
  }
}
