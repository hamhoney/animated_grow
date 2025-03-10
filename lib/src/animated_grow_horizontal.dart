import 'package:animated_grow/src/animated_grow_direction.dart';
import 'package:flutter/material.dart';

import 'animated_grow_data.dart';

/// Use [AnimatedSize]
///
class AnimatedGrowHorizontal extends StatefulWidget {
  const AnimatedGrowHorizontal({
    super.key,
    required this.data,
  });

  final AnimatedGrowData data;

  @override
  State<AnimatedGrowHorizontal> createState() => _AnimatedGrowHorizontalState();
}

class _AnimatedGrowHorizontalState extends State<AnimatedGrowHorizontal> with SingleTickerProviderStateMixin {
  late final Alignment alignment;
  late final double axisAlignment = 0.0;

  late final AnimationController controller;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();

    alignment = switch (widget.data.direction) {
      GrowDirection.leftToRight => Alignment.centerLeft,
      GrowDirection.rightToLeft => Alignment.centerRight,
      _ => throw UnimplementedError(),
    };

    controller = AnimationController(
      vsync: this,
      duration: widget.data.duration,
      reverseDuration: widget.data.duration,
    );

    sizeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: widget.data.curve)
    );

    widget.data.controller?.call(controller);
    sizeAnimation.addListener(animationEventListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sizeAnimation,
      builder: (context, child) {
        return Flex(
          direction: Axis.horizontal,
          children: [SizeTransition(
            sizeFactor: sizeAnimation,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: child,
          )],
        );
      },
      child: widget.data.child,
    );
  }

  void animationEventListener() {
    print('animationEventListener... ${sizeAnimation.value}');
    setState(() {

    });
  }
}
